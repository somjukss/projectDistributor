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
 ('1', 'Sweets Cafe Mist Spray กลิ่น Strawberry Cream', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '500', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqbZb.jpg'),
('2', 'Sweets Cafe Mist Spray กลิ่น Peach Blossom', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '500', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqOdJ.jpg'),
('3', 'Sweets Cafe Mist Spray กลิ่น CocoMango', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '100', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqjsf.jpg'),
('4', 'Sweets Cafe Mist Spray กลิ่น Orange Caramel', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '200', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqlma.jpg'),
('5', 'Sweets Cafe Mist Spray กลิ่น Milk Candy', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '300', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqD9q.jpg'),
('6', 'Sweets Cafe Mist Spray กลิ่น Parfait Melon', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '400', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqAjz.jpg'),
('7', 'Sweets Cafe Mist Spray กลิ่น BlueBerry Cupcake', 'Sweets Cafe Mist Spray by Sugarbunny Skincare น้ำหอมกลิ่นขนมสูตรปราศจากแอลกฮอลล์และสารกันเสีย อ่อนโยน ใช้ได้แม้ผิวแพ้ง่าย กลิ่นไม่ฉุน มาในกลิ่นหอมธีมขนมหวานน่ารักไม่ซ้ำใคร ขนาด10ml. บรรจุ 12 ขวด', '1500', '0', '3200.00', '1', 'https://sv1.picz.in.th/images/2019/05/05/wgqPp8.jpg'),
('8', 'เซรั่มสายไหม CandyFloss Serum', 'เซรั่มไฮยาลูรอนนำเข้าจากญี่ปุ่น เนื้ออ่อนโยนบางเบา เหมาะกับผิวแพ้ง่าย ทาได้ทั่วหน้าแม้แต่ใต้ตาหรือริมฝีปาก ช่วยเรื่องความชุ่มชื้น รูขุมขน ริ้วรอย รอยสิว <3 ใช้ขวดเดียวจบปึ๊งไม่ยุ่งยาก อยากให้ลองรับน้องไปโดนกันซักขวดจ้า >w< ขนาด10ml. บรรจุ 10 ขวด', '1500', '0', '1800.00', '4', 'https://sv1.picz.in.th/images/2019/05/05/wgq2NR.jpg'),
('9', 'สเปรย์ย่านางชูก้าร์บันนี่', 'ช่วยลดสิวผดผื่นแพ้ อาการอักเสบบวมแดง ที่เกิดจากสิวหรือผิวแพ้เหงื่อ เติมความชุ่มชื้นให้ผิวฉ่ำน้ำ หน้าไม่มัน อ่อนโยนแม้สัมผัสกับดวงตาหรือเข้าปาก สกัดเย็นจากสมุนไพร100% ขนาด 100ml. บรรจุ 6 ขวด', '1500', '0', '750.00', '5', 'https://sv1.picz.in.th/images/2019/05/05/wgqCU0.jpg'),
('10', 'สบู่น้ำมะลิสูตรเย็นสดชื่นผิว', 'ใช้แล้วเย็นผิว เติมความชุ่มชื้น ลดผิวอักเสบจากแดดเผา ลดสิวผด ผิวนุ่มเด้ง ใช้ได้ทั้งหน้าและตัวขนาด 35-40 กรัม บรรจุ 12 ก้อน', '1500', '50', '800.00', '2', 'https://sv1.picz.in.th/images/2019/05/05/wgquru.jpg'),
('11', 'Mermaid Pink Contact Lens', 'คอนแทคเลนส์(รายปี)สีรุ้งรุ่นใหม่!คอนแทคเลนส์ผลิตในประเทศจีนจากร้านขายยาที่มีใบอนุญาตถูกต้อง Diameter : 14.00 mm. ค่าอมน้ำ : 38%  บรรจุ 12 คู่', '1500', '12', '2500.00', '3', 'https://sv1.picz.in.th/images/2019/05/05/wgqycQ.jpg'),
('12', 'Rainbow Contact Lens', 'คอนแทคเลนส์(รายปี)สีรุ้งรุ่นใหม่!คอนแทคเลนส์ผลิตในประเทศจีนจากร้านขายยาที่มีใบอนุญาตถูกต้อง Diameter : 14.00 mm. ค่าอมน้ำ : 38%  บรรจุ 12 คู่', '1500', '19', '2500.00', '3', 'https://sv1.picz.in.th/images/2019/05/05/wgqm0V.jpg');


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