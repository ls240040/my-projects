<template>
    <div>
        <h1>A.vue</h1> 
        <h1>{{$store.getters.getAge}}</h1>
        <h1>{{$store.getters.getList}}</h1>
        <h1>{{$store.getters.getCar}}</h1>
        <button @click="older">年纪大了</button>
    </div>
</template>
<script>
export default {
    methods:{
        older(){
            this.$store.commit("updataAge",66);
        }
    }
}
</script>
