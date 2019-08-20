<template>
    <div style="width:100%;">
       <mt-swipe :auto="4000">
            <mt-swipe-item v-for="(item,i) of items" :key="i">
                <div id="text">
                    <h1 v-text="item.title"></h1>
                    <div class="subtitle" v-text="item.subtitle"></div>
                </div>
                <img :src="`http://127.0.0.1:5050/${item.img}`"/>
            </mt-swipe-item> 
        </mt-swipe> 
    </div>
</template>
<script>
export default {
       data(){
           return {
               items:[],
               i:0 
           }
       },
        methods:{
            loadMore(){
                //功能：获取数据
                //1.发送请求
                //http://127.0.0.1:5050/carousel
                var url="/carousel";//url一定要和接口一致
                this.axios.get(url).then(res=>{
                    //2.获取服务器返回的结果
                    console.log(res.data.data);
                    //3.将返回结果保存
                    this.items=res.data.data;
                })
                
            }
       },
       created(){
           this.loadMore();
        },
   }
</script>
<style scoped>
    @media (max-width:767px){
        .mint-swipe{
            width:100%;
            height:150vw;
        }
        .mint-swipe >>> .mint-swipe-indicator{
            width: 44px;
            height: 4px;
        }
    }   
    @media (min-width:768px) and (max-width:1024px){
        .mint-swipe{
            width:100%;
            height:110vh;
        }
        .mint-swipe >>> .mint-swipe-indicator{
            width: 80px;
            height: 6px;
        }
    } 
    .mint-swipe{
        color:#fff;
    }
   
    .mint-swipe >>> .mint-swipe-indicator{
        display: inline-block;
        border-radius: 0%;
        background: #000;
        opacity: 0.2;
        margin: 0 0px;
    }
    .mint-swipe >>> .mint-swipe-indicator.is-active{
        background-color:#fff;
    }
    .mint-swipe img{
        width:100%;
    }
    .mint-swipe #text{
        position:absolute;
        width:100%;
        margin:auto;
        text-align:center;
        margin-top:20vw;
    }
    h1{
        font-size:7vw;
        margin:0;
        margin-bottom:10px;
    }
    span{
        font-size:4vw;
    }
    .buy[data-v-70b9d920]{
        font-size:4vw;
        padding-top:40px;
    }
    .mint-swipe img{
        width:100%;
    }
</style>