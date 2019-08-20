<template>
    <div id="parts">
        <h1><span>—</span> 精品配件 <span>—</span></h1>
        <div id="parpro" v-for="(item,i) of items" :key="i">
            <a href="javascript:;">
                <img :src="`http://127.0.0.1:5050/${item.img}`" alt="img">
            </a>
            <div class="info">
                <h3 class="title" v-text="`${item.title}`"></h3>
                <span class="subtitle" v-text="`${item.subtitle}`"></span>
            </div>
            <div class="price">
                <span v-cloak>¥{{item.price}}</span>
            </div>
        </div>
        <div class="more">
            <span>更多精品配件<img src="../../assets/img/arrow-right.png"></span>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            items:[],
            i:0,
        }
    },
    methods:{
        loadMore(){
            //功能：获取数据
                //1.发送请求
                //http://127.0.0.1:5050/mall/parts
            var url="/mall/parts";
            this.axios.get(url).then(res=>{
                //2.获取服务器返回的结果
                    console.log(res.data.data);
                //3.将返回结果保存
                    this.items=res.data.data;
                //保留价格后两位小数
                    for(var i=0;i<this.items.length;i++){
                        var price=this.items[i].price.toFixed(2);
                        // console.log(price);
                        this.items[i].price=price;
                    }
            })
        }
    },
    created () {
        this.loadMore();
    }
}
</script>
<style scoped>
    #parts h1{
        color:#333;
        font-weight: 400;
        font-size: 24px;
        line-height: 80px;
        text-align: center;
        background-color: #f4f4f4;
        margin:0;
    }
    #parts h1 span{
        color:#9c9c9c;
    }
    #parts .banner img{
        width: 100%;
    }
    #parpro{
        width: 50%;
        float: left;
        text-align: center;
        box-sizing: border-box;
    }
    #parpro a img{
        width: 60%;
        margin-top:40px;
    }
    #parpro h3{
        color:#333;
        padding:0 20px 0;
        font-size:14px;
        margin:20px 0 5px;
        line-height: 1.2;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp:1;
        -webkit-box-orient: vertical;
    }
    #parpro .subtitle{
        font-size:12px;
    }
    #parpro .price{
        color:#F10313;
        margin-top:30px;
        font-size:14px;
    }
    .more{
        clear: both;
        text-align: center;
        color:#333;
        padding:40px 0 20px;
        font-size:14px;
    }
    .more img{
        width:12px;
        vertical-align: -2px;
    }
</style>