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
        ...mapGetters(['fileName'])
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

        },
        initEpub(){
            const url="http://127.0.0.1:8081/epub/"+this.fileName+'.epub'
            this.book=new Epub(url)
            console.log(this.book)
            this.rendition=this.book.renderTo('read',{
                width:innerWidth,
                height:innerHeight,
                method:"default"
            })
            this.rendition.display()
            this.rendition.on('touchstart',event => {
                console.log(event)
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