<template>
    <div class="login-content">
        <div class="top-item">
            <div class="logo">
                <img src="../assets/img/logo-blue.png.webp">
            </div>
            <p>用户名密码登录</p>
        </div>
        <div class="outer-box">
            <!-- 用户名输入框 -->
            <mt-field label="用户名" placeholder="请输入用户名" v-model="uname"></mt-field>
            <!-- 用户密码输入框 -->
            <mt-field label="密码" placeholder="请输入密码" type="password" v-model="upwd"></mt-field>
            <!-- 登录按钮 -->
            <mt-button size="large" class="login" @click="login">登录</mt-button>
            <!-- 注册按钮 -->
            <mt-button size="large" class="register" @click="linkTo">注册vivo账号</mt-button>
        </div>
        <div class="forget">
            <p>忘记密码？</p>
        </div>
        <div class="other-way-login">
            <p>其它方式登录</p>
            <div class="im-4">
                <img src="../assets/img/qq.png">
                <img src="../assets/img/zfb.png">
                <img src="../assets/img/sna.png">
                <img src="../assets/img/rr.png">
            </div>
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
        linkTo(){
            this.$router.push("/Register");
        },
        login(){
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
            var url="/v1/login";
            // var obj={uname:u,upwd:p};//需要发送的数据
            var params = new URLSearchParams();
            params.append("uname", u);
            params.append("upwd", p);
            this.axios.post(url,params).then(res=>{//6.回调函数：接收服务器返回数据
                console.log(res);
                if(res.data.code==-1){//7.失败 提示
                    this.$messagebox("消息","用户名或密码有误")
                }else{//8.成功 跳转
                    {sessionStorage.setItem('accessToken' , res.data.id) }
                    this.$router.go(-1)
                }
            })
            .catch(function(err) {
                console.log(err);
            });
        }
    }
}
</script>
<style scoped>
    *{
        -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    .login-content{
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
    .login{
        background-image: linear-gradient(90deg,#418eff,#4566ff);
        color:#fff;
        margin-top:5vh;
    }
    .register{
        border:1px solid #4566ff;
        color:#4566ff;
    }
    .mint-button::after{
        background-color: transparent;
    }
    .forget{
        display: flex;
        justify-content: center;
        color:#666;
    }
    .other-way-login{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        font-size: .8rem;
        color:#aaa;
        margin-top: 5vh;
    }
    .im-4{
        display: flex;
        justify-content: space-between;
        width: 20vw
    }
    .im-4 img{
        width: 4vw;
        height: 4vw;
    }
</style>