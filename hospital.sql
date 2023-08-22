-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_dv`
--

DROP TABLE IF EXISTS `chi_tiet_dv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_dv` (
  `id_chitietDV` int NOT NULL AUTO_INCREMENT,
  `id_hd` int NOT NULL,
  `id_dv` int NOT NULL,
  PRIMARY KEY (`id_chitietDV`),
  KEY `id_Hoa_Don_idx` (`id_hd`),
  KEY `id_DV_idx` (`id_dv`),
  CONSTRAINT `id_DV` FOREIGN KEY (`id_dv`) REFERENCES `dich_vu` (`id_dv`),
  CONSTRAINT `id_Hoa_Don` FOREIGN KEY (`id_hd`) REFERENCES `hoa_don` (`id_hoadon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_dv`
--

LOCK TABLES `chi_tiet_dv` WRITE;
/*!40000 ALTER TABLE `chi_tiet_dv` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_dv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_lich_truc`
--

DROP TABLE IF EXISTS `chi_tiet_lich_truc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_lich_truc` (
  `id_ctLichTruc` int NOT NULL AUTO_INCREMENT,
  `id_lich_Truc` int DEFAULT NULL,
  `id_thoiGian_Truc` int DEFAULT NULL,
  PRIMARY KEY (`id_ctLichTruc`),
  KEY `id_lich_Truc_idx` (`id_lich_Truc`),
  KEY `id_thoiGian_Truc_idx` (`id_thoiGian_Truc`),
  CONSTRAINT `id_lich_Truc` FOREIGN KEY (`id_lich_Truc`) REFERENCES `lich_truc` (`id_lichTruc`),
  CONSTRAINT `id_thoiGian_Truc` FOREIGN KEY (`id_thoiGian_Truc`) REFERENCES `thoi_gian_truc` (`id_tgTruc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_lich_truc`
--

LOCK TABLES `chi_tiet_lich_truc` WRITE;
/*!40000 ALTER TABLE `chi_tiet_lich_truc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_lich_truc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_thuoc`
--

DROP TABLE IF EXISTS `chi_tiet_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_thuoc` (
  `id_chitiet_thuoc` int NOT NULL AUTO_INCREMENT,
  `id_thuoc` int DEFAULT NULL,
  `id_phieukham` int DEFAULT NULL,
  `so_luong_sd` int DEFAULT NULL,
  `hdsd` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_chitiet_thuoc`),
  KEY `ChiTietThuoc_Thuoc_idx` (`id_thuoc`),
  KEY `ChiTietThuoc_PhieuKhamBenh_idx` (`id_phieukham`),
  CONSTRAINT `ChiTietThuoc_PhieuKhamBenh` FOREIGN KEY (`id_phieukham`) REFERENCES `phieu_kham_benh` (`id_phieukham`),
  CONSTRAINT `ChiTietThuoc_Thuoc` FOREIGN KEY (`id_thuoc`) REFERENCES `thuoc` (`id_thuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_thuoc`
--

LOCK TABLES `chi_tiet_thuoc` WRITE;
/*!40000 ALTER TABLE `chi_tiet_thuoc` DISABLE KEYS */;
INSERT INTO `chi_tiet_thuoc` VALUES (1,1,1,3,NULL);
/*!40000 ALTER TABLE `chi_tiet_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dich_vu`
--

DROP TABLE IF EXISTS `dich_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dich_vu` (
  `id_dv` int NOT NULL AUTO_INCREMENT,
  `ten_dv` varchar(45) DEFAULT NULL,
  `gia_dv` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_dv`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu`
--

LOCK TABLES `dich_vu` WRITE;
/*!40000 ALTER TABLE `dich_vu` DISABLE KEYS */;
INSERT INTO `dich_vu` VALUES (1,'Xét Nghiệm',2000000),(2,'Tim Mạch',1000000),(3,'Răng Hàm Mặt',5000000),(4,'Xương Khớp',3000000);
/*!40000 ALTER TABLE `dich_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `id_hoadon` int NOT NULL AUTO_INCREMENT,
  `ngay_thanh_toan` datetime DEFAULT NULL,
  `tien_kham` decimal(10,0) DEFAULT '100000',
  `tien_thuoc` decimal(10,0) DEFAULT NULL,
  `loai_thanh_toan` varchar(45) DEFAULT NULL,
  `id_phieudky` int DEFAULT NULL,
  PRIMARY KEY (`id_hoadon`),
  KEY `HoaDon_PhieuDKy_idx` (`id_phieudky`),
  CONSTRAINT `HoaDon_PhieuDKy` FOREIGN KEY (`id_phieudky`) REFERENCES `phieu_dang_ky` (`id_phieudk`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` VALUES (1,'2023-07-25 00:00:00',100000,200000,NULL,1);
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_truc`
--

DROP TABLE IF EXISTS `lich_truc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_truc` (
  `id_lichTruc` int NOT NULL AUTO_INCREMENT,
  `trangThai_truc` tinyint DEFAULT NULL,
  `id_tk` int DEFAULT NULL,
  PRIMARY KEY (`id_lichTruc`),
  KEY `id_TK_idx` (`id_tk`),
  CONSTRAINT `id_TK` FOREIGN KEY (`id_tk`) REFERENCES `tai_khoan` (`id_tk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_truc`
--

LOCK TABLES `lich_truc` WRITE;
/*!40000 ALTER TABLE `lich_truc` DISABLE KEYS */;
/*!40000 ALTER TABLE `lich_truc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_dang_ky`
--

DROP TABLE IF EXISTS `phieu_dang_ky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieu_dang_ky` (
  `id_phieudk` int NOT NULL AUTO_INCREMENT,
  `id_bs` int DEFAULT NULL,
  `id_yt` int DEFAULT NULL,
  `id_bn` int DEFAULT NULL,
  `trangThai_dky` tinyint DEFAULT NULL,
  `ngay_dky` datetime DEFAULT NULL,
  `ngay_hkham` date DEFAULT NULL,
  `id_pk` int DEFAULT NULL,
  PRIMARY KEY (`id_phieudk`),
  KEY `id_pk_idx` (`id_pk`),
  KEY `id_bs_idx` (`id_bs`),
  KEY `id_yt_idx` (`id_yt`),
  KEY `id_bn_idx` (`id_bn`),
  CONSTRAINT `id_bn` FOREIGN KEY (`id_bn`) REFERENCES `tai_khoan` (`id_tk`),
  CONSTRAINT `id_bs` FOREIGN KEY (`id_bs`) REFERENCES `tai_khoan` (`id_tk`),
  CONSTRAINT `id_pk` FOREIGN KEY (`id_pk`) REFERENCES `phieu_kham_benh` (`id_phieukham`),
  CONSTRAINT `id_yt` FOREIGN KEY (`id_yt`) REFERENCES `tai_khoan` (`id_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_dang_ky`
--

LOCK TABLES `phieu_dang_ky` WRITE;
/*!40000 ALTER TABLE `phieu_dang_ky` DISABLE KEYS */;
INSERT INTO `phieu_dang_ky` VALUES (1,122,177,123,1,'2023-08-16 00:00:00','2023-09-05',1),(16,NULL,122,183,1,'2023-08-17 00:00:00',NULL,NULL),(17,NULL,177,166,1,'2023-08-17 00:00:00',NULL,NULL),(18,NULL,177,183,1,'2023-08-17 00:00:00',NULL,NULL),(19,121,177,183,1,'2023-08-17 00:00:00',NULL,NULL),(20,121,122,176,1,'2023-08-17 00:00:00',NULL,NULL),(21,121,122,176,1,'2023-08-17 00:00:00',NULL,NULL),(42,NULL,NULL,185,0,'2023-08-17 16:38:20',NULL,NULL),(43,NULL,NULL,185,0,'2023-08-17 16:41:44',NULL,NULL),(44,NULL,NULL,185,0,'2023-08-18 00:24:47',NULL,NULL),(45,NULL,NULL,185,0,'2023-08-18 00:24:49',NULL,NULL),(46,121,122,180,1,'2023-08-18 00:48:18',NULL,NULL),(47,NULL,NULL,183,0,'2023-08-18 12:03:47',NULL,NULL),(48,NULL,NULL,183,0,'2023-08-18 12:15:41',NULL,NULL),(49,NULL,NULL,183,0,'2023-08-19 12:26:35',NULL,NULL),(50,121,122,183,1,'2023-08-19 12:26:50',NULL,NULL);
/*!40000 ALTER TABLE `phieu_dang_ky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_kham_benh`
--

DROP TABLE IF EXISTS `phieu_kham_benh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieu_kham_benh` (
  `id_phieukham` int NOT NULL AUTO_INCREMENT,
  `trieu_chung` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ket_luan` varchar(50) DEFAULT NULL,
  `ngay_kham_benh` date DEFAULT NULL,
  PRIMARY KEY (`id_phieukham`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_kham_benh`
--

LOCK TABLES `phieu_kham_benh` WRITE;
/*!40000 ALTER TABLE `phieu_kham_benh` DISABLE KEYS */;
INSERT INTO `phieu_kham_benh` VALUES (1,'ho','ho nang','2023-09-05'),(2,'cảm','cảm nắng','2023-09-05');
/*!40000 ALTER TABLE `phieu_kham_benh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tai_khoan` (
  `id_tk` int NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(45) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` varchar(45) DEFAULT NULL,
  `dia_chi` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sdt` varchar(45) DEFAULT NULL,
  `tai_khoan` varchar(45) DEFAULT NULL,
  `mat_khau` varchar(1000) DEFAULT NULL,
  `avt` varchar(1000) DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_tk`),
  UNIQUE KEY `tai_khoan_UNIQUE` (`tai_khoan`),
  KEY `id_role_idx` (`id_role`),
  CONSTRAINT `id_role` FOREIGN KEY (`id_role`) REFERENCES `user_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (120,'admin','1993-01-01','Nam','Hồ Chí Minh','hmh20172018@gmail.com','0336334143','admin','$2a$10$NRkUDEpXVmNXeFh8HPtxNuc05YVyDpvhoFvziW9laLC0F6Cml2X3G','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683103/kneho0d5yklvcdk3noko.png',1),(121,'bacsiCEO','0014-02-13','Nam','Thủ Đức','2051052046hoang@ou.edu.vn','0336334143','bacsi','$2a$10$DyZzg5B0QvNUN6K3XRZCAu9XBhcXPIwT6KHUlqxbEqnYHdh1RgX26','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683133/evjnocjyaqeo9muvbcni.png',2),(122,'Myx','1993-01-01','Nam','Gia Lai','hoangcool2309@gmail.com','0979042815','yta','$2a$10$.U8hfAy7SYlLoFZ1djzZMO29V3U1.i11zcN8QEz1J5uU7lW4R1MiK','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683176/jkovgyw8x9ddw0xy0ape.png',3),(123,'Minh Hoang 2001111','2001-09-23','Nữ','Phú Mỹ','hmh20172018@gmail.com','0336334143','benhnhan','$2a$10$He2zbQAHa3Q8DwDQjbsCrOpWf0FMX7opuq49yl2TD6j3qNhs4KB2K','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683271/eflfqkh8otktvjbbdolr.png',2),(133,'hoanghacker123','2001-09-23','','','','','hoanghacker1233','$2a$10$thSj4m9EvlXhjGzeeSe1MOuD2DGqsFNB10mjmor5udlYmSkZ455zK','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691769245/pnly3xqxld8tkk3s4hj4.png',1),(137,'huynh minh hoang','2001-09-23','Nam','','','0336334143','hoangqqqq','$2a$10$/e6qqE0Yb.UQohApHwyqZ.TW7L/f0um5hL.hzvl5XdZOCUDSEn3nm','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691779088/ticu2u7xubs5vx82uxes.png',4),(140,'nguyen thanh thuyengggg an cccc','2001-09-23','Nữ','hcmcccc','thuyencc@gmail.com','0979041234','thuyennguyen','$2a$10$kzgmV6hGBNojGwGihNNdYuOucnvLIouD9stKe/2gD8hVgA2mNd8/m','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691819015/mcc1dkpzqixqz2wo117h.png',4),(142,'nguyen thi ngoc yen hahahaha','1993-01-01','Nữ','fdgdfg','yen@gmail.com','123123123','ngocyen','$2a$10$OhWdL6dX1lQuKivqe5RE6eb2FeuYRbsw/5Z9MVBHyRp4Vbux75Bcu','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691819351/zmypw6asvugdqsfytbly.png',4),(143,'thay ong noi ne hafsdsdasd','1998-09-23','Nữ','an giang city','2051052046hoangvvv@ou.edu.vn','09790428147','tanphat','$2a$10$oxMZihduwkhdcTK.HDLCwueemWI/OgAiPxKAP7Ewz/Ai6kSviTeSu','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691855635/p4trk1pz3dj5n8ytkyow.png',4),(144,'huynh minh hoang','2001-09-23','Nam','sdfsdf','2051052046hoang@ou.edu.vn','0336334143','bacsihoang','$2a$10$pVolHAzMploxcvMZ19e8qeZKXMZTQZ0maXkQ6AAyt.ays7fXH6fEW',NULL,2),(145,'my nguyen','2001-09-23','Nữ','dfgdfgdfg','hoangcool2309@gmail.com','0336334143','bacsimy','$2a$10$lEnFzmUAOnH9SORleH0oqeujYzpJzUneEQaQEjNEobF4BLGcePmia',NULL,2),(146,'',NULL,'','','','','ytahoang','$2a$10$M1nonR5WPfQZ/NFKcPLp1eOxuHPGQZnj0Xivy6rCu/VHl55xOYITS',NULL,3),(151,'cccccccccc',NULL,'','','','','cc','$2a$10$QS2DrnqaUTC4VTWiHXPnG.PdXePXY4nfMRHHELuMusdwaVdYuggdC','',1),(166,'sssss','0014-02-13','Nam','dsff','hmh20172018@gmail.com','0336334143','hoanggggg','$2a$10$X3oVribKU9PqYnhDLkPjR.xbAOM.1ATN53N4IpN9yC7kZ83zuPiyG','',4),(167,'',NULL,'','','','','','$2a$10$1jv2GExx66jzR4F8XpGt..zAmHx9M8RWPnnnGSK7DNWPPHe291G7a','',1),(170,'',NULL,'','','','','123','$2a$10$pKf6vjrmQHpJWUfH3aHVpOjFFdOwhyDsnRzgc.h/q8VH3aiaW./nK','',1),(173,'',NULL,'','','','','123123','$2a$10$c4XI8jXkQ9gK1Fxlzx6fD.fQ5uQ/O0DlKBcU87wcxOLjbpDDeQ6Ci','',1),(176,'ddddddccc',NULL,'','','','','dd','$2a$10$46hHlkMI/iO1IiGtCzzBUeHENtUM2aaiKJuNBA9oU/v/LJARWk6Zq','',4),(177,'thuyen ngu ngoc','1993-01-01','Nam','abc','2051fdsfg@ou.edu.vn','1231312','ytathuyen','$2a$10$AjTCLJ9QH8Yx2I8GkiaMbefCQQvP1Q5N4T1MbwMqOSUd4vwVLzMYq','',3),(179,'',NULL,'','','','','yta123','$2a$10$vwQGblSvHYEs69mICD3x4u6x/GRKBlOWVWCV0cWnoXE49SB4YVSIS',NULL,4),(180,'huynh minh hoang','2001-09-23','Nam','dfgdfgdfg','2051052046hoccccang@ou.edu.vn','0336334143','yta1234','$2a$10$u/BQ8ktZ5PD4y4jjogWlHO.jTcj8xWaVomY.s2sR1y3jI7FWReXbO','',4),(183,'hoangcoolaa20011','2001-01-20','Nam','gò vấppppp','benhnhan1@gmail.com','0336334143','benhnhan1','$2a$10$22mVdZLUVRCzWd331O1eXuwOngBe7r4PLDaeg20kYIB5G.knVa7CO','',4),(185,'huynh minh hoang','2001-02-21','Nam','hcm','2051052046hoang@ou.edu.vn','0336334143','benhnhanhoang','$2a$10$b/r966M6E6YnxBFkEUX4u.Q8Gpz9ewdLK6fe825/HO4RJ7u4/1gP6','https://res.cloudinary.com/diyeuzxqt/image/upload/v1692263546/h9f9m7falfri7wwzdyxa.png',4);
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoi_gian_truc`
--

DROP TABLE IF EXISTS `thoi_gian_truc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thoi_gian_truc` (
  `id_tgTruc` int NOT NULL AUTO_INCREMENT,
  `buoi_truc` varchar(45) DEFAULT NULL,
  `bat_dau` time DEFAULT NULL,
  `ket_thuc` time DEFAULT NULL,
  PRIMARY KEY (`id_tgTruc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoi_gian_truc`
--

LOCK TABLES `thoi_gian_truc` WRITE;
/*!40000 ALTER TABLE `thoi_gian_truc` DISABLE KEYS */;
INSERT INTO `thoi_gian_truc` VALUES (1,'Sáng','08:00:00','12:00:00'),(2,'Trưa','12:00:00','16:00:00'),(3,'Chiều','16:00:00','20:00:00');
/*!40000 ALTER TABLE `thoi_gian_truc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `id_thuoc` int NOT NULL AUTO_INCREMENT,
  `ten_thuoc` varchar(50) DEFAULT NULL,
  `xuat_xu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gia_thuoc` decimal(10,0) DEFAULT NULL,
  `don_vi` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  PRIMARY KEY (`id_thuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (1,'vitaminA','việt nam',25000,'tuýp',100),(5,'thuốc cảm','vn',20000,'viên',123),(6,'thuốc sốt','vn',123000,'vỉ',200),(12,'dfg','dfgdfg',34234,'df',234234),(15,'dfs','sdfsdf',12321,'sdfsdf',123123),(17,'VitaminBaaafff','VN',123123123,'vieen',123);
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `chuc_vu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_BACSI'),(3,'ROLE_YTA'),(4,'ROLE_BENHNHAN');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 10:10:19
