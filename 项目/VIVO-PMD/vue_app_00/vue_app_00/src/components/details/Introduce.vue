<template>
    <div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg01}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg02}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg03}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg04}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg05}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg06}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg07}`" alt=""></div>
        <div><img :src="`http://127.0.0.1:5050/${list.dimg08}`" alt=""></div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            list:[]
        }
    },
    methods: {
        loadMore(){
            // 功能：当组件创建成功后获取第一页数据
            // 1.创建url地址
            var url="details/introduce";
            var obj={lid:this.lid};
            // 2.发送ajax请求获取第一页数据
            this.axios.get(url,{params:obj}).then(res=>{
                // 3.将数据保存在data中
                this.list=res.data.data[0]; 
                console.log(this.list[0])
            })
        },
    },
    created () {
        this.loadMore();
    },
    props:{
        lid:{default:""}
    }
}
</script>
<style lang="scss" scoped>
    *{
        padding: 0;
        margin:0;
    }
    img{
        width: 100vw;
        display: block
    }    
</style>