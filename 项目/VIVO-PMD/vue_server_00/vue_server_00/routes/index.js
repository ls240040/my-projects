const express = require("express");
const router = express.Router();
const pool=require("../pool");

//首页轮播图片
//http://127.0.0.1:5050/carousel
router.get("/carousel",(req,res)=>{
  //              编号  图片
  var sql="SELECT cid,title,subtitle,img FROM vcarousel";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})

//首页内容图片
//http://127.0.0.1:5050/index
router.get("/index",(req,res)=>{
  //              编号  图片
  var sql="SELECT pid,title,subtitle,img FROM vcontent";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})

module.exports=router;