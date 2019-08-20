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

var app = express();

//部署新浪云，硬性要求必须监听5050端口 这句话创建的server暂时没什么用；
var server = app.listen(5050);

//这句话是用来解决跨域问题
app.use(cors({
    //允许跨域访问程序地址列表
    origin:["http://127.0.0.1:8080",
    "http://localhost:8080"],
    credentials:true //请求验证
 }))

//配置session模块
app.use(session({
    secret:"128位字符串",     //安全字符串
    resave:true,             //请求更新数据
    saveUninitialized:true   //保存 初始数据
}));

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));


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
