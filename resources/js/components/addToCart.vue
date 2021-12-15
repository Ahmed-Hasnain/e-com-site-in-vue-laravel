<template>
    <div>
        <hr>
       <button class="btn btn-warning text-center" v-on:click="addProductToCart()">Add To Cart</button>
    </div>
</template>

<script>
export default {
    name:'addToCart',
    data(){
       return{

       }
    },
    props:[
        'productId',
        'userId',
    ],
    methods:{
        async addProductToCart(){

            //checking if user logged in 
            if (this.userId == 0) 
            {
                this.$toastr.e('You Need To Login, To Add This Product In Cart');
                return;
            }

            //if user logged in then add iten to cart 
            let response = await axios.post('/cart',{'product_id':this.productId});

            this.$root.$emit('changeInCart', response.data.userItemsInCart);
        }
    },
    mounted() {
            console.log('Component mounted.')
        },
}
</script>