const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://127.0.0.1:5050/v1/login?uname=tom&upwd=123
router.post("/login",(req,res)=>{
    // 接收网页传递数据
    var u=req.body.uname;
    var p=req.body.upwd;
    var sql="SELECT id FROM v_login WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[u,p],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"用户名或密码有误"})
        }else{
            //获取当前登录用户id
            //result=[{id:2}]
            var uid=result[0].id;
            //将用户id保存session对象中
            //uid当前登录：用户凭证
            console.log(uid);
            res.send({code:1,msg:"登录成功",id:uid})
        }
    })
})

//http://127.0.0.1:5050/v1/register?uname=tom&upwd=123
router.get("/register",(req,res)=>{
    // 接收网页传递数据
    var u=req.query.uname;
    var p=req.query.upwd;
    var sql="SELECT id FROM v_login WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[u,p],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            var sql="INSERT INTO v_login (uname,upwd) VALUES (?,md5(?))";
            pool.query(sql,[u,p],(err,result)=>{
                if(err) throw err;
                res.send({code:1,msg:"注册成功",data:result});
            })
        }else{
            res.send({code:-1,msg:"用户名已存在"});
        }
    })
})

module.exports=router;