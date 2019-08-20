<template>
    <div id="hotsell">
        <h1><span>—</span> 热卖专区 <span>—</span></h1>
        <router-link to="javascript:;" class="banner">
            <img src="../../assets/img/hot-banner.jpg" alt="">
        </router-link>
        <div id="hotpro">
            <router-link :to="`${item.href}`"  v-for="(item,i) of items" :key="i">
                <img :src="`http://127.0.0.1:5050/${item.img}`" alt="">
            </router-link>
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
            //功能：获取数据
                //1.发送请求
                //http://127.0.0.1:5050/mall/hotsell
            var url="/mall/hotsell";
             this.axios.get(url).then(res=>{
                    //2.获取服务器返回的结果
                    console.log(res.data.data);
                    //3.将返回结果保存
                    this.items=res.data.data;
            })
        }
    },
    created () {
        this.loadMore();
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
        background-color: #f4f4f4;
        margin-bottom:0;
    }
    #hotsell h1 span{
        color:#9c9c9c;
    }
    #hotsell .banner img{
        width: 100%;
    }
    #hotpro a img{
        width: 50%;
    }
</style>