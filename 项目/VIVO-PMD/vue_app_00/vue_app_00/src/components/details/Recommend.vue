<template>
    <div>
        <div class="top">
            <hr>
            <div>为您推荐</div>
        </div>
        <div class="probox">
            <div v-for="(item,index) of list" :key="index" class="pros">
                <img :src="`http://127.0.0.1:5050/${item.img}`">
                <p>{{item.names}}</p>
                <p class="price"><i>¥</i>{{item.price}}</p>
            </div>
        </div>
        <p class="bottom">已经到底了~</p>
    </div>
</template>
<script>
export default {
    data () {
        return {
            list:[]
        }
    },
    methods: {
        loadMore(){
            // 功能：当组件创建成功后获取第一页数据
            // 1.创建url地址
            var url="details/recommend";
            // 2.发送ajax请求获取第一页数据
            this.axios.get(url).then(res=>{
                // 3.将数据保存在data中
                this.list=res.data.data; 
                console.log(this.list)
            })
        },
    },
    created () {
        this.loadMore();
    }
}
</script>
<style lang="scss" scoped>
    .top{
        padding: 3vw;
        position: relative;
        color:#999;
        hr{
            position: absolute;
            top: 70%;
            z-index: 1;
            width: 90vw;
            margin: auto;
            opacity: .5;
        }
        div{
            position: absolute;
            background: #f4f4f4;
            padding: 2vw;
            top:0;
            width: 24vw;
            text-align: center;
            z-index: 2;
            margin: auto;
            box-sizing: border-box;
            left:50%;
            margin-left:-12vw;
            font-size: 4vw;
        }
    }
    .probox{
        padding: 3vw;
        justify-content: space-between;
        flex-wrap: wrap;
        display: flex;
    }
    .pros{
        width: 39vw;
        padding:0 3vw;
        background-color: #fff;
        border-radius: 3vw;
        margin-bottom: 10px;
        p{
            font-size: 2vw;
            text-overflow: ellipsis;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp:1;
            -webkit-box-orient: vertical;
        }
        img{
            width: 36vw;
        }
        .price{
            color:#999;
        }
        i{
            font-style: normal;
            font-size: 1vw;
        }
    }
    .bottom{
        color:#999;
        font-size: 2vw;
        text-align: center;
    }
</style>