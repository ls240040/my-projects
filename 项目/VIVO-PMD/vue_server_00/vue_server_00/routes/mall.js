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

//商城热卖
//http://127.0.0.1:5050/mall/hotsell
router.get('/hotsell',(req,res)=>{
    var sql="SELECT lid,img,href FROM hotsell";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

//商城V抢购
//http://127.0.0.1:5050/mall/vrush
router.get('/vrush',(req,res)=>{
    var sql="SELECT pid,title,price,subprice,img FROM vrush";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

//商城精品
//http://127.0.0.1:5050/mall/boutique
router.get('/boutique',(req,res)=>{
    var sql="SELECT cid,img,title,subtitle,price FROM boutique";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

//商城精品配件
//http://127.0.0.1:5050/mall/parts
router.get('/parts',(req,res)=>{
    var sql="SELECT cid,img,title,subtitle,price FROM parts";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result});
    })
})

module.exports=router;