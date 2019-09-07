<template>
    <div class="container">
        <div class="eval" v-for="(item,index) of list" :key="index">
            <div class="main">
                <div class="infor">
                    <img class="m1" :src="`http://127.0.0.1:5050/${item.img}`">
                    <div>
                        <span>{{item.vip}}</span>
                        <img class="m2" :src="`http://127.0.0.1:5050/${item.vimg}`">
                        <div>{{item.vtime}}</div>
                    </div>
                    <div class="stars">
                        <img src="../../assets/img/rating.png">
                        <img src="../../assets/img/rating.png">
                        <img src="../../assets/img/rating.png">
                        <img src="../../assets/img/rating.png">
                        <img src="../../assets/img/rating.png">
                    </div>
                </div>
                <div>{{item.eval}}</div>
                <div class="proimg">
                    <div><img :src="`http://127.0.0.1:5050/${item.pimg01}`"></div>
                    <div><img :src="`http://127.0.0.1:5050/${item.pimg02}`"></div>
                    <div><img :src="`http://127.0.0.1:5050/${item.pimg03}`"></div>
                </div>
                <div><span>[官方回复]：</span>{{item.reply}}</div>
            </div>
        </div>
        <div class="more" @click="loadMore">点击加载更多</div>
    </div>
</template>
<script>
export default {
    data () {
        return {
            list:[],//保存服务器返回的评价列表
            pno:0,
        }
    },
    methods: {
        loadMore(){
            // 功能：当组件创建成功后获取第一页数据
            // 1.创建url地址
            var url="details/evaluate";
            // 1.1.将当前页码+1
            this.pno++;
            var obj={pno:this.pno};
            // 2.发送ajax请求获取第一页数据
            this.axios.get(url,{params:obj}).then(res=>{
                // 3.将数据保存在data中
                // this.list=res.data.data; 
                // 数组拼接
                var rows = this.list.concat(res.data.data);
                this.list=rows;
            })
        },
    },
    created () {
        this.loadMore();
    }
}
</script>
<style lang="scss" scoped>
    .container{
        display: flex;
        justify-content: space-between;
        flex-direction: row;
        overflow-x: scroll;
        padding: 4vw;
        height: calc(100vh-7.5rem);
        overflow-y:scroll;
    }
    .container::-webkit-scrollbar{
        display: none;
    }
    .eval{
        display: flex;
        justify-content: space-between;
        flex-direction: row;
        margin-right: 10px;
        width: 94vw;
        font-size: 4vw;
        color:#252525;
        line-height: 1.2;
        .main{
            background-color: #fff;
            border-radius: 3vw;
            padding: 3vw 3vw;
            box-shadow: 2px -1px 1px 0 rgb(230, 230, 230);
            .infor{
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
                .m1{
                    width: 10vw;
                    height: 10vw;
                    margin-top: 2vw;
                }
                .m2{
                    width: 6vw;
                }
                .stars{
                    display: flex;
                    justify-content: space-between;
                    padding: 3vw 0 0 15vw;
                    img{
                        width: 4vw;
                        height: 4vw;
                        margin-right: 4px;
                    }
                }
            }
            .proimg{
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                width: 100%;
                margin: 10px 0;
                div{
                    width: 22.5vw;
                    height: 18vw;
                    border-radius: 1vw;
                    overflow: hidden;
                    img{
                        width: 110%;
                    }
                }
            }
        }
    }
    .more{
        padding: 0 2vw;
        color:#999;
        align-self: center;
    }
</style>