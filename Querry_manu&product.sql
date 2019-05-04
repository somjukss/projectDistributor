/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# Dump of table products_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_product`;

CREATE TABLE products_product (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `describe` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  price decimal(8,2) NOT NULL,
  manufactor_id int(11) NOT NULL,
  img_url longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY products_product_manufactor_id_4b28e972_fk_products_ (`manufactor_id`),
  CONSTRAINT products_product_manufactor_id_4b28e972_fk_products_ FOREIGN KEY (`manufactor_id`) REFERENCES products_manufactor (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES products_product WRITE;
/*!40000 ALTER TABLE products_product DISABLE KEYS */;

INSERT INTO products_product (`id`, `name`, `describe`, `minimum_stock`, `quantity`, `price`, `manufactor_id`, `img_url`)
VALUES
 (1,'GRACE','ครีมบำรุงผิวหน้าสูตรเข้มข้น เนื้อบางเบา ช่วยเพิ่มความชุ่มชื่นให้แก่ผิว ทำให้ผิวเนียนนุ่ม แลดูอ่อนเยาว์',1500, 500, 1000, 1, 'https://sv1.picz.in.th/images/2019/05/04/wcVtCf.jpg'),
    (2,'Artiscent','ครีมหน้าสดอาทิเซ้นท์ ครีมตัวช่วยที่ให้คุณโชว์หน้าสดได้ เผยผิวหน้าสด ไร้ฝ้า กระ จุดด่างดำ',1500, 500, 1500, 1, 'https://sv1.picz.in.th/images/2019/05/04/wcVwFa.jpg'),
    (3,'SKII','ปลุกพลังให้ผิวสวยดูอ่อนเยาว์ของคุณด้วยมอยส์เจอไรเซอร์เนื้อครีมเจ้าของรางวัล1ผลิตภัณฑ์ที่อุดมด้วยส่วนผสมเพื่อการฟื้นบำรุง',1500, 100, 1700, 2, 'https://sv1.picz.in.th/images/2019/05/04/wcVKtq.jpg'),
    (4,'ROJUKISS','ครีม 30X ที่ทาได้ทั้งกลางวันและกลางคืน เพื่อการปกป้อง และบำรุงผิวรอบดวงตา  แก้ปัญหารูขุมขนกว้างที่เกิดจากสิว',1500, 200, 790, 2, 'https://sv1.picz.in.th/images/2019/05/04/wcVZoz.jpg'),
    (5,'ORIFLAME','ครีมบำรุงผิวหน้าก่อนนอน สำหรับผิวแห้ง ด้วยคุณค่าจากน้ำนมและน้ำผึ้ง',1500, 300, 790, 2, 'https://sv1.picz.in.th/images/2019/05/04/wcVcG8.jpg'),
    (6,'Johnson\'s','บำรุงผิวให้เนียนนุ่ม ดูกระจ่างใส ด้วยคุณค่าจากน้ำนม และวิตามินเอ และอี ผ่านการทดสอบไม่ก่อให้เกิดอาการแพ้หรือระคายเคือง',1500, 400, 107, 3, 'https://sv1.picz.in.th/images/2019/05/04/wcVifR.jpg'),
    (7,'อภัยภูเบศร์','มอยเจอไรเซอร์ที่ช่วยคืนความชุ่่มชื้นให้กับผิวที่แห้งมาก จนหลุดลอกเป็นขุย มีปัญหาริ้วรอย เนื้อครีมซึมซาบเร็ว ไม่เหนียวเหนอะหนะ',1500, 0, 250, 4, 'https://sv1.picz.in.th/images/2019/05/04/wcVR50.jpg'),
    (8,'Jasmine rice','ครีมรวงข้าว ผลงานวิจัย ม.แม่ฟ้าหลวง สลัดจากดอกข้าวมะลิ ปลอดภัยไร้สารเคมี',1500, 0, 250, 4, 'https://sv1.picz.in.th/images/2019/05/04/wcVxHu.jpg'),
    (9,'La Chule','นาโน มอยส์เจอไรเซอร์ จีพีโฟร์จี ครีม Nano Moisturizer GP4G Cream สเต็มเซลล์สด…ลดฝ้า หน้าเด็ก',1500, 0, 2500, 5, 'https://sv1.picz.in.th/images/2019/05/04/wcVUSZ.jpg'),
    (10,'PUERARIA','ครีมบำรุงผิวอันบอบบางรอบดวงตา ปราศจากน้ำหอม ช่วยคืนความกระชับครีมบำรุงผิวอันบอบบางรอบดวงตา',1500, 50, 520, 5, 'https://sv1.picz.in.th/images/2019/05/04/wcVqgI.jpg');

/*!40000 ALTER TABLE products_product ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table products_manufactor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products_manufactor`;

CREATE TABLE products_manufactor (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES products_manufactor WRITE;
/*!40000 ALTER TABLE products_manufactor DISABLE KEYS */;

INSERT INTO products_manufactor (`id`, `name`, `location`, `phone`)
VALUES
 (1,'บริษัท วธูธร จำกัด','46, 154 ซอย 5 ตำบล บ้านใหม่ อำเภอ ปากเกร็ด นนทบุรี 11120','0829617944'),
 (2,'บริษัท ไลฟ์ พลัส ฟาร์มาซูติคอล จำกัด','89/8 ม.9 โครงการ MARIGOLD WAREHOUSE PARK ถ.หนามแดง-บางพลี ตำบลบางแก้ว อำเภอบางพลี สมุทรปราการ 10540', '0888241433'),
 (3,'บริษัท เดอร์มา อินโนเวชั่น จำกัด','111/1 หมู่ 4 ซ.แจ้งวัฒนะ 19 ต.คลองเกลือ อ.ปากเกร็ด จ.นนทบุรี 11120', '0819850111'),
 (4,'บริษัท ไอ-คอสเมติก จำกัด','51/474 เมืองเอกรังสิต  ถ.เอกทักษิณ5 ต.หลักหก อ.เมือง  ปทุมธานี  12000', '098-249-0779'),
 (5,'Bioticon Co.,Ltd.','The Compound Ramintra 109 , Room C4 , Bangchan Khlong Sam Wa, Bangkok 10510', '0993569156');

/*!40000 ALTER TABLE products_manufactor ENABLE KEYS */;
UNLOCK TABLES;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;