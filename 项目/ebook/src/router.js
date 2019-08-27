import Vue from 'vue'
import Router from 'vue-router'
import ebook from './views/ebook/index.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path:'/',
      component:ebook,
      children:[{
        path:':fileName',
        component:()=>import ('./components/ebook/EbookReader.vue') 
      }]
    },
  ]
})
