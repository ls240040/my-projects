<template>
    <div id="details">
        <!-- 商品 -->
        <my-product v-if="items" :items="items" :lid="lid">
        </my-product>
        <!-- 底部导航栏 -->
        <mt-tabbar fixed>
            <!-- 第一个按钮 -->
            <mt-tab-item id="home" @click.native="linkTo1()">
                <img slot="icon" src="../assets/img/home.png" alt="">
                首页
            </mt-tab-item>
            <!-- 第一个按钮 -->
            <mt-tab-item id="service" @click.native="linkTo2()">
                <img slot="icon" src="../assets/img/service.png" alt="">
                客服
            </mt-tab-item>
            <!-- 第一个按钮 -->
            <mt-tab-item id="cart" @click.native="linkTo3()">
                <img slot="icon" src="../assets/img/cart.png" alt="">
                购物车
            </mt-tab-item>
            <div class="insertCart" @click="addcart">
                <router-link to="" :data-lid="items.lid" :data-price="items.price" :data-lname="items.title" :data-img="items.img01">加入购物车</router-link> 
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
            items:"",
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
            //功能：获取数据
                //1.发送请求
                //http://127.0.0.1:5050/details/product?lid=1
            var url="/details/product";
            var obj={lid:this.lid}; //传递lid参数给details.js
            this.axios.get(url,{params:obj}).then(res=>{ //把obj发送给服务器获得返回数据
                // console.log(res.data.data);
                this.items=res.data.data[0]; //保存ajax数据
            })
        },
        addcart(event){
            //功能：将商品添加至购物车
            //1.获取购物车中数据lid,lname,price
            var lid=event.target.dataset.lid;
            var lname=event.target.dataset.lname;
            var price=event.target.dataset.price;
            var uid=sessionStorage.getItem("accessToken");
            var img=event.target.dataset.img;
            console.log(lid,lname,price,img,uid);
            var url="v1/addcart";
            var obj={lid,lname,price,img,uid};
            //发送ajax请求
            this.axios.get(url,{params:obj}).then(res=>{
                console.log(res);
               if(res.data.code==1){
                    this.$messagebox("消息","添加成功").then(res=>{
                        //跳转登录组件
                         this.$router.push('/Cart');
                    })
                }else{
                    this.$messagebox("消息","请先登录")
                } 
            })

        }
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