const express=require("express");
const router=express.Router();
const pool=require("../pool");

//详情-product
//http://127.0.0.1:5050/details/product?lid=1
router.get('/product',(req,res)=>{
    var lid=req.query.lid; //获取ajax传过来的lid(也就是地址栏的lid)
    console.log(lid);
    var sql="SELECT pid,video,img01,img02,img03,img04,price,title,lid,info,subinfo,discount,specs FROM product WHERE lid=?";
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"查询失败",data:result});
        }else{
            res.send({code:1,msg:"查询成功",data:result});
        }
        
    })
})

//功能二：商品分页显示
//1.接收客户请求
//2.接收客户请求数据




//http://127.0.0.1:5050/details/product2?pno=2&pageSize=2
router.get('/product2',(req,res)=>{
    var pno=req.query.pno;
    var ps=req.query.pageSize;
    //3.如果客户没有请示数据设置默认数据
    if(!pno){
        pno=1
    }
    if(!ps){
        ps=2
    }
    //4.创建sql语句
    var sql="SELECT pid,video,img01,img02,img03,img04,price,title,lid,info,subinfo,discount,specs FROM product LIMIT ?,?";
    var offset=(pno-1)*ps;//起始记录数  ？
    ps=parseInt(ps); //行数  ？
    //5.发送sql语句
    pool.query(sql,[offset,ps],(err,result)=>{
        //6.获取返回结果发送客户端
        if(err) throw err;
        console.log(result[0]);
        res.send({code:1,msg:"查询成功",data:result});
        
    })
})

module.exports=router;