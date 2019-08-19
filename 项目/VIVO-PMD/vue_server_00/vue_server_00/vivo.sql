SET NAMES UTF8;
DROP DATABASE IF EXISTS vivo;
CREATE DATABASE vivo CHARSET=UTF8;
USE vivo;

/**首页轮播图**/
CREATE TABLE vcarousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (32),
    subtitle VARCHAR(32),
    img VARCHAR(128)
);
INSERT INTO vcarousel VALUES
(NULL,'Z5 全面实力派','4800万超广角三摄  | 换新升级','1.jpg'),
(NULL,'iQOO Neo','骁龙845 4500mAh续航','2.jpg'),
(NULL,'Z5x 性能实力派','5000mAh大电池 骁龙710','3.jpg');

/**首页content**/
CREATE TABLE vcontent(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (32),
    subtitle VARCHAR(32),
    img VARCHAR(128)
);
INSERT INTO vcontent VALUES
(NULL,'以旧换新','专业评估  极速收回','01.jpg'),
(NULL,'新品镭雕开启','免费定制  镌刻心意','02.jpg'),
(NULL,'Y7s千元屏幕指纹','闪充4500mAh大电池','03.jpg'),
(NULL,'iQOO Neo低调内秀','立即查看','04.jpg'),
(NULL,'U1大屏大电池','指纹人脸双识别','05.jpg'),
(NULL,'对X27夏日印象一见钟情','遇见更多','06.jpg');

/**商城轮播图**/
CREATE TABLE mcarousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO mcarousel VALUES
(NULL,'m01.jpg'),
(NULL,'m02.jpg'),
(NULL,'m03.jpg'),
(NULL,'m04.jpg'),
(NULL,'m05.jpg');

/**商城icos**/
CREATE TABLE micos(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO micos VALUES
(NULL,'ico01.png'),
(NULL,'ico02.png'),
(NULL,'ico03.png'),
(NULL,'ico04.png'),
(NULL,'ico05.png'),
(NULL,'ico06.png'),
(NULL,'ico07.png'),
(NULL,'ico08.png');

/**商城热卖**/
CREATE TABLE hotsell(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO hotsell VALUES
(NULL,'hot01.png'),
(NULL,'hot02.png');

/**商城V抢购**/
CREATE TABLE vrush(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (32),
    price DECIMAL(10,2),
    subprice DECIMAL(10,2),
    img VARCHAR(128)
);
INSERT INTO vrush VALUES
(NULL,'iQOO Neo 6GB+128GB 电光紫','999','1998','V-01.png'),
(NULL,'Z3 全面屏 4GB+64GB 星夜黑','1070','1257','V-02.png'),
(NULL,'原装10V/2.25A闪充充电器','49','99','V-03.png'),
(NULL,'iQOO 8GB+128GB 电光蓝','3023','3197','V-04.png'),
(NULL,'vivo 原装Type-C数据线','25','49','V-05.png'),
(NULL,'Z3x 6GB+64GB 炫慕红','1220','1357','V-06.png'),
(NULL,'Z5x 6GB+64GB 极光色','1398','1498','V-07.png'),
(NULL,'X27 8GB+128GB版 印象夏日','2717','2743','V-08.png'),
(NULL,'乐心体脂秤S5mini','79','99','V-09.png'),
(NULL,'X27 软边透明手机保护壳 曜石黑','19','39','V-10.png');

/**商城精品**/
CREATE TABLE boutique(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    title VARCHAR(128),
    subtitle VARCHAR(128),
    price DECIMAL(10,2)
);
INSERT INTO boutique VALUES
(NULL,'bou01.png','iQOO 8GB+128GB','直降300/44W闪充',2998),
(NULL,'bou02.png','X27 8GB+128GB版','直降300/4800万三摄',2698),
(NULL,'bou03.png','Y7s 6GB+128GB','加赠耳机/4500毫安大电池',1798),
(NULL,'bou04.png','Z5x 6GB+128GB','5000mAh大电池',1698),
(NULL,'bou05.png','S1 6GB+128GB','2480万高清自拍',1998),
(NULL,'bou06.png','U1  3GB+32GB','4030mAh大电池',749);

/**商城精品配件**/
CREATE TABLE parts(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    title VARCHAR(128),
    subtitle VARCHAR(128),
    price DECIMAL(10,2)
);
INSERT INTO parts VALUES
(NULL,'par01.png','V.FRIENDS 手机保护壳','时尚设计·全面呵护',69),
(NULL,'par02.png','原装超快闪充数据线','品质保证值得信赖',59),
(NULL,'par03.png','XE680原装耳机','原装正品/品质保证',159),
(NULL,'par04.png','原装闪充充电器','官方原装正品',99),
(NULL,'par05.png','XE710原装耳机','一键线控/操作更方便',199),
(NULL,'par06.png','乔威 移动电源JP90ST','自动识别电流保护/不伤手机',169),
(NULL,'par07.png','乐心手环Mambo5','支持心率监测',119),
(NULL,'par08.png','蔚乐 棒棒糖音箱','手机直插音响',39);