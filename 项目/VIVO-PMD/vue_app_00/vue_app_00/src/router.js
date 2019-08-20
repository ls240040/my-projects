import Vue from 'vue'
import Router from 'vue-router'

//对下面这些自己创建的组件进行路径的配置
// 每新建一个组件，就在这里导入，并为其创建一个接口
import Index from './views/Index.vue'
import Mall from './views/Mall.vue'
import Details from './views/Details.vue'

Vue.use(Router)

export default new Router({
  routes: [
    //组件访问路径    组件名
    {path:'/Index',component:Index},
    {path:'/Mall',component:Mall},
    {path:'/Details',component:Details},
  ]
})
