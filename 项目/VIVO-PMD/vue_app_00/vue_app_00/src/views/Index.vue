<template>
    <div id="index">
    <!--导航栏-->
        <div v-show="show" class="black"></div>
        <my-header id="headbox"></my-header>
    <!--轮播图-->
        <my-carousel></my-carousel>
    <!--主内容-->
        <div id="content" v-for="(item,i) of items" :key="i">
            <div id="text">
                <h1 v-text="item.title"></h1>
                <div class="subtitle" v-text="item.subtitle"></div>
            </div>
            <img :src="`http://127.0.0.1:5050/content${item.img}`"/>
        </div>
    <!-- Accordion -->
        <my-accordion></my-accordion>    
    </div>
    
</template>
<script>
//引入子组件
import Header from '../components/index/Header.vue'
import Carousel from '../components/index/Carousel.vue'
import Accordion from '../components/common/Accordion.vue'
export default {
    data() {
        return {
            items:[],
            i:0,
            show:false
        }
    },
    mounted() {
        window.addEventListener('scroll',this.handleScroll);
    },
    methods:{
        handleScroll(){
            var scrollTop=document.documentElement.scrollTop || document.body.scrollTop;
            if(scrollTop>=200){
                this.show=true;
            }else if(scrollTop<200){
                this.show=false;
            }
        },
        loadMore(){
            //功能：获取数据
            //1.发送请求
            //http://127.0.0.1:5050/index
            var url="/index";//url一定要和接口一致
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
    components:{//注册子组件
        "my-header":Header,
        "my-carousel":Carousel,
        "my-accordion":Accordion
    },
}
</script>
<style lang="scss" scoped>
  *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    .black{
        width: 100vw;
        height: 14.81481vw;
        z-index: 20;
        background: rgba(0,0,0,.8);
        position: fixed;
    }
    #content{
        position:relative;
    }
    #content img{
        position: relative;
        z-index:9;
        height:80vw;
        transform:translate(-50%,0%);
        left:50%;
        display:block;
        margin-top:3px;
    }
    #text{
        position:absolute;
        width:100%;
        margin:auto;
        text-align:center;
        margin-top:10vw;
        z-index:10;
        color:#fff;
    }
    #text h1{
        font-size:7vw;
        margin:0;
        margin-bottom:10px;
    }
    .subtitle{
        font-size:4vw;
    }
    #content:last-child #text{
        color:#000;
    }
    #content:nth-child(5) #text{
        color:#000;
    }
</style>