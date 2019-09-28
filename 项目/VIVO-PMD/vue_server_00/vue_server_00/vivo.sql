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
    lid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    href VARCHAR(128)
);
INSERT INTO hotsell VALUES
(NULL,'hot01.png','/Details/1'),
(NULL,'hot02.png','/Details/2');

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
    price DECIMAL(10,2),
    href VARCHAR(128)
);
INSERT INTO boutique VALUES
(NULL,'bou01.png','iQOO 8GB+128GB','直降300/44W闪充',2998,'/Details/3'),
(NULL,'bou02.png','X27 8GB+128GB版','直降300/4800万三摄',2698,'/Details/4'),
(NULL,'bou03.png','Y7s 6GB+128GB','加赠耳机/4500毫安大电池',1798,'/Details/5'),
(NULL,'bou04.png','Z5x 6GB+128GB','5000mAh大电池',1698,'/Details/6'),
(NULL,'bou05.png','S1 6GB+128GB','2480万高清自拍',1998,'/Details/7'),
(NULL,'bou06.png','U1  3GB+32GB','4030mAh大电池',749,'/Details/8');

/**商城精品配件**/
CREATE TABLE parts(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    title VARCHAR(128),
    subtitle VARCHAR(128),
    price DECIMAL(10,2),
    href VARCHAR(128)
);
INSERT INTO parts VALUES
(NULL,'par01.png','V.FRIENDS 手机保护壳','时尚设计·全面呵护',69,'/Details/9'),
(NULL,'par02.png','原装超快闪充数据线','品质保证值得信赖',59,'/Details/10'),
(NULL,'par03.png','XE680原装耳机','原装正品/品质保证',159,'/Details/11'),
(NULL,'par04.png','原装闪充充电器','官方原装正品',99,'/Details/12'),
(NULL,'par05.png','XE710原装耳机','一键线控/操作更方便',199,'/Details/13'),
(NULL,'par06.png','乔威 移动电源JP90ST','自动识别电流保护/不伤手机',169,'/Details/14'),
(NULL,'par07.png','乐心手环Mambo5','支持心率监测',119,'/Details/15'),
(NULL,'par08.png','蔚乐 棒棒糖音箱','手机直插音响',39,'/Details/16');

/**商品详情-product**/
CREATE TABLE product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    lid INT,
    video VARCHAR(128),
    img01 VARCHAR(128),
    img02 VARCHAR(128),
    img03 VARCHAR(128),
    img04 VARCHAR(128),
    price DECIMAL(10,2),
    title VARCHAR(128),
    info VARCHAR(128),
    subinfo VARCHAR(128),
    discount VARCHAR(128),
    specimg VARCHAR(128),
    /**已选规格**/
    specs VARCHAR(128)
);
INSERT INTO product VALUES
(1,1,'lid01.mp4','p01.png.webp','p02.png.webp','p03.png.webp','p04.png.webp',2398,'S1 Pro 6GB+256GB 仲夏梦','[享12期免息，加赠半年延保，购机即享价值869元礼包（免费善诊体验+399红酒兑换券），联系客服领取！]','19.5:9零界全面屏，升降式摄像头，3200万前置超清自拍，4800万后置三摄，3700mAh大电池，双引擎闪充','iQOO限时至高下单立减400，立即抢购>>','specimg01.jpg','全网通版 8GB+128GB 印象夏日 官方标配'),
(2,2,'lid02.mp4','p05.png.webp','p06.png.webp','p07.png.webp','p08.png.webp',2698,'X27 8GB+128GB版 印象夏日','[享12期免息，加赠半年延保，购机即享价值869元礼包（免费善诊体验+399红酒兑换券），联系客服领取！]','升降式摄像头，19.5:9零界全面屏，4800万后置三摄+超广角+超微距+超级夜景+超级逆光，vivo闪充，零感水冷散热','骁龙855 Plus，44W超快闪充，iQOO Pro预售享8重好礼>>','specimg01.jpg','全网通版 8GB+128GB 印象夏日 官方标配'),
(3,3,'lid02.mp4','p05.png.webp','p06.png.webp','p07.png.webp','p08.png.webp',2698,'X27 8GB+128GB版 印象夏日','[享12期免息，加赠半年延保，购机即享价值869元礼包（免费善诊体验+399红酒兑换券），联系客服领取！]','升降式摄像头，19.5:9零界全面屏，4800万后置三摄+超广角+超微距+超级夜景+超级逆光，vivo闪充，零感水冷散热','骁龙855 Plus，44W超快闪充，iQOO Pro预售享8重好礼>>','specimg01.jpg','全网通版 8GB+128GB 印象夏日 官方标配'),
(4,4,'lid02.mp4','p05.png.webp','p06.png.webp','p07.png.webp','p08.png.webp',2698,'X27 8GB+128GB版 印象夏日','[享12期免息，加赠半年延保，购机即享价值869元礼包（免费善诊体验+399红酒兑换券），联系客服领取！]','升降式摄像头，19.5:9零界全面屏，4800万后置三摄+超广角+超微距+超级夜景+超级逆光，vivo闪充，零感水冷散热','骁龙855 Plus，44W超快闪充，iQOO Pro预售享8重好礼>>','specimg01.jpg','全网通版 8GB+128GB 印象夏日 官方标配');



