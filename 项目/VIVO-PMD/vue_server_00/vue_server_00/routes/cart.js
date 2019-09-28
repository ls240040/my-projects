const express=require("express");
const router=express.Router();
const pool=require("../pool");

//http://127.0.0.1:5050/v1/login?uname=tom&upwd=123
//http://127.0.0.1:5050/v1/addcart?lid=1&lname=kk&price=9&img=p05.png.webp
//购物车
router.get('/addcart',(req,res)=>{
    //功能三：将指定商品添加至购物车
    //#此功能先行条件先登录
    //1.接收客户端请求 /addcart get
    //2.判断当前用户是否登录成功
    var uid=req.query.uid;
    
    //3.获取客户端数据
    var lid=req.query.lid;
    var price=req.query.price;
    var lname=req.query.lname;
    var img=req.query.img;
    //4.创建查询sql：当前用户是否购买此商品
    var sql="SELECT id FROM v_cart WHERE uid=? AND lid=?";
    //5.执行sql语句
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err) throw err;
        //6.在回调函数中 判断下一步操作
        //没有购买过此商品  添加
        //已购买过此商品  更新
        if(result.length==0){
            var sql=`INSERT INTO v_cart VALUES(NULL,${lid},'${img}',${price},1,'${lname}',${uid})`
        }else{
            var sql=`UPDATE v_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
        }          
        //7.执行sql获取返回结果
        pool.query(sql,(err,result)=>{
            if(err) throw err;
            //8.如果 sql UPDATE INSERT DELETE
            //判断执行成功  result.affectedRows 影响行数
            if(result.affectedRows>0){
                res.send({code:1,msg:"商品添加成功"})
            }else{
                res.send({code:-2,msg:"添加失败"})
            }
        })
    })
})

//http://127.0.0.1:5050/v1/login?uname=tom&upwd=123
//http://127.0.0.1:5050/v1/delcart?uid=1&lid=2
router.get('/delcart',(req,res)=>{
    var uid=req.query.uid;
    if(!uid){
        res.send({code:-1,msg:"请先登录"});
        return;
    }
    var lid=req.query.lid;
    var count=req.query.count;
    //4.创建查询sql：当前用户是否购买此商品
    var sql="SELECT id FROM v_cart WHERE uid=? AND lid=? AND count>1";
    //5.执行sql语句
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err) throw err;
        if(count<=5 && count>1){
            //6.在回调函数中 判断下一步操作
            //已购买过此商品  更新
            var sql=`UPDATE v_cart SET count=count-1 WHERE uid=${uid} AND lid=${lid}`;
            if(count==1){
                var sql=`UPDATE v_cart SET count=1 WHERE uid=${uid} AND lid=${lid}`;
            }
            //7.执行sql获取返回结果
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                //8.如果 sql UPDATE INSERT DELETE
                //判断执行成功  result.affectedRows 影响行数
                if(result.affectedRows>0){
                    res.send({code:1,msg:"商品删除成功"})
                }
            })
        }
    })
})

//http://127.0.0.1:5050/v1/login?uname=tom&upwd=123
//http://127.0.0.1:5050/v1/delcart?uid=1&lid=2
router.get('/addcart2',(req,res)=>{
    var uid=req.query.uid;
    if(!uid){
        res.send({code:-1,msg:"请先登录"});
        return;
    }
    var lid=req.query.lid;
    var count=req.query.count;
    //4.创建查询sql：当前用户是否购买此商品
    var sql="SELECT id FROM v_cart WHERE uid=? AND lid=? AND count<5";
    //5.执行sql语句
    pool.query(sql,[uid,lid],(err,result)=>{
        if(err) throw err;
        //6.在回调函数中 判断下一步操作
        //已购买过此商品  更新
            if(count<5){
                var sql=`UPDATE v_cart SET count=count+1 WHERE uid=${uid} AND lid=${lid}`;
                //7.执行sql获取返回结果
                pool.query(sql,(err,result)=>{
                    if(err) throw err;
                    //8.如果 sql UPDATE INSERT DELETE
                    //判断执行成功  result.affectedRows 影响行数
                    if(result.affectedRows>0){
                        res.send({code:1,msg:"商品删除成功"})
                    }
                })
            }
    })
})

//http://127.0.0.1:5050/v1/cart?id=1
//功能四：查询指定用户的购物车信息
router.get('/cart',(req,res)=>{
    //1.参数 uid
    var uid=req.query.uid;
    //2.创建sql语句
    var sql="SELECT id,count,lid,img,lname,price FROM v_cart WHERE uid=?";
    //3.执行sql语句并且将数据库返回结果发送给客户
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})

//http://127.0.0.1:5050/v1/delItem?id=1
// 功能五：删除购物车表中指定数据
router.get('/delItem',(req,res)=>{
    // 0.判断是否登录
    var uid=req.query.uid;
    // if(!uid){
    //     res.send({code:-2,msg:"请登录"});
    //     return;
    // }
    // 1.获取客户端发送数据id
    var lid=req.query.id;
    // 2.创建sql语句
    var sql="DELETE FROM v_cart WHERE lid=?"
    // 3.执行sql语句
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        // 4.获取服务器范湖结果判断删除是否成功
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
           
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})


//http://127.0.0.1:5050/v1/login?uname=tom&upwd=123
//http://127.0.0.1:5050/v1/delItem?id=7,9
// 功能六：删除购物车中的多个商品
router.get('/delItems',(req,res)=>{
    // 判断用户是否登录
    // 1.获取参数id=1,2,3
    var id=req.query.id;
    // 2.创建 sql语句
    var sql=`DELETE FROM v_cart WHERE id IN(${id})`;
    // 3.执行sql语句
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
    // 4.获取服务器返回结果
    // 5.将结果返回客户端
})

module.exports=router;