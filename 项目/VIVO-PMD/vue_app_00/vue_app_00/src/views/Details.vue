<template>
    <div id="details">
        <!-- 商品 -->
        <my-product v-if="items[lid] && items[lid].price" :items="items" :price="price" :title="title" :lid="lid">
        </my-product>
        <!-- 底部导航栏 -->
        <mt-tabbar fixed>
            <!-- 第一个按钮 -->
            <mt-tab-item id="home" @click.native="linkTo1()">
                <img slot="icon" src="../assets/img/home.png" alt="">
                首页
            </mt-tab-item>
            <!-- 第一个按钮 -->
            <mt-tab-item id="service" @click.native="linkTo1()">
                <img slot="icon" src="../assets/img/service.png" alt="">
                客服
            </mt-tab-item>
            <!-- 第一个按钮 -->
            <mt-tab-item id="cart" @click.native="linkTo2()">
                <img slot="icon" src="../assets/img/cart.png" alt="">
                购物车
            </mt-tab-item>
            <div class="insertCart">
                <router-link :to="{path:'/Cart'}">加入购物车</router-link> 
            </div>
            <div class="toBuy">
                <router-link :to="{path:'/Buy'}">立即购买</router-link> 
            </div>
        </mt-tabbar>
    </div>
</template>
<script>
import Product from "../components/details/Product.vue"
export default {
    data(){
        return{
            items:[],
            price:"",
            title:""
        }
    },
    methods:{
        linkTo1(){
            this.$router.push("/Mall")
        },
        linkTo2(){
            this.$router.push("/Mall")
        },
        linkTo3(){
            this.$router.push("/Cart")
        },
        loadMore(){
            var url="/details/product";
            var obj={lid:this.lid}; //传递lid参数
            this.axios.get(url,{params:obj}).then(res=>{ //把obj发送给服务器获得返回数据
                console.log(res.data.data);
                this.items=res.data.data; //保存ajax数据
            })
        },
    },
    created(){
        this.$nextTick(function(){
            this.loadMore();
        });
    },
    components:{
        "my-product":Product
    },
    //在这里接收 路由传参
    props:{
        lid:{default:""}
    }
}
</script>
<style scoped>
.mint-tabbar.is-fixed{
    height:50px;
    color:#707070;
    line-height: .8;
}
    .insertCart,.toBuy{
        width: 110px;
        text-align: center;
    }
    .insertCart{
        background-color: #444;
        margin-left:20px;
    }
    .toBuy{
        background-image: -webkit-gradient(linear,left top,right top,from(#E51422),to(#FF0C53));
    }
    .insertCart a,.toBuy a{
        text-decoration: none;
        color:#fff;
        font-weight: 700;
        line-height: 50px;
    }
</style>