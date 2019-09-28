import Vue from 'vue'
import Router from 'vue-router'

//对下面这些自己创建的组件进行路径的配置
// 每新建一个组件，就在这里导入，并为其创建一个接口
import Index from './views/Index.vue'
import Mall from './views/Mall.vue'
import Details from './views/Details.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import Protocol from './views/Protocol.vue'
import Cart from './views/Cart.vue'
import Order from './views/Order.vue'
import NotFound from './views/NotFound.vue'
import A from './views/A.vue'
import B from './views/B.vue'

Vue.use(Router)

const router = new Router({
  routes: [
    //组件访问路径    组件名
    {path:'/',component:Index},
    {
      path:'/Mall',
      component:Mall
      // meta:{
      //   keepAlive:true, //需要被缓存
      //   isBack: false
      // }
    },
    {path:'/Login',component:Login},
    {path:'/Register',component:Register},
    {path:'/Protocol',component:Protocol},
    {path:'/Cart',name:'Cart',component:Cart},
    {path:'/Order',component:Order},
    //1.props:true  让url中参数自动成为props中的自定义属性 
    //2.在要接收参数的目标组件中，添加与路由参数同名的自定义属性变量 var details={props:["lid"]}
    //3.跳转时，/details/1  没有问号，值用'/'分割
    {
      path:'/Details/:lid',//:lid是地址栏的值，后面的传参也是地址栏的值
      component:Details,props:true
    }, 
    {path:'/A',component:A},
    {path:'/B',component:B},
    {path:'/*',component:NotFound},
  ]
})



export default router;