<template>
  <div id="app">
    <router-view/>
  </div>
</template>
<script>
export default{
}
//文件加载完成后,执行回掉函数
  document.addEventListener('DOMContentLoaded',()=>{
    //找到html
    const html=document.querySelector('html');
    //让文件的字体大小 = 窗口innerWidth / 10
    let fontSize = window.innerWidth / 10;
    //设置最大字体大小
    fontSize = fontSize > 50 ? 50 : fontSize;
    html.style.fontSize=fontSize+'px';
  })
</script>
<style lang="scss" scoped>
  #app{
    width: 100%;
    height:100%;
    overflow:hidden;
  }
</style>
