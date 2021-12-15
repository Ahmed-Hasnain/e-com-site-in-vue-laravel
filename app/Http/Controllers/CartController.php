<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Cart;
use App\Models\Processing;
use Stripe;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('pages.checkout');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Get User Items In The cart
        $userCartItems = Cart::where('user_id',auth()->user()->id)->sum('quantity');

        if (!$request->get('product_id')) {
            
            return response()->json(
                [
                    'message' => 'Cart Count',
                    'userItemsInCart' => $userCartItems,
                ]);
    
        }
       
        //Getting product data
        $product = Product::find($request->get('product_id'));
        
        //If product already exists in cart
        $productFoundInCart= Cart::where('product_id',$request->get('product_id'))->pluck('id');


        if ($productFoundInCart->isEmpty()) {
             //Adding product in cart
            $cart = Cart::create([
                'product_id'=> $request->get('product_id'),
                'user_id' => auth()->user()->id,
                'quantity' => 1,
                'price' => $product->sale_price,
            ]);
            $msg = 'Product Is Added In The Cart';
        } else {
             //Updating quantity in cart
             $cart = Cart::where('product_id',$request->get('product_id'))
                    ->increment('quantity');
             $msg = 'Product Quantity Is Updated In The Cart';
        }

        //Get User Items In The cart
        $userCartItems = Cart::where('user_id',auth()->user()->id)->sum('quantity');
        
        if ($cart) {
            return response()->json(
                [
                    'message' => $msg,
                    'userItemsInCart' => $userCartItems,
                ]);
        }
       
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function getCartItemsForCheckout(){

        $cartItems = Cart::with('product')->where('user_id',auth()->user()->id)->get();
        $finalData = [] ;
        $CartTotal= [];
        $totalAmount=0;
        if (isset($cartItems)) 
        {
            foreach ($cartItems as $cartItem)
            {
                if ($cartItem->product) {

                    foreach ($cartItem->product as $cartProduct) {
                        if ($cartProduct->id == $cartItem->product_id) {
                            $finalData[$cartItem->product_id]['id']=$cartProduct->id;
                            $finalData[$cartItem->product_id]['price']=$cartItem->price;
                            $finalData[$cartItem->product_id]['quantity']=$cartItem->quantity;
                            $finalData[$cartItem->product_id]['total']=$cartItem->quantity * $cartItem->price;
                            $finalData[$cartItem->product_id]['name']=$cartProduct->name;
                            $totalAmount += $cartItem->quantity * $cartItem->price;
                            $CartTotal['totalAmount']=$totalAmount;

                        } 
                    }    
                }     
            }
           // dd($finalData);
        }
       
        return response()->json(
            [
                'message' => 'Hi from getCartItemsForCheckout function',
                'FinalData' => $finalData,
                'CartTotal' => $CartTotal,
            ]);
    }

    public function processPayment(Request $request)
    {   
        $address = $request->get('address');
        $cardType = $request->get('cardType');
        $card_code = $request->get('card_code');
        $card_number = $request->get('card_number');
        $city = $request->get('city');
        $country = $request->get('country');
        $email_address = $request->get('email_address');
        $expirationMonth = $request->get('expirationMonth');
        $expirationYear = $request->get('expirationYear');
        $first_name = $request->get('first_name');
        $last_name = $request->get('last_name');
        $phone_number = $request->get('phone_number');
        $state = $request->get('state');
        $zip_code = $request->get('zip_code');
        $amount = $request->get('amount');
        $orders = $request->get('order');

        //Getting Order Details
        $orderArray = [];
        foreach ($orders as $order) {
            if ($order['id']) {
                $orderArray[$order['id']]['order_id'] = $order['id'];
                $orderArray[$order['id']]['qty'] = $order['quantity'];
            }
        }


        //Process Payment
        $stripe = Stripe::make('sk_test_51K6hdwSDD0SF5dxMLlRPbsaqaS2wrUs654gkgwD6OpvbG1Dzjs2JoCVyWFAxoDbRy4tdV2WKs5cJwDDQdzXXVmty00nN0K511c');

        $token = $stripe->tokens()->create([
            'card'=>[
                'number'=> $card_number,
                'cvc'=> $card_code,
                'exp_month'=> $expirationMonth,
                'exp_year'=> $expirationYear,
                ],
        ]
    );

        if (!$token['id']) {
            session()->flush('error','Stripe token generation failed.');
            return;
        }

        //Create a customer stripe 
        $customer =  $stripe->customers()->create([
            'name' => $first_name.' '.$last_name,
            'email' => $email_address,
            'phone' => $phone_number,
            'address'=> [
                'line1' => $address,
                'postal_code' => $zip_code,
                'city' => $city,
                'state' => $state,
                'country' => $country
            ],
            'shipping' => [
                'name' => $first_name.' '.$last_name,
                'address'=> [
                    'line1' => $address,
                    'postal_code' => $zip_code,
                    'city' => $city,
                    'state' => $state,
                    'country' => $country
                ],
            ],
            'source' => $token['id'],
        ]);

        //Code for Charging the Client In Stripe 
        $charge = $stripe->charges()->create([
            'customer' => $customer['id'],
            'currency' => 'USD',
            'amount' => $amount['totalAmount'],
            'description' => 'Payment for order',
        ]);

        if ($charge['status'] == "succeeded") {
            
            //Capture The Details From Stripe 
            $customerIdStripe = $charge['id'];
            $amountRecevied = $charge['amount'];

            //Adding Payment details in Processing Table
            $processingDetails = Processing::create([
                'client_id' => auth()->user()->id,
                'client_name' => $first_name.' '.$last_name,
                'client_address' => json_encode([
                                        'line1' => $address,
                                        'postal_code' => $zip_code,
                                        'city' => $city,
                                        'state' => $state,
                                        'country' => $country
                                    ]),
                'order_details' =>json_encode($orderArray),
                'amount' => $amount['totalAmount'],
                'currency' => $charge['currency'],
            ]);

            //Empty the cart after payment successfull
            if ($processingDetails) {

                Cart::where('user_id' , auth()->user()->id)->delete();
                return response()->json(
                    [
                        'status' => 'success',
                        'message' => 'Order completed successfully',
                    ]);
            }
        }
        else{
                return response()->json(
                    [
                        'status' => 'failed',
                        'message' => 'Order Failed, Contact support',
                    ]);
        }

        
    }
}
