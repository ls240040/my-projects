<template>
    <div class="register-content">
        <div class="top-item">
            <div class="logo">
                <img src="../assets/img/logo-blue.png.webp">
            </div>
            <p>账号注册</p>
        </div>
        <div class="outer-box">
            <!-- 用户名输入框 -->
            <mt-field label="用户名" placeholder="请输入3~12位字母或数字" v-model="uname"></mt-field>
            <!-- 用户密码输入框 -->
            <mt-field label="密码" placeholder="请输入3~12位字母或数字" type="password" v-model="upwd"></mt-field>
            <!-- 注册按钮 -->
            <mt-button size="large" class="register" @click="register">注册</mt-button>
        </div>
        <!-- 协议 -->
        <div class="readme">
            <p>我已阅读并接受</p>
            <p @click="linkTo2">《vivo服务协议》</p>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            uname:"",
            upwd:""
        }
    },
    methods:{
        linkTo2(){
            this.$router.push("/Protocol")
        },
        register(){
            //功能一：完成用户登录
            //1.获取用户名和密码
            var u=this.uname;
            var p=this.upwd;
            //2.创建正则表达式 3~12位 字母数字
            var reg=/^[a-z0-9]{3,12}$/i;
            //3.判断如果错误 用户名提示
            if(!reg.test(u)){
                this.$toast("用户名格式不正确");
                return;
            }
            //4.判断如果错误 密码提示
            if(!reg.test(p)){
                this.$toast("密码格式不正确");
                return;
            }
            //5.发送ajax
            var url="/v1/register";
            var obj={uname:u,upwd:p};//需要发送的数据
            this.axios.get(url,{params:obj}).then(res=>{//6.回调函数：接收服务器返回数据
                console.log(res);
                if(res.data.code==-1){//7.失败 提示
                    this.$messagebox("消息","用户已存在");
                    this.uname="";
                    this.upwd="";
                }else{//8.成功 跳转
                    this.$messagebox("消息","注册成功").then(action=>
                         this.$router.push("/Login")
                    )
                }
            })
        }
    }
}
</script>
<style scoped>
    *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    .register-content{
        margin-top: 5vh;
    }
    .top-item{
        display: flex;
        flex-direction: column;
        align-items: center;
        font-family: HYQiHei-FZS;
        font-size: 1.2rem;
    }
    .logo{
        width: 100%;
        text-align: center
    }
    .logo img{
        width: 30vw;
        margin-top: 5vw;
    }
    .mint-button{
        border-radius:41px;
        margin-bottom:1rem;
        font-size: 1rem;
        outline: none;
    }
    .mint-button:active{
        background-color:#ffffff;
    }
    .mint-cell >>> .mint-cell-wrapper{
        background-image: none;
    }
    .outer-box{
        padding: 0 5vw 0; 
        margin-top:5vh;
    }
    .register{
        background-image: linear-gradient(90deg,#418eff,#4566ff);
        color:#fff;
        margin-top:5vh;
    }
    .mint-button::after{
        background-color: transparent;
    }
    .readme{
        display: flex;
        flex-direction:row;
        justify-content: center;
        color:#aaa;
        font-size: .8rem;
    }
    .readme p:last-child{
        color:#4566ff;
    }
</style>