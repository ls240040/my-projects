<template>
    <div>
        <div class="eval" v-for="(item,index) of list" :key="index">
            <div class="main">
                <div class="infor">
                    <img :src="`http://127.0.0.1:5050/${item.img}`">
                    <div>
                        <span>{{item.vip}}</span>
                        <img :src="`http://127.0.0.1:5050/${item.vimg}`">
                        <div>{{item.vtime}}</div>
                    </div>
                    <div></div>
                </div>
                <div>{{item.eval}}</div>
                <div class="proimg">
                    <img :src="`http://127.0.0.1:5050/${item.pimg01}`">
                    <img :src="`http://127.0.0.1:5050/${item.pimg02}`">
                    <img :src="`http://127.0.0.1:5050/${item.pimg03}`">
                </div>
                <div>{{item.reply}}</div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data () {
        return {
            list:[],//保存服务器返回的评价列表
        }
    },
    methods: {
        loadMore(){
            // 功能：当组件创建成功后获取第一页数据
            // 1.创建url地址
            var url="details/evaluate";
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
    .eval{
        display: flex;
        justify-content: space-between;
        flex-direction: row;
        padding: 4vw;
        .main{
            background-color: #fff;
            border-radius: 3vw;
            padding: 1vw 3vw;
            img{
                width: 10vw;
            }
            .infor{
                display: flex;
                justify-content: space-between;
            }
            .proimg{
                img{
                    width: 33%
                }
            }
        }
    }
    
</style>