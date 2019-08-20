<template>
    <div id="mall">
        <!-- head -->
        <my-head></my-head>
        <!-- section-bg -->
        <div id="section-bg">
            <img src="../assets/img/section-bg.png" alt="">
        </div>
        <!-- carousel -->
        <my-mcarousel></my-mcarousel>
        <!-- icos -->
        <div id="icos" v-for="(item,i) of items" :key="i">
           <a href="javascript:;"><img :src="`http://127.0.0.1:5050/${item.img}`"/></a> 
        </div>
        <!-- V抢购 -->
        <my-vrush></my-vrush>
        <!-- hotsell -->
        <my-hotsell></my-hotsell>
        <!-- boutique -->
        <my-boutique></my-boutique>
        <!-- parts -->
        <my-parts></my-parts>
    </div>
</template>
<script>
import Head from "../components/common/Head.vue"
import Mcarousel from "../components/mall/Mcarousel.vue"
import Vrush from "../components/mall/Vrush.vue"
import Hotsell from "../components/mall/Hotsell.vue"
import Boutique from "../components/mall/Boutique.vue"
import Parts from "../components/mall/Parts.vue"
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
                //http://127.0.0.1:5050/mall/micos
            var url="/mall/micos";
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
    components:{
        "my-head":Head,
        "my-mcarousel":Mcarousel,
        "my-vrush":Vrush,
        "my-hotsell":Hotsell,
        "my-boutique":Boutique,
        "my-parts":Parts,
    }
}
</script>
<style scoped>
    *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    #section-bg img{
        width: 100%;
        margin-top: 14.81481vw;
    }
    #icos{
        display:inline-block;
        width:25%;
        text-align: center;
        margin-top:10px;
    }
    #icos img{
        width: 60%;
    }
</style>