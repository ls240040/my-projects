<template>
    <div id="pro">
        <!-- nav -->
        <div class="nav">
            <router-link :to="{path:'/Mall'}">
                <img class="im1" src="../../assets/img/arrow-left.png" alt="">
            </router-link>
            <img class="im2" src="../../assets/img/ellipsis.png" alt="">
        </div>
        <!-- mt-swipe -->
        <mt-swipe :auto=0>
            <!-- <mt-swipe-item>
                <img :src="`http://127.0.0.1:5050/lid01.png`"/>
            </mt-swipe-item>  -->
            <mt-swipe-item v-for="(item,lid) of items" :key="lid">
                <img :src="`http://127.0.0.1:5050/${item.img}`"/>
            </mt-swipe-item> 
        </mt-swipe> 
        <div class="new">
            <img src="../../assets/img/xin.png" alt="">
        </div>
        <div class="infos">
            <h1 v-cloak><span>¥</span>{{items[lid].price}}</h1>
            <h3 v-text="items[lid].title"></h3>
            <a href="javascript:;">
                <img src="../../assets/img/collect.png">
            </a>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            src:"",
        }
    },
    props:{
        lid:{default:""},
        items:{default:""},
        price:{default:""},
        title:{default:""}
    },
    created(){

    }
}
</script>
<style scoped>
    *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    [v-cloak]{
        display: none;
    }
    #pro{
        position: relative;
        background-color: #f4f4f4;
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
        height: 100vw;
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
        width:100%;
        margin-top:-30px;
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
    .infos{
        width: 94vw;
        background-color: #fff;
        margin: auto;
        border-radius: 3vw;
        padding: 3vw;
        box-sizing: border-box;
    }
    .infos h3{
        display: inline;
        font-weight: 400;
        font-size: 1.2rem
    }
    .infos h1{
        color:#F10313;
        font-weight: 400;
        font-size: 1.5rem
    }
    .infos h1 span{
        font-size: 1rem;
        vertical-align: top
    }
    .infos a img{
        width: 6vw;
        float: right
    }
</style>