<template>
    <div id="pro">
        <!-- head -->
        <!-- <mt-tabbar v-model="active">
            <mt-tab-item  id="message">

            </mt-tab-item>
        </mt-tabbar> -->
        <transition name="slide-fade">
            <div class="head" v-if="show">
                <div class="head-content" :v-model="active">
                    <img src="../../assets/img/arrow-left02.png">
                    <div @click="changeState(0)" :style="{color:currentIndex[0].isSelect?'#000':'#999'}" id="message">商品</div>
                    <div @click="changeState(1)"   :style="{color:currentIndex[1].isSelect?'#000':'#999'}">评价</div>
                    <div @click="changeState(2)"   :style="{color:currentIndex[2].isSelect?'#000':'#999'}">详情</div>
                    <div @click="changeState(3)"   :style="{color:currentIndex[3].isSelect?'#000':'#999'}">推荐</div>
                    <img src="../../assets/img/ellipsis02.png"  @click="drop">
                </div>
            </div>
        </transition>
        <!-- nav -->
        <div class="nav">
            <router-link :to="{path:'/Mall'}">
                <img class="im1" src="../../assets/img/arrow-left.png" alt="">
            </router-link>
            <img class="im2" src="../../assets/img/ellipsis.png" @click="drop">
        </div>
        <!-- drop -->
        <div id="maskbox" v-show="dshow">
            <div id="dropdown">
                <router-link :to="{path:'/Mall'}">商城首页</router-link>
                <router-link :to="{path:'/Login'}">个人中心</router-link>
                <router-link :to="{path:'/Mall'}">全部分类</router-link>
                <router-link :to="{path:'/Mall'}">分享好友</router-link>
            </div>
            <div class="mask"></div>
        </div>
        <!--  -->
        <mt-tab-container v-model="active">
            <mt-tab-container-item id="message">
                <messagelist v-if="items" :items="items" :lid="lid"></messagelist>
            </mt-tab-container-item>
            <mt-tab-container-item>
                111
            </mt-tab-container-item>
            <mt-tab-container-item>
                222
            </mt-tab-container-item>
            <mt-tab-container-item>
                333
            </mt-tab-container-item>
        </mt-tab-container>
        
    </div>
</template>
<script>
import MessageList from './MessageList'
export default {
    data(){
        return{
            src:"",
            dshow:false,
            show:false,
            active:"message",
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false}
            ]
        }
    },
    components:{
        "messagelist":MessageList
    },
    mounted () {
        window.addEventListener('scroll',this.handleScroll)
    },
    methods:{
        changeState(idx){//idx：表示按钮的下标
            for(var i=0;i<this.currentIndex.length;i++){
                if(i==idx){
                    this.currentIndex[i].isSelect=true;
                }else{
                    this.currentIndex[i].isSelect=false;
                }
            }
        },
        handleScroll(){
            var scrollTop=document.documentElement.scrollTop || document.body.scrollTop
                scrollTop>50 ? this.show=true :　this.show=false

        },
        drop(){
            this.dshow=!this.dshow;
        },
    },
    props:{
        lid:{default:""},
        items:{default:""},
    }
}
</script>
<style lang="scss" scoped>
*{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    .slide-fade-enter-active {
        animation: bounce-in .3s;
    }
    .slide-fade-leave-active {
        animation: bounce-in .3s reverse;
    }
    @keyframes bounce-in {
        0% {
            opacity: 0;
        }
        25%{
            opacity: 0.3;  
        }
        50% {
            opacity: 0.6;
        }
        75%{
            opacity: 0.8;
        }
        100% {
            opacity: 1;
        }
    }
    .head{
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 50px;
        background: #fff;
        z-index: 100;
    }
    .head-content{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 3vw;
        img{
            width: 4vw;
            &:last-child{
                width: 6vw;
            }
        }
        div{
            line-height: 50px;
            color:#999;
        }
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
        #dropdown{
        position:fixed;
        background-color: #fff;
        z-index: 999;
        padding: 1rem 3rem;
        right:20px;
        top:20vw;
    }
    #dropdown a{
        color:#999;
        display: block;
        outline: 0;
        line-height: 3rem;
        text-decoration: none;
    }
    .mask{
        position: fixed;
        background-color: rgba(0,0,0,.5);
        z-index: 998;
        width: 100%;
        height: 92%;
        bottom:0
    }
</style>