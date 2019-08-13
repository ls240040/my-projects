SET NAMES UTF8;
DROP DATABASE IF EXISTS vivo;
CREATE DATABASE vivo CHARSET=UTF8;
USE vivo;

/**轮播图**/
CREATE TABLE vcarousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (32),
    subtitle VARCHAR(32),
    buy VARCHAR(16),
    img VARCHAR(128)
);

INSERT INTO vcarousel VALUES
(NULL,'Z5 全面实力派','4800万超广角三摄|换新升级','>立即抢购','img/carousel_item/1.jpg'),
(NULL,'iQOO Neo','骁龙845 4500mAh续航','>立即抢购','img/carousel_item/2.jpg'),
(NULL,'Z5x 性能实力派','5000mAh大电池 骁龙710','>立即抢购','img/carousel_item/3.jpg');