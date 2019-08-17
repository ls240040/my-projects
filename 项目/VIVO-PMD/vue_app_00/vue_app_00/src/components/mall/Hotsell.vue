<template>
    <div id="hotsell">
        <h1><span>—</span> 热卖专区 <span>—</span></h1>
        <a href="javascript:;" class="banner">
            <img src="../../assets/img/hot-banner.jpg" alt="">
        </a>
    </div>
</template>
<script>
export default {
    data(){
        return{

        }
    }
}
</script>
<style scoped>
    #hotsell h1{
        color:#333;
        font-weight: 400;
        font-size: 24px;
        line-height: 80px;
        text-align: center;
        background-color: #eee;
        margin-bottom:0;
    }
    #hotsell h1 span{
        color:#bbb;
    }
    #hotsell .banner img{
        width: 100%;
    }
</style>