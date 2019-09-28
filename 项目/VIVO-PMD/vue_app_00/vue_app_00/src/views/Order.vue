<template>
    <div class="cart-box">
        <!-- top -->
        <div class="CartTop">
            <img src="../assets/img/arrow-ee.png" @click="back">
            <span>结算</span>
            <img src="../assets/img/menu-2-outline.png">
        </div>
        <!-- 地址 -->
        <div class="main">
            <div class="address">
                <div>添加收货地址</div>
                <img src="../assets/img/arrow-right.png">
            </div>
            <div class="payment">
                <div>支付方式</div>
                <div>
                    <b>在线支付</b>   
                    <img src="../assets/img/arrow-right.png">
                </div>
            </div>
            <div class="proList">
                <div>商品清单</div>
                <div class="pro" v-for="(item,index) of list" :key="index">
                    <img :src="`http://127.0.0.1:5050/${item.img}`">
                    <div class="proinfo">
                        <div class="lname">{{item.lname}}</div>
                        <div class="price"><i>¥</i>{{item.price.toFixed(2)}}</div>
                    </div>
                    <div class="pronum">
                        x{{item.count}}
                    </div>
                </div>
            </div>
        </div>
         <!-- 结算 -->
        <mt-tabbar fixed class="cartBottom">
            <mt-tab-item style="background-color: #fff;">
                <div class="sum">
                    <span><i>¥</i>{{total.sum.toFixed(2)}}</span>
                </div>
            </mt-tab-item>
            <mt-tab-item style="background-color: #fff;">
                <div class="account">提交订单</div>
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[],  //当前商品清单列表
            pnum:0,
            sum:0,
        }
    },
    computed:{
        total(){
            var pnum=0;
            var sum=0;
            for(var item of this.list){
                pnum+=item.count;
                sum+=item.count*item.price;
                console.log(this.list)
            }
            this.pnum=pnum;
            this.sum=sum;
            return {pnum:pnum,sum:sum};
        }
    },
    methods:{
        back(){
            this.$router.go(-1)
        },
        loadMore(){
            var url="v1/list2";
            var uid=sessionStorage.getItem("accessToken");
            var obj={uid};
            this.axios.get(url,{params:obj}).then(res=>{
               if(res.data.code==1){
                    // this.list=res.data.data;
                    // 3.1创建循环遍历res.data.data中数据
                    var rows = res.data.data;
                    // 3.3将新数组赋值list(顺序)
                    this.list = rows;
                    console.log(this.list)
                }
            })
        },
    },
    created(){
            //当前组件创建成功回调函数
            this.loadMore();
        },
}
</script>
<style lang="scss" scoped>
    *{
        font-family:"Microsoft Yahei",Arial;
    }
    .cart-box{
        background-color: #f4f4f4;
        position: relative;
        height: 100vh;
    }
    .CartTop{
        display: flex;
        justify-content: space-between;
        background-color:#212121;
        color:#eee;
        align-items: center;
        height: 15vw;
        padding: 0 4vw;
        img{
            width: 6vw
        }
        span{
            font-size: 5vw;
        }
    }
    .cartBottom{
        .account{
            margin-left: 2vw;
            line-height: 13vw;
            background-image: -webkit-gradient(linear,left top,right top,from(#E51422),to(#FF0C53));
            color:#fff;
            font-size: 4vw;
        }
        .selectall{
            color:#000;
            line-height: 13vw;
            font-size: 4vw;
            display: flex;
            align-items: center;
            flex-direction: row;
            margin-left: 2vw;
            input{
                margin-right: 2vw;
                margin-left:3vw;
                display: block;
                margin-top:1vw;
            }
        }
        .sum{
            text-align: left;
            margin-left:6vw;
            span{
                color:#f81200;
                font-size: 7vw;
                line-height: 41px;
                 i{
                    font-style: normal;
                    font-size: 5vw;
                    margin-right:5px;
                }
            }
        } 
        .account{
            width: 30vw;
            float: right;
        }
        .mint-tab-item{
            padding:0;
        }
    }
    .main{
        padding:0 3vw;
    }
        
    .address{
        background:url(../assets/img/btn-address.png) #fff 0 100% repeat-x;
        margin-top:20px;
    }
    .address,.payment{
        padding:4vw;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 4vw;
        background-color: #fff;
        img{
            height: 3vw;
            vertical-align:middle;
            opacity: .5;
        }
    }
    .payment{
        margin-top:10px;
        img{
            margin-left:5px;
        }
    }
    .proList{
        margin-top:10px;
        background-color: #fff;
        padding:4vw;
        .pro{
            margin-top:20px;
            display: flex;
            justify-content: space-between;
            font-size: 4vw;
            padding:4vw 0; 
            img{
                width: 20vw;
                margin-top:-7px;
            }
            .proinfo{
                .price{
                    line-height: 8vw;
                    color:#ff193a;
                    i{
                        font-style: normal;
                    }
                }
            }
            .pronum{
                color:#999;
            }
        }
    }
</style>