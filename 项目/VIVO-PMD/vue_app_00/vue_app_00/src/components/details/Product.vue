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
        <!-- new-logo -->
        <div class="new">
            <img src="../../assets/img/xin.png" alt="">
        </div>
        <!-- infos -->
        <div class="infos">
            <h1 v-cloak><span>¥</span>{{items[lid].price}}</h1>
            <div>
                <h3 v-text="items[lid].title"></h3>
                <a href="javascript:;">
                    <img src="../../assets/img/collect.png">
                </a>
            </div>
            <span class="s1" v-text="items[lid].info"></span>
            <p class="subinfo" v-text="items[lid].subinfo"></p>
            <p class="discount" v-text="items[lid].discount"></p>
            <div class="specif-box">
                <div class="name">规格</div>
                <div class="container">
                    <img src="../../assets/img/spec.jpg" alt="">
                </div>
            </div>
        </div>
        <!-- activity -->
        <div class="activity">
            <div class="name"><span>活动</span></div>
            <div class="content">
                <p><label>整点购</label>包含7个整点购</p>
                <p><label>购机抽免单</label>多重好礼，综合中奖率99%</p>
                <ul>
                    <li><a href="javascript:;">下单赠券</a></li>
                    <li><a href="javascript:;">积分</a></li>
                    <li><a href="javascript:;">12期免息</a></li>
                    <li><a href="javascript:;">赠品</a></li>
                </ul> 
            </div>
        </div>
        <!-- actived -->
        <div class="spec-act">
            <div class="actived">
                <div class="name">已选</div>
                <div v-text="items[lid].specs"></div>
            </div>
            <ul>
                <li>顺丰急速达</li>
                <li>7天包退换</li>
                <li>全国联保</li>
            </ul>
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
        title:{default:""},
        info:{default:""},
        subinfo:{default:""},
        discount:{default:""},
        specs:{default:""},
    },
    created(){

    }
}
</script>
<style scoped>
    *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
     ul li{
         list-style: none;
    }
    ul li a{
        text-decoration: none;
    }
    [v-cloak]{
        display: none;
    }
    #pro{
        position: relative;
        background-color: #f4f4f4;
        padding-bottom: 20vw;
    }
    #pro .nav{
        padding: 10px;
        z-index: 2;
        width: 100%;
        box-sizing:border-box;
        position: fixed
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
        text-align: center;
        padding-top: 2rem
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
        top:2rem;
        right:20px;
        z-index: 3;
    }
    .new img{
        width: 15vw;
    }
    .infos{
        width: 92vw;
        background-color: #fff;
        margin: auto;
        border-radius: 3vw;
        padding:1vw 3vw;
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
        font-size: 1.5rem;
        margin-bottom: .7rem
    }
    .infos h1 span{
        font-size: 1rem;
        vertical-align: top;
    }
    .infos a img{
        width: 6vw;
        float: right
    }
    .infos .s1{
        font-size: .7rem;
        color:#FF5E72;
        display: block;
        margin-top: .5rem;
        padding-right: 1.8rem;
        line-height: 1.5;
    }
    .subinfo,.discount{
        font-size: .7rem;
        color:#999;
        margin: 0px;
        line-height: 1.5;
        padding-right: 1.8rem;
    }
    .discount{
        color:#EF001E;
    }
    .specif-box,.activity,.actived{
        display: flex;
        flex-flow: nowrap;
        width: 92vw;
        background-color: #fff;
        margin: auto;
        border-radius: 3vw;
        box-sizing: border-box;
    }
    .specif-box img{
        height: 20vw;
        display: block;
        margin-left: 1rem;
    }
    .specif-box .name{
        line-height:20vw;
    }
    .name{
        color:#999;
        padding: 0 .6rem;
        flex-shrink: 0; 
        text-align: center;
        font-size: .8rem;
    }
    .container{
        overflow-x: scroll;
    }
    .container::-webkit-scrollbar{
        display: none;
    }
    .activity,.actived{
        margin-top:1rem;
        padding:1vw 3vw;
        font-size: .8rem;
    }
    .activity ul{
        overflow: hidden;
        padding: 0;
        margin: 0;
        margin-top:.2rem;
    }
    .activity ul li{
        float: left;
        border: 1px solid rgba(255,104,123,.55);
        border-radius: 10px;
        padding:4px 5px;
        margin-right: 1rem;
    }
    .activity ul li a{
        color:#EF001E;
        font-size: .7rem;
    }
    .activity p{
        margin: 0;
        line-height: 1.5rem
    }
    .activity p label{
        border: 1px solid rgba(255,104,123,.55);
        border-radius: 10px;
        padding:0px 5px;
        margin-right: 1rem;
        color:#EF001E;
    }
    .activity .name,.activity .content{
        margin-top:1rem;
    }
    .activity .name span{
        padding-top:5px;
        display: block;
    }
    .activity .content{
        font-size: .7rem;
        margin-left: 1rem;
        padding-bottom: 5vw;
    }
    .actived{
        padding:6vw 3vw;
        border-bottom-right-radius:0;
        border-bottom-left-radius:0;
        border-bottom: 1px solid rgb(236, 236, 236);
    }
    .actived .name{
        margin-right:1rem;
    }
    .spec-act ul{
        width: 92vw;
        margin: auto;
        padding:5vw 3vw 12vw;
        border-bottom-right-radius:3vw;
        border-bottom-left-radius:3vw;
        background-color: #fff;
        box-sizing: border-box;
        position: relative;
    }
    .spec-act ul li{
        float: left;
        margin-right: 1rem;
        margin-left: 1rem;
        font-size: .6rem;
        color:#999;
    }
    .spec-act ul li::before{
        content: "";
        width:5px;
        height: 5px;
        background: #ff5e72;
        border-radius: 50%;
        vertical-align: center;
        position: absolute;
        margin-left:-.6rem;
        margin-top:.3rem
    }
</style>