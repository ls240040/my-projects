<template>
    <div class="ebook-reader">
        <div id="read"></div>
    </div>
</template>
<script>
import {mapGetters} from "vuex"
import Epub from "epubjs"
global.ePub=Epub;
export default {
    data(){
        return{

        }
    },
    computed:{
        ...mapGetters([
            'fileName',
            'menuVisible'
        ])
    },
    methods:{
        prevPage(){
            if(this.rendition){
                this.rendition.prev()
            }
        },
        nextPage(){
            if(this.rendition){
                this.rendition.next()
            }
        },
        toggleTitleAndMenu(){
            this.$store.dispatch('setMenuVisible', !this.menuVisible)
        },
        initEpub(){
            const url="http://127.0.0.1:8081/epub/"+this.fileName+'.epub'
            //创建Epub的实例，生成book
            this.book=new Epub(url)
            console.log(this.book)
            //在id为read的dom节点上进行渲染
            this.rendition=this.book.renderTo('read',{
                width:innerWidth,
                height:innerHeight,
                method:"default"
            })
            //显示渲染结果
            this.rendition.display()
            //touchstart时：回调函数
            this.rendition.on('touchstart',event => {
                console.log(event)
                //changeTouches：表示自上次触摸以来发生了什么改变的Touch对象的数组。
                this.touchStartX=event.changedTouches[0].clientX
                this.touchStartTime=event.timeStamp
            })
            this.rendition.on('touchend',event => {
                console.log(event)
                const offsetX=event.changedTouches[0].clientX-this.touchStartX
                const time=event.timeStamp-this.touchStartTime
                console.log(offsetX,time)
                if(time<500 && offsetX>40){
                    this.prevPage()
                }else if(time<500 && offsetX<-40){
                    this.nextPage()
                }else{
                    this.toggleTitleAndMenu()
                }
                event.preventDefault()
                event.stopPropagation()
            })
        }
    },
    mounted(){
        //dispatch：含有异步操作，例如向后台提交数据，写法： this.$store.dispatch('mutations方法名',值)
        const fileName=this.$route.params.fileName.split("|").join("/")
        this.$store.dispatch('setFileName',fileName).then(()=>{
            this.initEpub()
        });
    }
}
</script>