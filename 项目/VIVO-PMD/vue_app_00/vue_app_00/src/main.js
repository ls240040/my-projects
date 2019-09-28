import Vue from 'vue'
import App from './App.vue'
import router from './router'
import vue_router from 'vue-router'
import './permission'

//引入第三方组件库 mint ui
//1:完整引入mint-ui组件库中所有组件
import MintUI from "mint-ui"
//2:单独引入mint-ui组件库中样式文件
import "mint-ui/lib/style.css"
//3:将mint-ui注册vue实例中
Vue.use(MintUI)
Vue.use(vue_router)
//4:将字体图标引入到当前项目中
import "./font/iconfont.css"

// app.use(cors({
//  origin:"http://127.0.0.1:8080",
//  credentials:true
//  //不能用*
// }));

//5:引入axios 第三方ajax模块
import axios from "axios"
//6:配置axios 基础路径
axios.defaults.baseURL="http://127.0.0.1:5050/"
//7:配置axios 保存session信息
axios.defaults.withCredentials=true
//8:将axios 注册vue 实例中
//由于axios不支持 use 将实例添加vue原型
Vue.prototype.axios = axios;
//main.js

//引入video插件
import Video from 'video.js'
import 'video.js/dist/video-js.css'
// import  Velocity from 'velocity-animate'

Vue.prototype.$video = Video
// Vue.prototype.$velocity = Velocity

//9:引入vuex第三方模块
import Vuex from "vuex"
//11：注册Vuex（先注册->再创建实例对象）
Vue.use(Vuex)
//10：创建Vuex存储实例对象
var store=new Vuex.Store({
  //共享数据
  state:{
    age:23,
    list:[1,2,4,5],
    car:"七手QQ",
    cartCount:0,
  },
  //添加修改数据的函数
   mutations:{
     updataCar(state){
       state.car="三手夏利";
     },
     updataAge(state,age){ //调用函数传参
       state.age=age
     },
     clear(state){ //添加清除年龄方法
       state.age=0;
     },
   },
  //添加获取数据函数
  getters:{
    getCar(state){
      return state.car;
    },
    getAge(state){
      return state.age;
    },
    getList(state){
      return state.list;
    }
  },
  //添加异步操作数据函数
  actions:{
    modifyAge:(context)=>{ //异步调用clear
      setTimeout(()=>{
        // 异步调用mutation中定义的函数
        // 完成异步修改数据的功能
        context.commit("clear")
      },500)
    }
  }
})
//12：将实例对象添加Vue中
Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App), //App App.vue根组件
  store
}).$mount('#app')