/**规格spec**/
CREATE TABLE specs(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    specimg VARCHAR(128),
    func VARCHAR(128),
    inventory VARCHAR(128),
    cpu VARCHAR(30),
    memory VARCHAR(128),
    storage VARCHAR(128),
    battery VARCHAR(128),
    screen VARCHAR(128),
    ratio VARCHAR(30),
    size VARCHAR(128),
    precamera VARCHAR(30),
    postcamera VARCHAR(128),
    opera VARCHAR(128)
);
INSERT INTO specs VALUES
(1,'spec.jpg','19.5:9零界全面屏，升降式摄像头，广角夜景三摄，Jovi语音助手','手机×1、充电器×1、数据线×1、耳机×1、保护壳×1、取卡针×1、快速入门指南×1、重要信息与保修卡×1（备注：最终以实物为准）','SDM675','8GB（注：由于手机系统和预装的程序占据了部分运存空间，实际运存空间少于8GB）','128GB（注：由于手机系统和预装的程序占据了部分存储空间，可用存储空间少于128GB)','4000mAh（典型值）','6.39英寸 FHD+（此为按照标准矩形测量的屏幕直角对角线的长度。<实际可视区域略小>）','2340×1080','157.66 × 74.26 × 8.95mm（手机尺寸可能会因工艺、材料供应商等变更而略有不同）','1600万像素','4800万像素主摄+1300万像素广角摄像头+500万像素虚化摄像头（实际使用中像素有剪裁,主摄像头使用三星GM1图像传感器，此图像传感器拥有4800万个物理像素点，默认输出四合一1200万像素，可选择4800像素超清输出。）','基于Android 9开发的Funtouch OS 9'),
(2,'spec.jpg','19.5:9零界全面屏，升降式摄像头，广角夜景三摄，Jovi语音助手','手机×1、充电器×1、数据线×1、耳机×1、保护壳×1、取卡针×1、快速入门指南×1、重要信息与保修卡×1（备注：最终以实物为准）','SDM675','8GB（注：由于手机系统和预装的程序占据了部分运存空间，实际运存空间少于8GB）','128GB（注：由于手机系统和预装的程序占据了部分存储空间，可用存储空间少于128GB)','4000mAh（典型值）','6.39英寸 FHD+（此为按照标准矩形测量的屏幕直角对角线的长度。<实际可视区域略小>）','2340×1080','157.66 × 74.26 × 8.95mm（手机尺寸可能会因工艺、材料供应商等变更而略有不同）','1600万像素','4800万像素主摄+1300万像素广角摄像头+500万像素虚化摄像头（实际使用中像素有剪裁,主摄像头使用三星GM1图像传感器，此图像传感器拥有4800万个物理像素点，默认输出四合一1200万像素，可选择4800像素超清输出。）','基于Android 9开发的Funtouch OS 9'),
(3,'spec.jpg','19.5:9零界全面屏，升降式摄像头，广角夜景三摄，Jovi语音助手','手机×1、充电器×1、数据线×1、耳机×1、保护壳×1、取卡针×1、快速入门指南×1、重要信息与保修卡×1（备注：最终以实物为准）','SDM675','8GB（注：由于手机系统和预装的程序占据了部分运存空间，实际运存空间少于8GB）','128GB（注：由于手机系统和预装的程序占据了部分存储空间，可用存储空间少于128GB)','4000mAh（典型值）','6.39英寸 FHD+（此为按照标准矩形测量的屏幕直角对角线的长度。<实际可视区域略小>）','2340×1080','157.66 × 74.26 × 8.95mm（手机尺寸可能会因工艺、材料供应商等变更而略有不同）','1600万像素','4800万像素主摄+1300万像素广角摄像头+500万像素虚化摄像头（实际使用中像素有剪裁,主摄像头使用三星GM1图像传感器，此图像传感器拥有4800万个物理像素点，默认输出四合一1200万像素，可选择4800像素超清输出。）','基于Android 9开发的Funtouch OS 9'),
(4,'spec.jpg','19.5:9零界全面屏，升降式摄像头，广角夜景三摄，Jovi语音助手','手机×1、充电器×1、数据线×1、耳机×1、保护壳×1、取卡针×1、快速入门指南×1、重要信息与保修卡×1（备注：最终以实物为准）','SDM675','8GB（注：由于手机系统和预装的程序占据了部分运存空间，实际运存空间少于8GB）','128GB（注：由于手机系统和预装的程序占据了部分存储空间，可用存储空间少于128GB)','4000mAh（典型值）','6.39英寸 FHD+（此为按照标准矩形测量的屏幕直角对角线的长度。<实际可视区域略小>）','2340×1080','157.66 × 74.26 × 8.95mm（手机尺寸可能会因工艺、材料供应商等变更而略有不同）','1600万像素','4800万像素主摄+1300万像素广角摄像头+500万像素虚化摄像头（实际使用中像素有剪裁,主摄像头使用三星GM1图像传感器，此图像传感器拥有4800万个物理像素点，默认输出四合一1200万像素，可选择4800像素超清输出。）','基于Android 9开发的Funtouch OS 9'),
(5,'spec.jpg','19.5:9零界全面屏，升降式摄像头，广角夜景三摄，Jovi语音助手','手机×1、充电器×1、数据线×1、耳机×1、保护壳×1、取卡针×1、快速入门指南×1、重要信息与保修卡×1（备注：最终以实物为准）','SDM675','8GB（注：由于手机系统和预装的程序占据了部分运存空间，实际运存空间少于8GB）','128GB（注：由于手机系统和预装的程序占据了部分存储空间，可用存储空间少于128GB)','4000mAh（典型值）','6.39英寸 FHD+（此为按照标准矩形测量的屏幕直角对角线的长度。<实际可视区域略小>）','2340×1080','157.66 × 74.26 × 8.95mm（手机尺寸可能会因工艺、材料供应商等变更而略有不同）','1600万像素','4800万像素主摄+1300万像素广角摄像头+500万像素虚化摄像头（实际使用中像素有剪裁,主摄像头使用三星GM1图像传感器，此图像传感器拥有4800万个物理像素点，默认输出四合一1200万像素，可选择4800像素超清输出。）','基于Android 9开发的Funtouch OS 9'),
(6,'spec.jpg','19.5:9零界全面屏，升降式摄像头，广角夜景三摄，Jovi语音助手','手机×1、充电器×1、数据线×1、耳机×1、保护壳×1、取卡针×1、快速入门指南×1、重要信息与保修卡×1（备注：最终以实物为准）','SDM675','8GB（注：由于手机系统和预装的程序占据了部分运存空间，实际运存空间少于8GB）','128GB（注：由于手机系统和预装的程序占据了部分存储空间，可用存储空间少于128GB)','4000mAh（典型值）','6.39英寸 FHD+（此为按照标准矩形测量的屏幕直角对角线的长度。<实际可视区域略小>）','2340×1080','157.66 × 74.26 × 8.95mm（手机尺寸可能会因工艺、材料供应商等变更而略有不同）','1600万像素','4800万像素主摄+1300万像素广角摄像头+500万像素虚化摄像头（实际使用中像素有剪裁,主摄像头使用三星GM1图像传感器，此图像传感器拥有4800万个物理像素点，默认输出四合一1200万像素，可选择4800像素超清输出。）','基于Android 9开发的Funtouch OS 9');

