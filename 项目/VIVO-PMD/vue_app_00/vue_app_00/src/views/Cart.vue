<template>
    <div class="cart-box">
        <!-- top -->
        <div class="CartTop">
            <img src="../assets/img/arrow-ee.png" @click="back">
            <span>购物车</span>
            <img src="../assets/img/menu-2-outline.png">
        </div>
        <div class="item-box">
            <!-- 2.商品信息 -->
            <div class="cart-item" v-for="(item,index) of list" :key="index">
                <div class="leftText">
                    <input type="checkbox" v-model="item.cb" @change="select">
                    <img :src="`http://127.0.0.1:5050/${item.img}`">
                    <div>
                        <div class="lname">{{item.lname}}</div>
                        <div class="price"><i>¥</i>{{item.price.toFixed(2)}}</div>
                        <div class="count-box">
                            <span @click="minus" :class="{disabled:item.count<=1}" :data-index="index" :data-lid="item.lid">-</span>
                            <span id="countInner" :data-count="item.count">{{item.count}}</span>
                            <span @click="add" :data-index="index" :class="{disabled:item.count>=5}">+</span>
                        </div>
                    </div>
                </div>
                <img src="../assets/img/delete.png" @click="deleteItem(index,$event)" :data-id="item.id">
            </div>
        </div>
        <!-- 3.购物车中商品数量：删除选中商品，清空购物车 -->
        <div class="btn-box">
            <!-- 购物车中商品数量：删除选中商品，清空购物车 -->
            <mt-button @click="deleteItems" :data-id="list.id" size="large">
                删除选中商品
                <span style="color:red">{{total.pnum}}</span>
            </mt-button>
            <!-- <mt-button>清空购物车</mt-button> -->
        </div>
        <!-- 结算 -->
        <mt-tabbar fixed class="cartBottom">
            <mt-tab-item style="background-color: #fff;">
                <div class="selectall">
                    <input type="checkbox" @change="selectAll" id="checkAll" v-model="selected">
                    <label for="checkAll">全选</label>
                </div>
            </mt-tab-item>
            <mt-tab-item style="background-color: #fff;">
                <div class="sum">
                    <span>合计：</span>    
                    <span><i>¥</i>{{total.sum.toFixed(2)}}</span>
                </div>
            </mt-tab-item>
            <mt-tab-item style="background-color: #fff;">
                <div class="account" @click="getList" >去结算</div>
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[],  //当前登录用户购物车列表
            pnum:0,
            sum:0,
            selected:false
        }
    },
    created(){
        //当前组件创建成功回调函数
        this.loadMore();
    },
    computed:{
        total(){
            var pnum=0;
            var sum=0;
            for(var item of this.list){
                if(item.cb==true){
                    pnum+=item.count;
                    sum+=item.count*item.price;
                }
            }
            this.pnum=pnum;
            this.sum=sum;
            return {pnum:pnum,sum:sum};
        }
    },
    methods:{
        back(){
            this.$router.go(-1)
        },
        add(e){
            var i=e.target.dataset.index;
            var count=this.list[i].count;
            
            if(this.list[i].count>=5){
                this.list[i].count=5;
            }
            var url="v1/addcart2";
            var lid=this.list[i].lid;
            var uid=sessionStorage.getItem("accessToken");
            var obj={lid,count,uid};
            console.log(this.list);
             this.axios.get(url,{params:obj}).then(res=>{
                 this.loadMore(); // 11.刷新
             })
        },
        minus(e){
            var i=e.target.dataset.index;
            var count=this.list[i].count--;
            if(this.list[i].count==0){
                this.list[i].count=1;
            }
            var url="v1/delcart";
            var uid=sessionStorage.getItem("accessToken");
            var lid=this.list[i].lid;
            var obj={lid,count,uid};
            console.log(this.list);
             this.axios.get(url,{params:obj}).then(res=>{
                 this.loadMore(); // 11.刷新
             })
        },
        selectAll(event){
            // 功能：为全选按钮绑定事件 change
            // 当全选按钮状态为checked=true
            // 所有商品列表 cb=true
            // 当全选按钮状态为checked=false
            // 所有商品列表 cb=false
            // 1.获取当前按钮状态 true
            var cb=event.target.checked;
            // 2.创建循环遍历所有商品属性cb值与全选状态一致
            for(var item of this.list){
                item.cb = cb;
                if(item.cb==false){
                    cb=false;
                }
            }
        },
        select(event){
            // 功能：当所有按钮都选中 全选选中
            var cb=event.target.checked;
            if(cb==false){
                this.selected=false;
            }else{// 只要有一个未被选中 全选不选中
                var unchecked=document.querySelector(".leftText input:not(:checked)");
                if(unchecked==null){
                    this.selected=true;
                }
            }
        },
        getList(){
            for(var item of this.list){
                if(item.cb==true){
                    // 获得当前选中商品的内容
                    var price=item.price;
                    var lid=item.lid;
                    var lname=item.lname;
                    var img=item.img;
                    var count=item.count;
                    var uid=sessionStorage.getItem("accessToken");
                    var url="v1/list";
                    var obj={price,lid,lname,img,uid,count};
                    this.axios.get(url,{params:obj}).then(res=>{
                        if(res.data.code==1){
                            // console.log(count)
                            this.$router.push('/Order')
                        }
                    })
                }else{
                    this.$messagebox("消息","请选择要结算的商品")
                }
            }
        },
        deleteItems(){
            // 功能：删除用户选中的多个商品
            // 1.显示确认对话框
            this.$messagebox.confirm("是否删除选中商品").then(res=>{
                // 2.创建变量保存选中id值
                var id = "";
                // 3.创建循环遍历数组中每个元素
                for(var item of this.list){
                    // 4.判断当前元素属性cb是否等于true
                    if(item.cb){
                        // 5.拼接id  2,3,4
                        id+=item.id+",";
                    }
                }
                // 6.去除字符串中最后一个逗号
                id=id.slice(0,-1);
                if(id==""){ // 7.判断用户是否选中商品 请选择需要删除的商品
                    this.$toast("请选择需要删除的商品");
                    return;
                }
                // 8.创建url 创建obj发送ajax请求
                var url="v1/delItems";
                var obj={id:id};
                this.axios.get(url,{params:obj}).then(res=>{
                    // 9.获取服务器返回的数据
                    // 10.判断删除多个商品是否成功
                    if(res.data.code==-1){
                        this.$toast("删除失败")
                    }else{
                        this.$toast("删除成功");
                        this.loadMore(); // 11.刷新
                    }
                })
            }).catch(err=>{

            })
        },
        deleteItem(i,event){
            // 功能：用户点击删除按钮完成删除指定商品任务
            // 1.为按钮绑定点击事件调用deleteItem
            // 2.显示确认框，如果用户选确定
            // 3.将当前商品的id传递到函数中
            // 4.发送ajax请求完成删除任务
            // 5.删除成功 提示“删除成功”
            this.$messagebox.confirm("是否删除指定数据").then(res=>{
                var index=parseInt(i)+1;
                console.log(index)
                var id=index;
                var uid=sessionStorage.getItem("accessToken");
                var url="v1/delItem";
                var obj={id,uid}
                this.axios.get(url,{params:obj}).then(res=>{
                    this.$toast("删除成功");
                    this.loadMore();//刷新 
                })
            }).catch(err=>{

            })
        },
        loadMore(){
            //功能：获取当前用户购物车列表
            //1.创建url请求服务器地址
            var url="v1/cart";
            var uid=sessionStorage.getItem("accessToken");
            var obj={uid};
            //2.发送ajax请求（让服务器程序完成功能）
            this.axios.get(url,{params:obj}).then(res=>{
                //3.获取服务器返回数据
                //4.如果服务器返回-1 请登录
                if(res.data.code == -1){
                    this.$messagebox("消息","请登录").then(res => { //回调函数(用户点击确认按钮后调用函数)
                        this.$router.push('/Login')
                    })
                }else{
                    // this.list=res.data.data;
                    // 添加一个新功能：为数据添加属性cb
                    // 3.1创建循环遍历res.data.data中数据
                    var rows = res.data.data;
                    for(var item of rows){
                        // 3.2为其添加属性cb值为false
                        item.cb = false;
                    }
                    // 3.3将新数组赋值list(顺序)
                    this.list = rows;
                    console.log(this.list)
                }
            })
        }
    }
}
</script>
<style lang="scss" scoped>
    *{
        font-family:"Microsoft Yahei",Arial;
    }
    .cart-box{
        background-color: #f4f4f4;
        position: relative;
        height: 100vh;
    }
    .CartTop{
        display: flex;
        justify-content: space-between;
        background-color:#212121;
        color:#eee;
        align-items: center;
        height: 15vw;
        padding: 0 4vw;
        img{
            width: 6vw
        }
        span{
            font-size: 5vw;
        }
    }
    .item-box{
        padding:0vw 3vw;
    }
    // 1.商品项目元素
    .cart-item{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top:25px;
        padding:6vw 3vw;
        background-color: #fff;

        img{
            width: 6vw;
        }
    }
    // 2.修改左侧文字 复选框 商品名称 价格
    .leftText{
        display: flex;
        align-items: center;
        img{
            width: 16vw;
            margin-left: 3vw;
        }
    }
    // 3.商品名称
    .lname{
        margin-left:25px;
        font-size: 4vw;
    }
    .price{
        margin-left:25px;
        color:#f81200;
        margin-top:2vw;
        i{
            font-style: normal;
            font-size: 1vw;
            margin-right:2px;
        }
    }
    .count-box{
        width: 12vw;
        border: 1px solid #ccc;
        display: flex;
        justify-content: space-between;
        padding: 1vw 3vw;
        margin-left: 25px;
        margin-top:2vw;
        .disabled{
            color:#ccc;
        }
    }
    .btn-box{
        width: 94vw;
        margin: auto;
        display: flex;
        justify-content: space-around;
        margin-top:20px;
        .mint-button{
            background-color: #fff;
            box-shadow:0 0 0 #ccc;
            font-size: 4vw;
            letter-spacing: 2px;
            &:after{
                background-color: transparent;
            }
        }
    }
    .cartBottom{
        .account{
            margin-left: 2vw;
            line-height: 13vw;
            background-image: -webkit-gradient(linear,left top,right top,from(#E51422),to(#FF0C53));
            color:#fff;
            font-size: 4vw;
        }
        .selectall{
            color:#000;
            line-height: 13vw;
            font-size: 4vw;
            display: flex;
            align-items: center;
            flex-direction: row;
            margin-left: 2vw;
            input{
                margin-right: 2vw;
                margin-left:3vw;
                display: block;
                margin-top:1vw;
            }
        }
        .sum{
            display: flex;
            flex-direction: column;
            text-align: left;
            margin-left:2vw;
            span:first-child{
                color:#999;
                font-size: 3.5vw;
                margin-bottom:2vw;
                margin-top:1vw;
            }
            span:last-child{
                color:#f81200;
                font-size: 5vw;
                 i{
                    font-style: normal;
                    font-size: 4vw;
                    margin-right:2px;
                }
            }
        } 
    }
    .mint-tab-item{
        padding: 0;
        background-color: #fff;
    }
    .mint-tabbar{
        background-color: #fff;
    }
    input[type=checkbox]{
        width: 3vw;
        height: 3vw;
        border-radius: 50%;
        position: relative;
        &:before{
            content: "";
            position: absolute;
            top:-1vw;
            left:-1vw;
            width: 4vw;
            height: 4vw;
            border: 0;
            background-color: #fff;
            background-image: url(../assets/img/uncheck.png);
            background-repeat: no-repeat;
            background-size: contain;
            background-blend-mode: multiply;
        }
        &:checked:before{
            content: "";
            position: absolute;
            top:-1vw;
            left:-1vw;
            width: 4vw;
            height: 4vw;
            border: 0;
            background-color: #fff;
            background-image: url(../assets/img/checked.png);
            background-repeat: no-repeat;
            background-size: contain;
            background-blend-mode: multiply;
        }
    }
</style>