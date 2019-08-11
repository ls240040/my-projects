<template>
    <div id="index">
        <my-header></my-header>
    </div>
</template>
<script>
//引入子组件
import Header from '../components/Header.vue'
export default {
    data() {
        return {
                
        }
    },//注册子组件
    components:{
        "my-header":Header
    }
}
</script>
<style>
    
</style>