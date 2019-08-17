const express=require("express");
const router=express.Router();
const pool=require("../pool");

//商城轮播图
//http://127.0.0.1:5050/mall/mcarousel
router.get('/mcarousel',(req,res)=>{
    var sql="SELECT cid,img FROM mcarousel";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

//商城icos
//http://127.0.0.1:5050/mall/micos
router.get('/micos',(req,res)=>{
    var sql="SELECT cid,img FROM micos";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

module.exports=router;