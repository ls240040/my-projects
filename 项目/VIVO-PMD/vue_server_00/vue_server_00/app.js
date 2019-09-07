//vue_server_00/app.js node程序
//1:加载第三方模块
//web服务器
const express = require("express");
//跨域
const cors = require("cors");
//session  的配置
const session = require("express-session");
//bodyParser
const bodyParser = require("body-parser");

var app = express();

//部署新浪云，硬性要求必须监听5050端口 这句话创建的server暂时没什么用；5050可修改
var server = app.listen(5050);

//origin写的是脚手架的端口，允许8080跨域请求5050端口，ajax回来的数据，会被认为是8080同源
//这句话是用来解决跨域问题
    app.use(cors({
        //允许跨域访问程序地址列表
        //脚手架默认监听的是8080
        origin:["http://127.0.0.1:8080",
        "http://localhost:8080"],
        credentials:true //请求验证
    }))

//配置session模块
    app.use(session({
        secret:"128位字符串",     //安全字符串
        resave:true,             //每次请求保存数据
        saveUninitialized:true   //保存 初始数据
    }));

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));


//路由器导入
    //index
    const carousel = require("./routes/index");
    const index = require("./routes/index");
    //mall
    const mcarousel = require("./routes/mall");
    const micos = require("./routes/mall");
    const hotsell = require("./routes/mall");
    const vrush = require("./routes/mall");
    const boutique = require("./routes/mall");
    const parts = require("./routes/mall");
    //details
    const product=require("./routes/details");
    const evaluate=require("./routes/details");
    const introduce=require("./routes/details");
    const recommend=require("./routes/details");
    //login
    const login=require('./routes/login');
    const register=require('./routes/login');
    //cart
    const addcart=require('./routes/cart');
    const cart=require('./routes/cart');
    const delItem=require('./routes/cart');
    const delcart=require('./routes/cart');
    const addcart2=require('./routes/cart');
    //list
    const list=require('./routes/order');
    const list2=require('./routes/order');

/*使用路由器来管理路由*/
    // app.use("/index",index);
    app.use("/",carousel);
    app.use("/",index);
    app.use("/mall",mcarousel);
    app.use("/mall",micos);
    app.use("/mall",hotsell);
    app.use("/mall",vrush);
    app.use("/mall",boutique);
    app.use("/mall",parts);
    app.use("/details",product);
    app.use("/details",evaluate);
    app.use("/details",introduce);
    app.use("/details",recommend);
    app.use("/v1",login);
    app.use("/v1",register);
    app.use("/v1",addcart);
    app.use("/v1",cart);
    app.use("/v1",cart);
    app.use("/v1",delItem);
    app.use("/v1",delcart);
    app.use("/v1",addcart2);
    app.use("/v1",list);
    app.use("/v1",list2);
