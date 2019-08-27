<template>
    <div id="ebook">
        <ebook-reader></ebook-reader>
    </div>
</template>
<script>
import EbookReader from '../../components/ebook/EbookReader'
export default {
    data(){
        return{

        }
    },
    components:{
        "ebook-reader":EbookReader
    }
}
</script>