<template>
    <div>
        <h1>B.vue</h1> 
        <h1>{{$store.getters.getAge}}</h1>
        <h1>{{$store.getters.getList}}</h1>
        <h1>{{$store.getters.getCar}}</h1>
        <button @click="upCar">车升级了</button>
        <button @click="clearAge">清空年龄[异步]</button>
    </div>
</template>
<script>
export default {
    methods:{
        upCar(){
            // 调用修改共享数据方式
            this.$store.commit("updataCar")
        },
        clearAge(){
            this.$store.dispatch("modifyAge")
        }
    }
}
</script>