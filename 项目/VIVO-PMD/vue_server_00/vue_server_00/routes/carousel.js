const express = require("express");
const router = express.Router();
const pool=require("../pool");

//首页轮播图片
router.get("/v1/carousel",(req,res)=>{
  //              编号  图片
  var sql="SELECT * FROM vcarousel";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})

module.exports=router;