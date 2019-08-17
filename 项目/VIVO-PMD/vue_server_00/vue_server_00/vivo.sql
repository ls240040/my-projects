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
