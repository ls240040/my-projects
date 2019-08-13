<template>
    <div>
        
       <mt-swipe :auto="4000">
            <mt-swipe-item v-for="(item,i) of 3" :key="i">
                <h1 v-text="p1.title">Z5 全面实力派</h1>
                <div>4800万超广角三摄|换新升级</div>
                <span>>查看详情</span>
                <span>>立即抢购</span>
                <img :src="item.src">
            </mt-swipe-item>
        </mt-swipe> 
    </div>
</template>
<script>
export default {
       data(){
           return {
               animationList:[],
           }
       },
       created(){
           this.loadAnimation();
       },
       methods:{
           loadAnimation(){
               var url="index/v1/carousel";
               this.axios.get(url).then(
                   res=>{
                       console.log(res.data.data);
                       //获得首页动画部分的9张图片
                       this.animationList=res.data.data;
                   }
               )
           }
       }
   }
</script>
<style scoped>
    .mint-swipe{
        height:85vh;
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
</style>