<template>
  <div>
    <li class="nav-item">
      <a href="/checkout" class="btn btn-warning ">
        Cart {{ itemCount }}
      </a>
    </li>
  </div>
</template>

<script>
export default {
    name: 'Cart',
    data(){
        return{
            itemCount:'',
        }
    },
    mounted() {
        this.$root.$on('changeInCart',(item) =>{
            this.itemCount= item;
        });
    },
    methods:{
        async getCartItemsOnPageload(){
            let response = await axios.post('/cart');
            this.itemCount = response.data.userItemsInCart; 
            
        },
    },
    created(){
        this.getCartItemsOnPageload();
    },
};
</script>