CREATE TABLE v_login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(50),
    /**密码需要加密后保存**/
    upwd VARCHAR(32)
);
INSERT INTO v_login VALUES
(NULL,'tom',md5('123')),
(NULL,'jerry',md5('123'));

#DECIMAL 高精度浮点数
#INT 199分 / 100 无误差
CREATE TABLE v_cart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lid INT,              #商品编号
    img VARCHAR(255),
    price DECIMAL(10,2),  #商品价格
    count INT,            #商品数量
    lname VARCHAR(255),   #商品名称
    uid INT
);
-- INSERT INTO v_login VALUES
-- (NULL,1,'p01.png.webp',2399,1,'S1 Pro 6GB+256GB 仲夏梦',1);
-- (NULL,2699,'X27 8GB+128GB版 印象夏日',"2");

CREATE TABLE v_list(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lid INT,              #商品编号
    img VARCHAR(255),
    price DECIMAL(10,2),  #商品价格
    count INT,            #商品数量
    lname VARCHAR(255),   #商品名称
    uid INT               #用户编号
);

CREATE TABLE v_evaluate(
    id INT PRIMARY KEY AUTO_INCREMENT,
    rate VARCHAR(25),
    img VARCHAR(255),
    vip VARCHAR(25),
    vimg VARCHAR(255),
    vtime VARCHAR(60),
    eval VARCHAR(255),
    pimg01 VARCHAR(255),
    pimg02 VARCHAR(255),
    pimg03 VARCHAR(255),
    reply VARCHAR(255)
);
INSERT INTO v_evaluate VALUES
(NULL,'100','avatar.png','v***2','silver.png','2019.09.04','手机是正品的，反应可以！物流飞快！','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……'),
(NULL,'100','avatar.png','v***2','silver.png','2019.09.04','竹林幻夜特别新颖，运行特别流畅，拍摄效果不错。特别满意的一次购物。','eval01.jpg','eval02.jpg','eval03.jpg','每一次的匠心之作，都只为让你多喜欢一点，更喜欢一点...'),
(NULL,'100','avatar.png','v***3','golden.png','2019.09.04','超级好看，货到的很快，像素特别棒，一直用的vivo的手机','eval01.jpg','eval02.jpg','eval03.jpg','人世间有百媚千红，唯独你是我情之所钟。'),
(NULL,'100','avatar.png','v***2','silver.png','2019.09.04','产品跟官方商城上面的图片一模一样，手机运行速度很快很好用，包装盒也很精美，顺丰快递发货速度很快！','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……'),
(NULL,'100','avatar.png','v***4','normal.png','2019.09.04','手机挺好的，刚收到试用了一下，感觉各方面都挺不错，手机颜值也不错的。','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……'),
(NULL,'100','avatar.png','v***4','silver.png','2019.09.04','3天到货正在试用！感觉良好！','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……'),
(NULL,'100','avatar.png','v***3','golden.png','2019.09.04','用了这门久了，挺好用的，打游戏不卡，像素很好，解锁很快','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……'),
(NULL,'100','avatar.png','v***4','normal.png','2019.09.04','好看，一如既往的好用','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……'),
(NULL,'100','avatar.png','v***4','normal.png','2019.09.04','手机是正品的，反应可以！物流飞快！','eval01.jpg','eval02.jpg','eval03.jpg','八百里加急，只因心系于您，不舍得您等太久，所以我们马不停蹄……');

CREATE TABLE v_intro(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lid INT,              #商品编号
    dimg01 VARCHAR(255),
    dimg02 VARCHAR(255),
    dimg03 VARCHAR(255),
    dimg04 VARCHAR(255),
    dimg05 VARCHAR(255),
    dimg06 VARCHAR(255),
    dimg07 VARCHAR(255),
    dimg08 VARCHAR(255)
);
INSERT INTO v_intro VALUES
(NULL,1,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,2,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,3,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,4,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,5,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,6,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,7,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp'),
(NULL,8,'d1.webp','d2.webp','d3.webp','d4.webp','d5.webp','d6.webp','d7.webp','d8.webp');

CREATE TABLE v_recommend(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(255),
    names VARCHAR(255),
    price DECIMAL(10,2)
);
INSERT INTO v_recommend VALUES
(NULL,'r1.webp','iQOO Neo 6GB+128GB 碳纤黑',1998),
(NULL,'r2.webp','X27 8GB+128GB版 印象夏日',2698),
(NULL,'r3.webp','Z5x 6GB+128GB 极光色',1598),
(NULL,'r4.webp','Z3 6GB+64GB 极光蓝',1248);