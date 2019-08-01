SET NAMES UTF8;
DROP DATABASE IF EXISTS szn;
CREATE DATABASE szn CHARSET=UTF8;
USE szn;

/****banner****/
CREATE TABLE banner(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
/****banner-数据导入****/
INSERT INTO banner VALUES
(NULL,'../img/men/banner.png','男装','garment.html?lid=1'),
(NULL,'../img/women/banner.png','女装','garment.html?lid=2');

/****款式****/
CREATE TABLE product(
  lid INT PRIMARY KEY AUTO_INCREMENT, 
  pname VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128)
);
/****款式-数据导入****/
INSERT INTO product VALUES
(NULL,'Atom LT Hoody 男装轻薄款(LT)合成材料保暖中间层连帽衣',300,'product.html?lid=1'),
(NULL,'Gamma LT连帽衣 男装轻薄款(LT)透气弹力攀岩软壳连帽衣',260,'product.html?lid=2'),
(NULL,'Atom LT Hoody 男装轻薄款(LT)合成材料保暖中间层连帽衣',300,'product.html?lid=3'),
(NULL,'Therme Parka 男装羽绒保暖款GORE-TEX长款派克大衣',859,'product.html?lid=4'),
(NULL,'Atom LT Hoody 男装轻薄款(LT)合成材料保暖中间层连帽衣',300,'product.html?lid=5'),
(NULL,'Gamma LT连帽衣 男装轻薄款(LT)透气弹力攀岩软壳连帽衣',260,'product.html?lid=6'),
(NULL,'Atom LT Hoody 男装轻薄款(LT)合成材料保暖中间层连帽衣',420,'product.html?lid=7'),
(NULL,'Therme Parka 男装羽绒保暖款GORE-TEX长款派克大衣',530,'product.html?lid=8'),
(NULL,'Gamma LT连帽衣 男装轻薄款(LT)透气弹力攀岩软壳连帽衣',400,'product.html?lid=9'),
(NULL,'Beta AR夹克 男装多用途(AR)透气GORE-TEX Pro外套',399,'product.html?lid=10'),
(NULL,'Keppel风衣 男装GORE-TEX风衣，适合城市穿着',599,'product.html?lid=11'),
(NULL,'Macai Jacket 男装羽绒保暖GORE-TEX度假区滑雪夹克',658,'product.html?lid=12'),
(NULL,'Gamma LT连帽衣 男装轻薄款(LT)透气弹力攀岩软壳连帽衣',455,'product.html?lid=13'),
(NULL,'Gamma LT连帽衣 男装轻薄款(LT)透气弹力攀岩软壳连帽衣',368,'product.html?lid=14'),
(NULL,'Atom LT Hoody 男装轻薄款(LT)合成材料保暖中间层连帽衣',249,'product.html?lid=15'),
(NULL,'Therme Parka 男装羽绒保暖款GORE-TEX长款派克大衣',580,'product.html?lid=16'),
(NULL,'Blade 28背包简洁款城市过夜背包，设计时尚',300,'product.html?lid=17'),
(NULL,'Rho LTW Neck Gaitor轻薄款羊毛混纺(LTW)围脖',160,'product.html?lid=18'),
(NULL,'Kyanite连帽衣 女装双向弹性抓绒层搭连帽衣',400,'product.html?lid=19'),
(NULL,'Thorium AR连帽衣 女装双向弹性抓绒层搭连帽衣',859,'product.html?lid=20'),
(NULL,'Blade 28背包简洁款城市过夜背包，设计时尚',300,'product.html?lid=21'),
(NULL,'Rho LTW Neck Gaitor轻薄款羊毛混纺(LTW)围脖',160,'product.html?lid=22'),
(NULL,'Kyanite连帽衣 女装双向弹性抓绒层搭连帽衣',420,'product.html?lid=23'),
(NULL,'Thorium AR连帽衣 女装双向弹性抓绒层搭连帽衣',530,'product.html?lid=24'),
(NULL,'Maka 2腰包简洁款轻便腰包',200,'product.html?lid=25'),
(NULL,'Rho手套合成材料里衬手套，吸湿排汗',99,'product.html?lid=26'),
(NULL,'Phase SL文胸 女装超轻薄款(SL)吸湿排汗合成材料',266,'product.html?lid=27'),
(NULL,'Arro 22背包城市通勤背包',180,'product.html?lid=28'),
(NULL,'Solano大衣 女装GORE-TEX INFINIUM™长款大衣',455,'product.html?lid=29'),
(NULL,'Cita连帽衣 女装轻薄可收纳的野外跑步风衣',368,'product.html?lid=30'),
(NULL,'Norvan 14 水合背心全天野外跑步水合背心',249,'product.html?lid=31'),
(NULL,'Codetta外套 女装七分长款GORE-TEX都市风格大衣',580,'product.html?lid=32'); 

/****详情****/