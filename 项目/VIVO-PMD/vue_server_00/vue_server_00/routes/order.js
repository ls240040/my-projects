const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 结算
router.get('/list',(req,res)=>{
    //功能三：将指定商品添加至商品清单
    //#此功能先行条件先登录
    //1.接收客户端请求 /addcart get
    //2.判断当前用户是否登录成功
    var uid=req.query.uid;
    //3.获取客户端数据
    var lid=req.query.lid;
    var price=req.query.price;
    var lname=req.query.lname;
    var img=req.query.img;
    var count=req.query.count;
    var sql="SELECT id,count,lid,img,lname,price FROM v_list WHERE uid=? AND lid=?";
    //3.执行sql语句并且将数据库返回结果发送给客户
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            //4.插入数据
            var sql=`INSERT INTO v_list VALUES(NULL,${lid},'${img}',${price},${count},'${lname}',${uid})`;
            //5.执行sql语句
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:1,msg:"插入数据成功",data:result})
                }else{
                    res.send({code:-1,msg:"请选择要插入的数据"})
                }
                
            })
        }else{//count变化数据库跟着变化
            var sql=`UPDATE v_list SET count=(SELECT count FROM v_cart WHERE uid=${uid} AND lid=${lid})`;
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                res.send({code:1,msg:"更新数据成功",data:result})
            })
        }  
    })
})
// 11111111111
//http://127.0.0.1:5050/v1/list2?uid=1   
router.get('/list2',(req,res)=>{
    //1.参数 uid
    var uid=req.query.uid;
    //2.创建sql语句
    var sql="SELECT id,count,lid,img,lname,price FROM v_list WHERE uid=?";
    //3.执行sql语句并且将数据库返回结果发送给客户
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})

module.exports=router;