<template>
    <div id="pro">
        <!-- head -->
        <transition name="slide-fade">
            <div class="head" v-if="show">
                <div class="head-content">
                    <router-link :to="{path:'/Mall'}">
                        <img src="../../assets/img/arrow-left02.png">
                    </router-link>
                    <a href="javascript:;" :class="active=='#content1'?'active':''" @click="toTarget('#content1')">商品</a>
                    <a href="javascript:;" :class="active=='#content2'?'active':''" @click="toTarget('#content2')">评价</a>
                    <a href="javascript:;" :class="active=='#content3'?'active':''" @click="toTarget('#content3')">详情</a>
                    <a href="javascript:;" :class="active=='#content4'?'active':''" @click="toTarget('#content4')">推荐</a>
                    <img src="../../assets/img/ellipsis02.png" @click="drop">
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
        <!-- messagelist -->
        <messagelist v-if="items" :items="items" :lid="lid" id="content1"></messagelist>
        <evaluate  v-if="items.lid" :lid="lid" id="content2"></evaluate>
        <introduce  v-if="items.lid" :lid="lid" id="content3"></introduce>
        <recommend id="content4"></recommend>
    </div>
</template>
<script>
import MessageList from './MessageList'
import Evaluate from './Evaluate'
import Introduce from './Introduce'
import Recommend from './Recommend'
export default {
    data(){
        return{
            src:"",
            dshow:false,
            show:false,
            active:"#content1",
        }
    },
    components:{
        "messagelist":MessageList,
        "evaluate":Evaluate,
        "introduce":Introduce,
        "recommend":Recommend
    },
    mounted () {
        //一次性计算赋值，减少滚动计算节点位置次数
        this.distance_content1 = document.querySelector('#content1').offsetTop
        this.distance_content2 = document.querySelector('#content2').offsetTop 
        this.distance_content3 = document.querySelector('#content3').offsetTop
        this.distance_content4 = document.querySelector('#content4').offsetTop 
        this.$nextTick(function () {
            document.querySelector('#pro').addEventListener('scroll', this.onScroll)
            document.querySelector('#pro').addEventListener('scroll', this.handleScroll)
        })
    },
    methods:{
        handleScroll(){
            let scrolled = document.querySelector('#pro').scrollTop
            if (scrolled > 60) {
                this.show=true
            } else {
                 this.show=false
            }
        },
        drop(){
            this.dshow=!this.dshow;
        },
        toTarget(target){
            console.log(target)
            this.active = target
            let toElement = document.querySelector(target);
            let container = document.querySelector('#pro');
            toElement.scrollIntoView({behavior: "smooth", block: "start",inline: "nearest"});
        },
          onScroll () {
            let scrolled = document.querySelector('#pro').scrollTop
            if (scrolled < this.distance_content2) {
                this.active = "#content1"
            } else if (scrolled >= this.distance_content2 && scrolled < this.distance_content3) {
                this.active = "#content2"
            } else if (scrolled >= this.distance_content3 && scrolled < this.distance_content4) {
                this.active = "#content3"
            } else if(scrolled >= this.distance_content3 && scrolled < this.distance_content4) {
                this.active = "#content4"
            }else {
                this.active = "#content4"
            }
        }
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
            width: 6vw;
            vertical-align: middle;
            opacity: .6;
        }
        a{
            text-decoration: none;
            line-height: 50px;
            color:#999;
            &.active{
                color:#252525;
            }
            img{
                 width: 4vw;
                 vertical-align: middle;
                 opacity: 1;
            }
        }
    }

    #pro{ //关键代码，需要给容器添加高度
        position: relative;
        background-color: #f4f4f4;
        padding-bottom: 20vw;
        width: 100%; //!!!
        height: 100vh; //!!!
        overflow-y: scroll; //!!!
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
        height: 93%;
        bottom:0
    }
</style>