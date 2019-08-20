<template>
    <div id="pro">
        <div class="nav">
            <router-link :to="{path:'/Mall'}">
                <img class="im1" src="../../assets/img/arrow-left.png" alt="">
            </router-link>
            
            <img class="im2" src="../../assets/img/ellipsis.png" alt="">
        </div>
        <mt-swipe :auto=0>
            <mt-swipe-item>
                <img :src="`http://127.0.0.1:5050/lid01.png`"/>
            </mt-swipe-item> 
            <mt-swipe-item v-for="(item,i) of items" :key="i">
                <img :src="`http://127.0.0.1:5050/${item.img}`"/>
            </mt-swipe-item> 
        </mt-swipe> 
        <div class="new" @click="drop()">
            <img src="../../assets/img/xin.png" alt="">
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            items:[],
            i:0
        }
    },
    methods:{
        loadMore(){
            var url="/details/product";
            this.axios.get(url).then(res=>{
                console.log(res.data.data);
                this.items=res.data.data;
            })
        },
        drop(e){
            e.target.style.background="red";
        },
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>
    *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    #pro{
        position: relative;
    }
    #pro .nav{
        padding: 10px;
        z-index: 2;
        width: 100%;
        box-sizing:border-box;
    }
    #pro .nav img{
        width: 8vw;
        opacity: .6;
    }
    .im2{
        float: right;
    }
    .mint-swipe{
        width:100%;
        height: 110vw;
        z-index: 1;
        text-align: center
    }
    .mint-swipe img{
        width:100%;
    }
    .mint-swipe img{
        width:100%;
    }
    .mint-swipe-item:first-child{
        width:106%;
        margin-top:-30px;
        margin-left:-3%;
    }
    .mint-swipe-item:nth-child(2){
        width:95%;
    }
    .mint-swipe >>> .mint-swipe-indicator.is-active{
        background-color:#000;
        opacity: .6;
    }
    .new{
        position: absolute;
        top:65px;
        right:20px;
        z-index: 3;
    }
    .new img{
        width: 15vw;
    }
</style>