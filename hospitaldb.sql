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
  `id_pdk` int DEFAULT NULL,
  `id_dv` int DEFAULT NULL,
  PRIMARY KEY (`id_chitietDV`),
  KEY `id_DV_idx` (`id_dv`),
  KEY `id_pdk_idx` (`id_pdk`),
  CONSTRAINT `id_DV` FOREIGN KEY (`id_dv`) REFERENCES `dich_vu` (`id_dv`),
  CONSTRAINT `id_pdk` FOREIGN KEY (`id_pdk`) REFERENCES `phieu_dang_ky` (`id_phieudk`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_dv`
--

LOCK TABLES `chi_tiet_dv` WRITE;
/*!40000 ALTER TABLE `chi_tiet_dv` DISABLE KEYS */;
INSERT INTO `chi_tiet_dv` VALUES (5,20,2),(9,20,4),(10,20,4),(16,20,NULL),(17,20,4),(36,20,NULL),(42,20,4),(43,20,3),(46,20,3),(47,20,2),(53,20,3),(63,73,3),(64,75,2),(65,75,5),(71,75,2),(72,75,6),(73,183,1),(74,183,5),(75,183,4),(76,183,1),(77,183,3),(78,183,4),(79,183,3),(80,183,5),(81,183,2),(82,183,3),(83,183,3),(84,183,3),(85,183,6),(86,183,2),(87,183,1),(88,183,7),(89,75,4);
/*!40000 ALTER TABLE `chi_tiet_dv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_thoi_gian_truc`
--

DROP TABLE IF EXISTS `chi_tiet_thoi_gian_truc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_thoi_gian_truc` (
  `id_chi_tiet_tg_truc` int NOT NULL AUTO_INCREMENT,
  `id_tk` int DEFAULT NULL,
  `id_tg_truc` int DEFAULT NULL,
  `ngay_dky_truc` date DEFAULT NULL,
  `trang_thai_truc` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_chi_tiet_tg_truc`),
  KEY `id_tg_truc_idx` (`id_tg_truc`),
  KEY `taikhoan_idx` (`id_tk`),
  CONSTRAINT `id_tg_truc` FOREIGN KEY (`id_tg_truc`) REFERENCES `thoi_gian_truc` (`id_tgTruc`),
  CONSTRAINT `taikhoan` FOREIGN KEY (`id_tk`) REFERENCES `tai_khoan` (`id_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_thoi_gian_truc`
--

LOCK TABLES `chi_tiet_thoi_gian_truc` WRITE;
/*!40000 ALTER TABLE `chi_tiet_thoi_gian_truc` DISABLE KEYS */;
INSERT INTO `chi_tiet_thoi_gian_truc` VALUES (155,121,3,'2023-09-10',1),(156,121,2,'2023-09-07',1),(157,121,2,'2023-09-05',1),(158,121,2,'2023-09-12',1),(159,189,3,'2023-09-09',1),(160,189,2,'2023-09-14',1),(182,189,2,'2023-09-14',1);
/*!40000 ALTER TABLE `chi_tiet_thoi_gian_truc` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_thuoc`
--

LOCK TABLES `chi_tiet_thuoc` WRITE;
/*!40000 ALTER TABLE `chi_tiet_thuoc` DISABLE KEYS */;
INSERT INTO `chi_tiet_thuoc` VALUES (1,1,1,3,'Ngày 1 viên'),(2,1,NULL,2,'1 ngÃ y 2 viÃªn'),(3,5,NULL,2,'1 ngÃ y 2 viÃªn'),(4,6,NULL,3,'1 ngÃ y 2 viÃªn'),(5,6,NULL,2,'ngÃ y 2 viÃªn'),(6,5,NULL,2,'1 ngÃ y 2 viÃªn'),(7,6,NULL,2,'1 ngÃ y 2 viÃªn'),(8,17,357,10,'5 ngay 1 vien'),(9,6,358,2,'1 ngÃ y 2 viÃªn'),(11,1,NULL,6,'1 ngÃ y 2 viÃªn'),(12,1,364,9,'ngÃ y 2 viÃªn'),(13,NULL,NULL,NULL,''),(14,12,366,4,NULL),(15,1,367,5,''),(16,1,368,5,''),(17,1,369,5,'6 ngÃ y 2 viÃªn'),(18,1,371,22,'1 ngÃ y 2 viÃªn111'),(19,1,372,7,'1 ngÃ y 2 viÃªn111'),(20,5,373,8,''),(21,1,374,9,NULL),(22,1,375,2,'1 ngÃ y 2 viÃªn'),(23,1,376,8,'1 ngÃ y 2 viÃªn111'),(24,NULL,377,NULL,''),(25,NULL,377,NULL,''),(26,5,378,4,'1 ngÃ y 2 viÃªn111'),(27,5,379,3,'5 ngay 1 vien'),(28,5,380,2,'5 ngay 1 vien'),(29,6,382,5,'1 ngÃ y 2 viÃªn'),(30,5,383,5,'1 ngÃ y 2 viÃªn'),(31,12,384,4,'hhhh'),(32,6,386,2,'6 ngÃ y 2 viÃªn'),(33,17,390,6,'1 ngÃ y 2 viÃªn'),(34,17,392,5,'1 ngÃ y 2 viÃªn'),(35,5,394,4,'ngÃ y 2 viÃªn'),(36,1,395,5,'1 ngÃ y 2 viÃªn111'),(37,1,396,5,'1 ngÃ y 2 viÃªn'),(38,5,397,2,'hhhh'),(39,5,398,2,'1 ngÃ y 2 viÃªn111'),(40,6,400,2,'ngÃ y 2 viÃªn'),(41,5,400,2,'1 ngÃ y 2 viÃªn'),(42,5,401,2,'1 ngÃ y 2 viÃªn'),(43,1,402,2,'ngÃ y 2 viÃªn'),(44,5,403,9,'1 ngÃ y 2 viÃªn'),(45,5,404,2,'6 ngÃ y 2 viÃªn'),(46,5,405,3,'1 ngÃ y 2 viÃªn'),(47,1,406,5,'5 ngay 1 vien'),(48,5,407,4,'1 ngÃ y 2 viÃªn111'),(49,5,407,2,'6 ngÃ y 2 viÃªn'),(50,5,408,7,'1 ngÃ y 2 viÃªn111'),(51,15,409,2,'5 ngay 1 vien'),(52,6,409,3,'1 ngÃ y 2 viÃªn'),(53,6,409,2,'ngÃ y 2 viÃªn'),(54,6,410,5,'1 ngÃ y 2 viÃªn111'),(55,17,410,33,'1 ngÃ y 2 viÃªn'),(56,5,410,8,'1 ngÃ y 2 viÃªn111'),(57,5,411,2,'1 ngÃ y 2 viÃªn111'),(58,5,412,2,'1 ngay 2 vien'),(59,6,413,8,'1 ngÃ y 2 viÃªn'),(62,6,414,3,'1 ngÃ y 2 viÃªn'),(63,12,414,6,'hhhh'),(64,1,415,2,'6 ngÃ y 2 viÃªn'),(65,1,416,10,'1 ngÃ y 2 viÃªn'),(66,1,416,91,'1 ngÃ y 2 viÃªn'),(67,1,416,101,'1 ngÃ y 2 viÃªn'),(68,1,417,10,'1 ngÃ y 2 viÃªn'),(69,5,418,1,'1 ngÃ y 2 viÃªn'),(70,5,418,10,'1 ngÃ y 2 viÃªn111'),(71,5,420,2,'1 ngÃ y 2 viÃªn'),(72,5,420,1,'hhhh'),(73,6,421,2,'1 ngÃ y 2 viÃªn111'),(74,6,NULL,1,''),(75,12,NULL,1,'1 ngÃ y 2 viÃªn'),(76,12,NULL,1,'1 ngÃ y 2 viÃªn'),(77,5,422,6,'1 ngÃ y 2 viÃªn'),(78,6,422,7,'6 ngÃ y 2 viÃªn'),(79,17,422,12,''),(80,12,422,5,''),(81,23,423,1,'1 ngÃ y 2 viÃªn'),(82,5,424,1,'1 ngÃ y 2 viÃªn'),(83,5,425,9,'1 ngÃ y 2 viÃªn'),(84,5,426,10,''),(85,5,427,5,'1 ngÃ y 2 viÃªn111'),(86,6,428,3,''),(87,12,NULL,3,''),(88,6,429,2,''),(89,12,430,5,'ngÃ y 2 viÃªn'),(90,12,430,5,'1 ngÃ y 2 viÃªn'),(91,17,430,3,'ngÃ y 2 viÃªn'),(92,15,433,2,''),(93,12,433,1,'11'),(94,12,437,9,'1 ngÃ y 2 viÃªn'),(95,6,438,5,'1 ngÃ y 2 viÃªn'),(96,23,438,3,'asd'),(99,17,439,3,''),(100,15,440,2,''),(101,12,440,4,''),(102,5,440,2,''),(103,12,441,3,''),(104,15,442,3,''),(105,6,444,6,'5 ngay 1 vien'),(106,17,444,5,''),(107,15,445,4,''),(110,6,448,10,''),(111,1,448,20,'gdfg'),(112,1,448,20,'hj'),(113,6,449,10,''),(114,15,449,1,'ngÃ y 2 viÃªn'),(115,6,451,10,'1 ngÃ y 2 viÃªn'),(116,1,451,10,''),(117,5,452,3,'1 ngÃ y 2 viÃªn'),(118,6,452,4,'ngÃ y 2 viÃªn'),(119,5,453,5,''),(120,6,458,5,'k'),(121,1,459,2,'6 ngÃ y 2 viÃªn'),(122,1,465,4,'1 ngÃ y 2 viÃªn'),(123,1,465,4,'4'),(124,1,465,4,''),(125,1,466,5,'1 ngÃ y 2 viÃªn'),(126,1,466,5,'1 ngÃ y 2 viÃªn'),(127,1,466,6,'1 ngÃ y 2 viÃªn111'),(128,1,467,2,'1 ngÃ y 2 viÃªn'),(129,15,467,4,''),(130,1,467,12,'ÄÃ¡'),(131,6,468,4,'5 ngay 1 vien'),(132,6,468,5,'1 ngÃ y 2 viÃªn'),(133,29,468,5,'1 ngÃ y 2 viÃªn111');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu`
--

LOCK TABLES `dich_vu` WRITE;
/*!40000 ALTER TABLE `dich_vu` DISABLE KEYS */;
INSERT INTO `dich_vu` VALUES (1,'Xét Nghiệm',2000000),(2,'Tim Mạch',1000000),(3,'Răng Hàm Mặt',5000000),(4,'Xương Khớp',3000000),(5,'KhÃ¡m rÄng',150000),(6,'XÃ©t nghiá»m Tá»ng QuÃ¡n',2000000),(7,'Tim',1500000),(8,'KhÃ¡m rÄng',87877887);
/*!40000 ALTER TABLE `dich_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donvi_thuoc`
--

DROP TABLE IF EXISTS `donvi_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donvi_thuoc` (
  `id_donVi` int NOT NULL AUTO_INCREMENT,
  `ten_don_vi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_donVi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donvi_thuoc`
--

LOCK TABLES `donvi_thuoc` WRITE;
/*!40000 ALTER TABLE `donvi_thuoc` DISABLE KEYS */;
INSERT INTO `donvi_thuoc` VALUES (1,'Viên'),(2,'Vĩ'),(3,'Chai'),(4,'Lọ'),(5,'Tuýp');
/*!40000 ALTER TABLE `donvi_thuoc` ENABLE KEYS */;
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
  `tien_thuoc` decimal(10,0) DEFAULT NULL,
  `tien_dv` decimal(10,0) DEFAULT NULL,
  `tien_kham` int DEFAULT NULL,
  `id_phieudky` int DEFAULT NULL,
  PRIMARY KEY (`id_hoadon`),
  KEY `HoaDon_PhieuDKy_idx` (`id_phieudky`),
  KEY `tien_kham_idx` (`tien_kham`),
  CONSTRAINT `HoaDon_PhieuDKy` FOREIGN KEY (`id_phieudky`) REFERENCES `phieu_dang_ky` (`id_phieudk`),
  CONSTRAINT `tien_kham` FOREIGN KEY (`tien_kham`) REFERENCES `tien_kham` (`id_tienKham`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` VALUES (20,'2023-09-07 00:01:31',160000,10000000,1,56),(31,'2023-08-07 01:47:27',1270000,5000000,1,73),(32,'2023-01-07 01:47:27',100000,200000,1,1),(33,'2023-02-07 01:47:27',111111,222222,1,20),(34,'2023-04-07 01:47:27',20000,40000,1,66),(35,NULL,1480000,1150000,1,75),(38,NULL,8607000,42800000,1,183);
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_thuoc`
--

DROP TABLE IF EXISTS `loai_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_thuoc` (
  `idloai_thuoc` int NOT NULL AUTO_INCREMENT,
  `ten_loai_thuoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idloai_thuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_thuoc`
--

LOCK TABLES `loai_thuoc` WRITE;
/*!40000 ALTER TABLE `loai_thuoc` DISABLE KEYS */;
INSERT INTO `loai_thuoc` VALUES (1,'Thuốc gây mê'),(2,'Thuốc giảm đau'),(3,'Thuốc dị ứng'),(4,'Thuốc tim mạch'),(5,'Thuốc da liễu'),(6,'Thuốc điều trị mắt'),(7,'Thuốc tai, mũi, họng'),(8,'Thuốc bắc'),(9,'Thuốc nam');
/*!40000 ALTER TABLE `loai_thuoc` ENABLE KEYS */;
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
  `chon_ngaykham` date DEFAULT NULL,
  `thoi_gian_taophieu` datetime DEFAULT NULL,
  `thoi_gian_kham` varchar(45) DEFAULT NULL,
  `id_pk` int DEFAULT NULL,
  PRIMARY KEY (`id_phieudk`),
  KEY `id_pk_idx` (`id_pk`),
  KEY `id_bs_idx` (`id_bs`),
  KEY `id_yt_idx` (`id_yt`),
  KEY `id_bn_idx` (`id_bn`),
  CONSTRAINT `id_bn` FOREIGN KEY (`id_bn`) REFERENCES `tai_khoan` (`id_tk`),
  CONSTRAINT `id_bs` FOREIGN KEY (`id_bs`) REFERENCES `tai_khoan` (`id_tk`) ON DELETE SET NULL,
  CONSTRAINT `id_pk` FOREIGN KEY (`id_pk`) REFERENCES `phieu_kham_benh` (`id_phieukham`),
  CONSTRAINT `id_yt` FOREIGN KEY (`id_yt`) REFERENCES `tai_khoan` (`id_tk`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_dang_ky`
--

LOCK TABLES `phieu_dang_ky` WRITE;
/*!40000 ALTER TABLE `phieu_dang_ky` DISABLE KEYS */;
INSERT INTO `phieu_dang_ky` VALUES (1,145,122,123,1,'2023-09-14','2023-09-09 02:35:16','SÃ¡ng',1),(20,121,122,185,0,'2023-09-07','2023-09-09 02:35:16','TrÆ°a',NULL),(42,144,122,185,0,'2023-09-14','2023-09-09 02:35:16','TrÆ°a',NULL),(56,144,122,185,0,'2023-08-14','2023-09-09 02:35:16','Chiá»u',NULL),(66,NULL,NULL,188,0,'2023-09-14','2023-09-09 02:35:16','Trưa',NULL),(73,189,122,183,1,'2023-09-09','2023-09-09 02:35:16','TrÆ°a',NULL),(75,121,122,183,1,'2023-09-09','2023-09-09 02:35:16','Chiá»u',469),(167,NULL,NULL,208,0,'2023-09-28','2023-09-09 02:35:16','Trưa',NULL),(182,NULL,NULL,183,0,'2001-09-20','2023-09-09 15:14:59','Trưa',NULL),(183,121,122,190,1,'2023-09-12','2023-09-08 15:14:59','TrÆ°a',470),(184,NULL,NULL,190,0,'2023-09-06','2023-09-09 15:30:44','Trưa',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_kham_benh`
--

LOCK TABLES `phieu_kham_benh` WRITE;
/*!40000 ALTER TABLE `phieu_kham_benh` DISABLE KEYS */;
INSERT INTO `phieu_kham_benh` VALUES (1,'ho','ho nang','2023-09-05'),(2,'cảm','cảm nắng','2023-09-05'),(3,'sốt','sốt sơ vi','2023-08-24'),(4,'sổ mũi','mủi sỗ','2023-07-24'),(15,'khung1','ngao1','2023-08-25'),(16,'khungkhung','ngao123','2023-08-25'),(17,'khungkhung','haha','2023-08-25'),(18,'khungkhung','haha','2023-08-25'),(19,'khungkhung','khungkhung123','2023-08-25'),(20,'dÃ¡d','Ã¡dasd','2023-08-25'),(21,'khungkhung','khungkhung123','2023-08-25'),(334,'khungkhunggg','khungkhunggg','2023-08-25'),(335,'khungkhung','khungkhung123','2023-08-26'),(336,'khungkhung','khungkhung666','2023-08-26'),(337,'khungkhung','haha','2023-08-26'),(338,'khungkhung','khungkhungssss','2023-08-26'),(339,'khungkhung13','12312312312','2023-08-26'),(340,'tá»± ká»','tá»± ká» giai Äoáº¡n cuá»i','2023-08-26'),(341,'hahahaha','hahahahahah','2023-08-26'),(342,'ho nhẹ','ho nhẹ','2023-08-26'),(343,'aaa','aa','2023-08-26'),(344,'ho nhẹ','ho nhẹ','2023-08-26'),(345,'ho nhẹ','ho nhẹ','2023-08-26'),(346,'ho nhẹ','cảm ','2023-08-26'),(347,'khungkhunggggggggggggg','khungkhunggggggggg','2023-08-26'),(348,'Ho nháº¹','Nhe há»','2023-08-26'),(349,'','','2023-08-27'),(350,'yen ngao','ngao yen','2023-08-27'),(351,'yen ngao','ngao yen','2023-08-27'),(352,'yen ngao','ngao yen','2023-08-27'),(353,'yen ngao','ngao yen','2023-08-27'),(354,'yen ngao op','Ã´ppopop','2023-08-27'),(355,'khungkhung','haha','2023-08-27'),(356,'khungkhung','123123','2023-08-27'),(357,'khungkhung','khungkhung123','2023-08-27'),(358,'khungkhung','khungkhung123','2023-08-27'),(359,'khung','ngao123','2023-08-27'),(360,'khung','ngao123','2023-08-27'),(361,'','','2023-08-27'),(362,'','','2023-08-27'),(363,'','','2023-08-27'),(364,'khungkhung','khungkhung','2023-08-27'),(365,'','','2023-08-27'),(366,'','','2023-08-27'),(367,'','','2023-08-27'),(368,'khungkhung','ngao123','2023-08-27'),(369,'khungkhung','khungkhung','2023-08-27'),(370,'khungkhung','123123','2023-08-27'),(371,'khungkhung','123123','2023-08-27'),(372,'','','2023-08-27'),(373,'','','2023-08-27'),(374,'','','2023-08-27'),(375,'hhh','hhhhh','2023-08-27'),(376,'khungkhung','khungkhung123','2023-08-27'),(377,'','','2023-08-27'),(378,'khung','khungkhung','2023-08-28'),(379,'khungkhung','123123','2023-08-28'),(380,'khungkhung','ngao','2023-08-28'),(381,'khungkhung','ngao','2023-08-28'),(382,'khungkhung','khungkhung','2023-08-28'),(383,NULL,NULL,'2023-08-29'),(384,NULL,NULL,'2023-08-29'),(385,NULL,NULL,'2023-08-29'),(386,NULL,NULL,'2023-08-29'),(387,NULL,NULL,'2023-08-29'),(388,NULL,NULL,'2023-08-29'),(389,NULL,NULL,'2023-08-29'),(390,NULL,NULL,'2023-08-29'),(391,NULL,NULL,'2023-08-29'),(392,NULL,NULL,'2023-08-29'),(393,NULL,NULL,'2023-08-29'),(394,NULL,NULL,'2023-08-29'),(395,NULL,NULL,'2023-08-29'),(396,NULL,NULL,'2023-08-29'),(397,NULL,NULL,'2023-08-29'),(398,'khung','ngao123','2023-08-29'),(399,NULL,'hhh','2023-08-29'),(400,'khungkhung','ngao123','2023-08-29'),(401,'khungkhungggggg','khungkhung123ggg','2023-08-29'),(402,'khungkhung','khungkhung','2023-08-29'),(403,'khungkhung','khungkhung123','2023-08-29'),(404,'khung','khungkhung123','2023-08-29'),(405,'','','2023-08-29'),(406,'khungkhung','123123','2023-08-29'),(407,'khungkhung','khungkhung123','2023-08-29'),(408,'khungkhung','khungkhung','2023-08-29'),(409,'khungkhung','khungkhung','2023-08-29'),(410,'khungkhung','ngao123','2023-08-29'),(411,'','','2023-08-29'),(412,'Ho nháº¹','Cáº£m cÃºm','2023-08-29'),(413,'khungkhung','ngao123','2023-08-30'),(414,'yen ngao','ngao','2023-08-30'),(415,'khungkhung','ngao','2023-08-30'),(416,'khungkhung','haha','2023-08-30'),(417,'khungkhung','khungkhung','2023-08-30'),(418,'khungkhung','khungkhung','2023-08-30'),(419,'khungkhung','123123','2023-08-30'),(420,'khungkhung','123123','2023-08-30'),(421,'','','2023-08-30'),(422,'hihihi','hihihihi','2023-08-30'),(423,'khungkhung','khungkhung','2023-08-30'),(424,'khungkhung','khungkhung','2023-08-30'),(425,'khungkhung','ngao','2023-08-30'),(426,'khungkhung','haha','2023-08-30'),(427,'khungkhung','khungkhung123','2023-08-30'),(428,'','','2023-08-30'),(429,'22','1231','2023-08-31'),(430,'khungkhung','khungkhung','2023-08-31'),(431,'22','213','2023-08-31'),(432,'khungkhung','khungkhung','2023-08-31'),(433,'khungkhung','khungkhung123','2023-08-31'),(434,'khungkhung','khungkhung123','2023-08-31'),(435,'','','2023-08-31'),(436,'khungkhung','khungkhung','2023-08-31'),(437,'khungkhung','haha','2023-08-31'),(438,'khungkhung','ngao','2023-08-31'),(439,'khungkhung','khungkhung123','2023-08-31'),(440,'khungkhung','123123','2023-08-31'),(441,'khungkhung','khungkhung','2023-08-31'),(442,'khungkhung','khungkhung123','2023-08-31'),(443,'','','2023-08-31'),(444,'Ã¡d','khungkhung','2023-08-31'),(445,'khungkhung','khungkhung123','2023-08-31'),(446,'khungkhung','khungkhung','2023-09-04'),(448,'Ã¡ds','dsd','2023-09-06'),(449,'khungkhung','khungkhung123','2023-09-07'),(450,'thuyen bi ho','thuyen bi ngu','2023-09-07'),(451,'khungkhung','ngao','2023-09-07'),(452,'khungkhung','khungkhung123','2023-09-07'),(453,'yen ngao','ngao','2023-09-07'),(454,'ffgfdg','fgdfgd','2023-09-08'),(455,'khung1','123','2023-09-09'),(456,'dsf','sd','2023-09-09'),(457,'khungkhung','khungkhung123','2023-09-09'),(458,'khungkhung','khungkhung123','2023-09-09'),(459,'khung','khungkhung','2023-09-09'),(460,'khungkhung','khungkhung123','2023-09-09'),(461,'khungkhung','ngao','2023-09-09'),(462,'khungkhung','khungkhung123','2023-09-09'),(463,'khungkhung','ngao','2023-09-09'),(464,'khungkhung','ngao','2023-09-09'),(465,'khungkhung','khungkhung','2023-09-09'),(466,'khungkhung','khungkhung123','2023-09-09'),(467,'df','fdg','2023-09-09'),(468,'khung','khungkhung','2023-09-09'),(469,'khungkhung','ngao123','2023-09-09'),(470,'khungkhung','haha','2023-09-10');
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
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (120,'admin','1993-01-01','Nam','Hồ Chí Minh','hmh20172018@gmail.com','0336334143','admin','$2a$10$4rVL8GVgPPhSicloXCSrE.eYsDSiUWnlIMYf6bBnsQrWk9Cl8DEea','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683103/kneho0d5yklvcdk3noko.png',1),(121,'bacsiCEO','0014-02-13','Nam','Thủ Đức','2051052046@ou.edu.vn','0336334143','bacsi','$2a$10$DyZzg5B0QvNUN6K3XRZCAu9XBhcXPIwT6KHUlqxbEqnYHdh1RgX26','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683133/evjnocjyaqeo9muvbcni.png',2),(122,'Myx','1993-01-01','Nam','Gia Lai','hoangcool2309@gmail.com','0979042815','yta','$2a$10$qaat4knATEDxUV1baisVB.HZAF1XRbxbqra9KybsvwZNjWtD2t4ZG','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683176/jkovgyw8x9ddw0xy0ape.png',3),(123,'Minh Hoang 2001111','2001-09-23','Nữ','Phú Mỹ','2051052046hoang@ou.edu.vn','0336334143','benhnhan','$2a$10$He2zbQAHa3Q8DwDQjbsCrOpWf0FMX7opuq49yl2TD6j3qNhs4KB2K','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683271/eflfqkh8otktvjbbdolr.png',2),(133,'hoanghacker123','2001-09-23','','','','','hoanghacker1233','$2a$10$thSj4m9EvlXhjGzeeSe1MOuD2DGqsFNB10mjmor5udlYmSkZ455zK','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691769245/pnly3xqxld8tkk3s4hj4.png',1),(137,'huynh minh hoang','2001-09-23','Nam','','','0336334143','hoangqqqq','$2a$10$/e6qqE0Yb.UQohApHwyqZ.TW7L/f0um5hL.hzvl5XdZOCUDSEn3nm','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691779088/ticu2u7xubs5vx82uxes.png',4),(140,'nguyen thanh thuyengggg an cccc','2001-09-23','Nữ','hcmcccc','thuyencc@gmail.com','0979041234','thuyennguyen','$2a$10$kzgmV6hGBNojGwGihNNdYuOucnvLIouD9stKe/2gD8hVgA2mNd8/m','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691819015/mcc1dkpzqixqz2wo117h.png',4),(142,'nguyen thi ngoc yen hahahaha','1993-01-01','Nữ','fdgdfg','yen@gmail.com','123123123','ngocyen','$2a$10$OhWdL6dX1lQuKivqe5RE6eb2FeuYRbsw/5Z9MVBHyRp4Vbux75Bcu','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691819351/zmypw6asvugdqsfytbly.png',4),(143,'thay ong noi ne hafsdsdasd','1998-09-23','Nữ','an giang city','2051052046hoangvvv@ou.edu.vn','09790428147','tanphat','$2a$10$oxMZihduwkhdcTK.HDLCwueemWI/OgAiPxKAP7Ewz/Ai6kSviTeSu','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691855635/p4trk1pz3dj5n8ytkyow.png',4),(144,'huynh minh hoang','2001-09-23','Nam','sdfsdf','2051052046@ou.edu.vn','0336334143','bacsihoang','$2a$10$pVolHAzMploxcvMZ19e8qeZKXMZTQZ0maXkQ6AAyt.ays7fXH6fEW','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691683133/evjnocjyaqeo9muvbcni.png',2),(145,'my nguyen','2001-09-23','Nữ','dfgdfgdfg','hoangcool2309@gmail.com','0336334143','bacsimy','$2a$10$lEnFzmUAOnH9SORleH0oqeujYzpJzUneEQaQEjNEobF4BLGcePmia','https://res.cloudinary.com/diyeuzxqt/image/upload/v1691819351/zmypw6asvugdqsfytbly.png',2),(180,'huynh minh hoang','2001-09-23','Nam','dfgdfgdfg','2051052046hoang@ou.edu.vn','0336334143','yta1234','$2a$10$u/BQ8ktZ5PD4y4jjogWlHO.jTcj8xWaVomY.s2sR1y3jI7FWReXbO','',4),(183,'hoangpessi','2001-01-20','Nam','gò vấppppp','hmh20172018@gmail.com','0336334143','benhnhan1','$2a$10$22mVdZLUVRCzWd331O1eXuwOngBe7r4PLDaeg20kYIB5G.knVa7CO','https://res.cloudinary.com/diyeuzxqt/image/upload/v1692556238/r83co7ksetih6votsgj3.png',4),(185,'huynh minh hoang','2001-02-21','Nam','hcm','2051052046@ou.edu.vn','0336334143','benhnhanhoang','$2a$10$b/r966M6E6YnxBFkEUX4u.Q8Gpz9ewdLK6fe825/HO4RJ7u4/1gP6','https://res.cloudinary.com/diyeuzxqt/image/upload/v1692263546/h9f9m7falfri7wwzdyxa.png',4),(186,'taolabacsi','2023-09-09','Nam','hcm','hoangcool2309@gmail.com','0336334143','bacsithanh','$2a$10$2svj8CvLW8yl9NRr2zNW1Oh06Bwz8H3iKCq.Lz9WyFEXSpyuNKuBe','https://res.cloudinary.com/diyeuzxqt/image/upload/v1692559181/pyt3ifmo1hspwfkrliin.png',2),(187,'Mỹ Ngu','2007-01-31','Nữ','Tân Phú','nguyentoanmy112002@gmail.com','0336334143','bacsiou','$2a$10$xL6PVwIOXZsMIfYqwtltIeb.7I.wD4oItAl05pI2bQJqnQvdTM56O','https://res.cloudinary.com/diyeuzxqt/image/upload/v1693025502/jbmmrqbeysokzow51rrg.png',4),(188,'nguyen thanh tungggg','2023-08-04','Nam','hcm','20510520346hoang@ou.edu.vn','0336334143','bacsiou1','$2a$10$jsq7h.aL.MXAvPph7rJRyeL.YtwyOkjebinZnTdgSSSkXzbtZ7vMi','https://res.cloudinary.com/diyeuzxqt/image/upload/v1693933598/es6whd0ri9idvwe3vzhi.png',4),(189,'duy','2023-08-26','Nam','dfgdfgdfg','hoangcool2309@gmail.com','0336334143','duyduy','$2a$10$WhIOPFKr4MMwwDfhDokAY.SZpYtLafXHok4LdkTP8YH0gL7vffyWe','https://res.cloudinary.com/diyeuzxqt/image/upload/v1693124105/uvdahrxcvd3ph5n4973o.png',2),(190,'Duong Huu Thanh','2023-08-03','Nam','Gò Vấp','2051052046hoang@ou.edu.vn','0336334143','thaythanh','$2a$10$FyPGAHc3WIKzSoR1ffQ./e6XCQ3v5Nx7IERvH9xXX4X1OkyZ8v3du','https://res.cloudinary.com/diyeuzxqt/image/upload/v1693297619/nfdy23yvpiuzmkqrm5y5.png',4),(207,'phuoc','2023-09-01','Nam','hcm','2051052046hoang@ou.edu.vn','0336334143','phuoc321','$2a$10$wiOuYTvG4pw6obe.0IobCuG5sfGonWLAu0SjbLT6CpddyFR57HScy','https://res.cloudinary.com/diyeuzxqt/image/upload/v1694084915/dur5onwbkq72l6fpcecw.png',4),(208,'huynh minh hoangggg','2001-09-23','Nam','hcm','hoangcool2309@gmail.com','0336334143','hoanghoang','$2a$10$55lgU1q2wki3G3/Nb9E.IeiPVRpYBdVzOkCe5ME6scSo3ecZUw/yS','https://res.cloudinary.com/diyeuzxqt/image/upload/v1694102605/ak6szai3guhdkrhmxenm.png',4),(209,'huynh minh hoang','2001-01-01','Nam','hcm','2051052046hoang@ou.edu.vn','0336334143','hoanghoang123','$2a$10$JHC3l5amdziFgW4zn4RT4OKpT6zVOv1HvE7DWPh5B2nVOvMFIB3Ni','https://res.cloudinary.com/diyeuzxqt/image/upload/v1694111302/nhkvax4fu3zp8yitlxsa.png',4),(210,'huynh minh hoang','2023-09-02','Nam','hcm','hoangcool2309@gmail.com','12312','hoanghoang4354','$2a$10$w2jz9b1m6HiwAUBsNBuKBOvjwmacjgzeFZY2t.QPbf8TFHtoH/wlK','https://res.cloudinary.com/diyeuzxqt/image/upload/v1694120794/kspav1knzbcfc7sb24ou.png',4),(211,'',NULL,'','','','','ghghghghg','$2a$10$4sb26GqGw1FHu7wMmb34Tu6g9awy19SFPr1bBk9i2/Y9G9IGrX0/m',NULL,4),(212,'',NULL,'','','','','fgdfgdfg','$2a$10$8cb1aspTDZsm6T6Ixyun9eaD7uqdaW6269EgfdW4g112w.FFCRDvi','https://res.cloudinary.com/diyeuzxqt/image/upload/v1694159799/cu0pn7uzwqf3or2gem5b.png',4);
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
INSERT INTO `thoi_gian_truc` VALUES (1,'Sáng','08:00:00','12:00:00'),(2,'Trưa','12:00:00','16:00:00'),(3,'Chiều','00:00:00','23:59:00');
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
  `don_vi` int DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `loai_thuoc` int DEFAULT NULL,
  PRIMARY KEY (`id_thuoc`),
  KEY `don_vi_idx` (`don_vi`),
  KEY `loai_thuoc_idx` (`loai_thuoc`),
  CONSTRAINT `don_vi` FOREIGN KEY (`don_vi`) REFERENCES `donvi_thuoc` (`id_donVi`),
  CONSTRAINT `loai_thuoc` FOREIGN KEY (`loai_thuoc`) REFERENCES `loai_thuoc` (`idloai_thuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (1,'vitaminA','việt nam',25000,1,48,1),(5,'thuốc cảm','vn',20000,2,45,1),(6,'thuốc sốt','vn',123000,3,21,1),(12,'thuốc nóng','vn',45000,4,100,1),(15,'thuốc lạnh','vn',40000,5,77,2),(17,'VitaminB','VN',200000,1,77,2),(23,'Vitamin','vn',200000,4,120,2),(26,'sđsd','sdsdsd',23213,2,100,3),(27,'thuốc cảm','vn',1500000,4,170,3),(28,'Thuốc mắt','vn',1500000,3,500,3),(29,'thuốc sốt','vn',1500000,4,495,6);
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tien_kham`
--

DROP TABLE IF EXISTS `tien_kham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tien_kham` (
  `id_tienKham` int NOT NULL AUTO_INCREMENT,
  `tien_kham` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_tienKham`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tien_kham`
--

LOCK TABLES `tien_kham` WRITE;
/*!40000 ALTER TABLE `tien_kham` DISABLE KEYS */;
INSERT INTO `tien_kham` VALUES (1,100000);
/*!40000 ALTER TABLE `tien_kham` ENABLE KEYS */;
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

-- Dump completed on 2023-09-10  0:12:37
