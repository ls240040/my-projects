<template>
    <div id="index">
    <!--导航栏-->
        <my-header></my-header>
    <!--轮播图-->
        <my-carousel></my-carousel>
    </div>
</template>
<script>
//引入子组件
import Header from '../components/Header.vue'
import Carousel from '../components/Carousel.vue'
export default {
    data() {
        return {
                
        }
    },//注册子组件
    components:{
        "my-header":Header,
        "my-carousel":Carousel
    }
}
</script>
<style>
    
</style>