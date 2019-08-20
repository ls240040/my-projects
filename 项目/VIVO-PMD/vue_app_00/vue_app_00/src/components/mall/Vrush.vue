<template>
    <div>
        <div id="vtime">
            <img src="../../assets/img/V-logo.png" alt="">
        </div>
        <div id="vrush">
            <div class="vpro" v-for="(item,i) of items" :key="i">
                <a href="javascript:;">
                    <img :src="`http://127.0.0.1:5050/${item.img}`" alt="">
                </a>
                <div class="info">
                    <div class="name" v-text="`${item.title}`"></div>
                </div>
                <div class="price">
                    <strong v-cloak><i>¥</i><span class="s1">{{item.price}}</span></strong>
                    <span class="s2" v-cloak><em>¥</em>{{item.subprice}}</span>
                </div>
            </div>
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
            var url="/mall/vrush";
            this.axios.get(url).then(res=>{
                console.log(res.data.data);
                this.items=res.data.data;
            })
        }
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>
    #vtime{
        padding: 2rem 1rem 1rem;
    }
    #vtime img{
        width: 4rem;
    }
    #vrush{
        padding: 0 1rem 2rem;
        clear: both;
        display: flex;
        flex-flow: nowrap;
        overflow-x: scroll;
    }
    #vrush::-webkit-scrollbar{
        display: none;
    }
    [v-clock]{
        display: none;
    }
    .vpro{
        float: left;
        text-align: center;
        margin-right:15px;
    }
    .vpro a img{
        width: 7rem;
    }
    .info .name{
        font-size:18px;
        color:#252525;
        line-height: 20px;
        margin-bottom:20px;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp:2;
        -webkit-box-orient: vertical;
    }
    .price strong{
        font-weight:normal;
    }
    .price i{
        color:#F10313;
        font-style: normal;
        vertical-align: 5px;
        font-size:12px;
    }
    .price .s1{
        color:#F10313;
        font-size:20px;
    }
    .price em{
        color:#ccc;
        font-style: normal;
        vertical-align: 4px;
        font-size:10px;
    }
    .price .s2{
        text-decoration: line-through;
        margin-left:4px;
        color:#ccc;
        font-size:16px;
    }
</style>