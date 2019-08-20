const express=require("express");
const router=express.Router();
const pool=require("../pool");

//详情-product
//http://127.0.0.1:5050/details/product
router.get('/product',(req,res)=>{
    var lid=req.query.lid;
    var sql="SELECT pid,img FROM product WHERE lid=?";
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"查询失败",data:result});
        }else{
            res.send({code:1,msg:"查询成功",data:result});
        }
        
    })
})

module.exports=router;