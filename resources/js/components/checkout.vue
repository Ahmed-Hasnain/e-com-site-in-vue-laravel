<template>
    <div>
        <div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
            <div class="box">
                <h3 class="box-title">Products In Your cart</h3>
                <div class="plan-selection" v-for="item in items" :key="item.id">
                    <div class="plan-data">
                        <!-- <input id="question1" name="question" type="radio" class="with-font" value="sel"/> -->
                        <label for="question1">{{ item.name }}</label>
                        <p class="plan-text">
                           Price:  {{ item.price }}
                        </p>
                        <p class="plan-text">
                          Quantity:  {{ item.quantity }}
                        </p>
                        <p class="plan-text">
                          Total:  QTY: {{ item.quantity }} * Price: {{ item.price }} 
                        </p>

                        <span class="plan-price">${{ item.total }}</span>
                    </div>
                </div>
            </div>
            <div class="box">

                    <!--SHIPPING METHOD-->
                    <div class="panel panel-info card mt-1 p-2">
                        <div class="panel-heading">Address</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <h4>Shipping Address</h4>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Country:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" v-model="country" name="country" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-xs-12">
                                    <strong>First Name:</strong>
                                    <input type="text" name="first_name" v-model="first_name" class="form-control" value="" />
                                </div>
                                <div class="span1"></div>
                                <div class="col-md-6 col-xs-12">
                                    <strong>Last Name:</strong>
                                    <input type="text" name="last_name" v-model="last_name" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Address:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="address" v-model="address" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>City:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="city" v-model="city" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>State:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="state" v-model="state" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Zip / Postal Code:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" name="zip_code" v-model="zip_code" class="form-control" value="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Phone Number:</strong></div>
                                <div class="col-md-12"><input type="text" name="phone_number" v-model="phone_number" class="form-control" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Email Address:</strong></div>
                                <div class="col-md-12"><input type="text" name="email_address" v-model="email_address" class="form-control" value="" /></div>
                            </div>
                        </div>
                    </div>
                    <!--SHIPPING METHOD END-->

                    <!--CREDIT CART PAYMENT-->
                    <div class="panel panel-info card mt-1 p-2">
                        <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card Type:</strong></div>
                                <div class="col-md-12">
                                    <select id="CreditCardType" name="CreditCardType" class="form-control" v-model="cardType">
                                        <option value="5">Visa</option>
                                        <option value="6">MasterCard</option>
                                        <option value="7">American Express</option>
                                        <option value="8">Discover</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="card_number" v-model="card_number" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card CVV:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="card_code" v-model="card_code" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <strong>Expiration Date</strong>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="" v-model="expirationMonth">
                                        <option value="">Month</option>
                                        <option value="01">01</option>
                                        <option value="02">02</option>
                                        <option value="03">03</option>
                                        <option value="04">04</option>
                                        <option value="05">05</option>
                                        <option value="06">06</option>
                                        <option value="07">07</option>
                                        <option value="08">08</option>
                                        <option value="09">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                </select>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <select class="form-control" name="" v-model="expirationYear">
                                        <option value="">Year</option>
                                        <option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>
                                        <option value="2023">2023</option>
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <span>Pay secure using your credit card.</span>
                                </div>
                                <div class="col-md-12">
                                    <ul class="cards">
                                        <li class="visa hand">Visa</li>
                                        <li class="mastercard hand">MasterCard</li>
                                        <li class="amex hand">Amex</li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 mt-3">
                                    <button type="submit" class="btn btn-primary btn-submit-fix" v-on:click="getUserAddress()">Place Order</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--CREDIT CART PAYMENT END-->
                </div>

            <!-- <a href="#" class="btn btn-primary btn-lg mb30">Continue With Plans</a> -->
        </div>
        <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
          
            <div class="widget">
                <h4 class="widget-title">Order Summary</h4>
                <div class="summary-block">
                    <div class="summary-content" v-for="summaryItem in items" :key="summaryItem.id">
                        <div class="summary-head"><h5 class="summary-title">{{ summaryItem.name }}</h5></div>
                        <div class="summary-price">
                            <p class="summary-text">${{ summaryItem.total }}</p>
                            <!-- <span class="summary-small-text pull-right"> 
                                QTY: {{ summaryItem.quantity }} x Price: {{ summaryItem.price }}
                            </span> -->
                        </div>
                    </div>
                    <hr>
                    <div class="summary-content" >
                        <div class="summary-head"><h5 class="summary-title">Total:</h5></div>
                        <div class="summary-price">
                            <p class="summary-text">${{ cartTotal.totalAmount }}</p>
                        </div>
                    </div>
                    <!-- <div class="text-right">
                        <hr>
                        <button class="btn btn-warning">Place Order</button>
                    </div> -->

                </div>
            </div>
           
        </div>
    </div>
</div>
    </div>
</template>

<script>
export default {
    name:'checkout',
    data(){
        return{
            items:[],
            cartTotal:0,
            country:'',
            first_name:'',
            last_name:'',
            address:'',
            city:'',
            state:'',
            zip_code:'',
            phone_number:'',
            email_address:'',
            cardType:'',
            card_number:'',
            card_code:'',
            expirationMonth:'',
            expirationYear:'',

        }
    },
    methods:{
     async getCartItems(){
            let response = await axios.get('/checkout/get/items');
            this.items = response.data.FinalData;
            this.cartTotal = response.data.CartTotal;
            console.log(this.items,this.cartTotal); 
        },
       async getUserAddress(){
            if (this.first_name != '' && this.address != '' && this.card_number != '' && this.card_code != '') 
            {
                //process payment
                let response = await axios.post('/process/user/payment',
                    {
                        'country':this.country,
                        'first_name':this.first_name,
                        'last_name':this.last_name,
                        'address':this.address,
                        'city':this.city,
                        'state':this.state,
                        'zip_code':this.zip_code,
                        'phone_number':this.phone_number,
                        'email_address':this.email_address,
                        'cardType':this.cardType,
                        'card_number':this.card_number,
                        'card_code':this.card_code,
                        'expirationMonth':this.expirationMonth,
                        'expirationYear':this.expirationYear,
                        'amount': this.cartTotal,
                        'order': this.items,
                    }
                    );

                    if (response.data.status == 'success') 
                    {
                        this.$toastr.s(response.data.message);
                    }
                    else
                    {
                        this.$toastr.e(response.data.message);
                    }

                    setTimeout(()=>{
                        window.location.href='/';
                    },1000);
                    
                    console.log(response.data);
                    
            }
            else
            {
                this.$toastr.e('User Information Incomplete');
            }
        }
    },
    created(){
        this.getCartItems();
    },
}
</script>