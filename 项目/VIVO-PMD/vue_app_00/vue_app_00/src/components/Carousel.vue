<template>
    <div>
       <mt-swipe :auto="4000">
            <mt-swipe-item v-for="(item,i) of items" :key="i">
                <div id="text">
                    <h1 v-text="item.title"></h1>
                    <div class="subtitle" v-text="item.subtitle"></div>
                    <span class="buy">>立即抢购</span>
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
                var url="/index/carousel";
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
    .mint-swipe{
        height:85vh;
        color:#fff;
    }
   
    .mint-swipe >>> .mint-swipe-indicator{
        width: 44px;
        height: 4px;
        display: inline-block;
        border-radius: 0%;
        background: #000;
        opacity: 0.2;
        margin: 0 0px;
    }
    .mint-swipe >>> .mint-swipe-indicator.is-active{
        background-color:#fff;
    }
    .mint-swipe #text{
        position:absolute;
        width:100%;
        margin:auto;
        border:1px solid red;
        text-align:center;
        margin-top:15vw;
    }
    h1{
        font-size:26px;
    }
    span{
        font-size:20px;
    }
    .buy{
        font-size:20px;
    }
    .mint-swipe img{
        width:100%;
    }
</style>