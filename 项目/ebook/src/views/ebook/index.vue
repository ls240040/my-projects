<template>
    <div id="ebook">
        <ebook-title></ebook-title>
        <ebook-reader></ebook-reader>
        <ebook-menu></ebook-menu>
    </div>
</template>
<script>
import EbookReader from '../../components/ebook/EbookReader'
import EbookTitle from '../../components/ebook/EbookTitle'
import EbookMenu from '../../components/ebook/EbookMenu'
export default {
    data(){
        return{

        }
    },
    components:{
        "ebook-reader":EbookReader,
        "ebook-title":EbookTitle,
        "ebook-menu":EbookMenu
    }
}
</script>