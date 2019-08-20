const express=require("express");
const router=express.Router();
const pool=require("../pool");

//详情-product
//http://127.0.0.1:5050/details/product
router.get('/product',(req,res)=>{
    var sql="SELECT img FROM product WHERE lid=?";
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

module.exports=router;