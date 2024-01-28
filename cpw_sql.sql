-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 28, 2024 at 07:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpw_sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_message`
--

CREATE TABLE `admin_message` (
  `a_message_id` varchar(255) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `userID` int(20) NOT NULL,
  `last_interact` datetime NOT NULL DEFAULT current_timestamp(),
  `c_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin_message`
--

INSERT INTO `admin_message` (`a_message_id`, `message`, `userID`, `last_interact`, `c_id`) VALUES
('181e879e-be06-11ee-bac5-1c1bb5362338', 'ขอบคุณสำหรับคำแนะนำค่ะ ทางโรงเรียนชลประทานวิทยาจะดำเนินการแจ้งให้กับหน่วยงานที่เกี่ยวข้องได้รับทราบค่ะ', 9999, '2024-01-29 00:53:07', 'U219d0075bc6246b5814302c158c160e2'),
('3ee0c0a5-be06-11ee-bac5-1c1bb5362338', 'โรงเรียนชลประทานวิทยา ขอขอบคุณค่ะ', 9999, '2024-01-29 00:54:12', 'U219d0075bc6246b5814302c158c160e2'),
('4cda6991-be06-11ee-bac5-1c1bb5362338', 'คุณต้องการติดต่อบริการด้านอะไร\n 1.สมัครเรียน\n 2.สมัครบุคลากร\n 3.ค่าธรรมเนียมการศึกษา\n 4.อื่นๆ ติดต่อสอบถามเพิ่มเติม', 9999, '2024-01-29 00:54:36', 'U219d0075bc6246b5814302c158c160e2'),
('60e03b0b-be06-11ee-bac5-1c1bb5362338', 'คุณต้องการติดต่อบริการด้านอะไร\n 1.สมัครเรียน\n 2.สมัครบุคลากร\n 3.ค่าธรรมเนียมการศึกษา\n 4.อื่นๆ ติดต่อสอบถามเพิ่มเติม', 9999, '2024-01-29 00:55:09', 'U219d0075bc6246b5814302c158c160e2'),
('79f5d3f8-be06-11ee-bac5-1c1bb5362338', 'คุณต้องการติดต่อบริการด้านอะไร\n 1.ศูนย์ฝึกว่ายน้ำ\n  2.ระบบชำระเงิน\n 3.ประกาศผลการเรียน\n 4.ระบบรถรับ-ส่ง\n 5.ระบบโรงอาหารอื่นๆ\n 6.ติดต่อสอบถามเพิ่มเติม', 9999, '2024-01-29 00:55:52', 'U219d0075bc6246b5814302c158c160e2'),
('887c48e8-be06-11ee-bac5-1c1bb5362338', 'คุณต้องการติดต่อบริการด้านอะไร\n 1.ตารางเรียน\n 2.ตารางสอบ\n 3.หลักสูตร\n 4.ฟอร์มแบบคำร้องขอหลักฐานการศึกษา\n 5.อื่นๆ ติดต่อสอบถามเพิ่มเติม', 9999, '2024-01-29 00:56:16', 'U219d0075bc6246b5814302c158c160e2');

-- --------------------------------------------------------

--
-- Table structure for table `contacter`
--

CREATE TABLE `contacter` (
  `c_id` varchar(255) NOT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `last_interact` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contacter`
--

INSERT INTO `contacter` (`c_id`, `c_name`, `last_interact`) VALUES
('U219d0075bc6246b5814302c158c160e2', 'Deer', '2024-01-29 00:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `contacter_message`
--

CREATE TABLE `contacter_message` (
  `message_id` varchar(255) NOT NULL,
  `c_id` varchar(255) NOT NULL,
  `agency_id` int(10) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `message_group` varchar(20) DEFAULT NULL,
  `reply` int(1) DEFAULT NULL,
  `last_interact` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contacter_message`
--

INSERT INTO `contacter_message` (`message_id`, `c_id`, `agency_id`, `message`, `message_group`, `reply`, `last_interact`) VALUES
('17f0f6a5-be06-11ee-bac5-1c1bb5362338', 'U219d0075bc6246b5814302c158c160e2', NULL, 'ห้องน้ำมีกลิ่นแปลกๆอ่ะค่ะ ช่วยมาแก้ไขหน่อยได้มั้ยยย', 'negative', 1, '2024-01-29 00:53:07'),
('3eb00b3e-be06-11ee-bac5-1c1bb5362338', 'U219d0075bc6246b5814302c158c160e2', NULL, 'รร สวยจังงงงงงงงง', 'positive', 1, '2024-01-29 00:54:12'),
('4cb4ba99-be06-11ee-bac5-1c1bb5362338', 'U219d0075bc6246b5814302c158c160e2', NULL, 'ไปจ่ายค่าเทอมได้มั้ย', 'question', 1, '2024-01-29 00:54:36'),
('60b1908b-be06-11ee-bac5-1c1bb5362338', 'U219d0075bc6246b5814302c158c160e2', NULL, 'ค่าเทอม ป.1 เท่าไหร่อ่ะค่ะ', 'question', 1, '2024-01-29 00:55:09'),
('79caa402-be06-11ee-bac5-1c1bb5362338', 'U219d0075bc6246b5814302c158c160e2', NULL, 'คอร์สว่ายน้ำราคาเท่าไหร่', 'question', 1, '2024-01-29 00:55:51'),
('8852cc86-be06-11ee-bac5-1c1bb5362338', 'U219d0075bc6246b5814302c158c160e2', NULL, 'ขอตารางเรียนหน่อยค่ะ', 'question', 1, '2024-01-29 00:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `cpw_agency`
--

CREATE TABLE `cpw_agency` (
  `agency_id` int(10) NOT NULL,
  `agency_name` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cpw_agency`
--

INSERT INTO `cpw_agency` (`agency_id`, `agency_name`, `username`) VALUES
(1, 'วิชาการ', NULL),
(2, 'โภชนาการ', NULL),
(3, 'ฝ่ายปกครอง', NULL),
(4, 'ธุรการ', NULL),
(5, 'บริการ', NULL),
(6, 'ผู้ดูแลระบบ', NULL),
(7, 'ผู้บริหาร', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cpw_faq`
--

CREATE TABLE `cpw_faq` (
  `faq_id` int(10) NOT NULL,
  `faq_question` varchar(255) NOT NULL,
  `faq_answer` varchar(255) NOT NULL,
  `agency_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cpw_faq`
--

INSERT INTO `cpw_faq` (`faq_id`, `faq_question`, `faq_answer`, `agency_id`) VALUES
(1, 'ติดต่อสอบถามโภชนาการ', 'ติดต่อครัวชลประทาน 02 583 4047\r\nโภชนาการ 1 ต่อ 133\r\nโภชนาการ 2 ต่อ 620\r\nโครงการโรงอาหาร 810', 2),
(2, 'ติดต่อสหกรณ์โรงเรียน', 'เบอร์สหกรณ์โรงเรียน 02 583 4047', 2),
(3, 'ตารางเรียนเทอมนี้', 'ส่งลิงก์ตารางเรียน', 1),
(4, 'ตารางเรียนนักเรียนระดับชั้น ประถมศึกษาตอนต้น (ป.1 - ป.3)', 'ส่งลิงก์', 1),
(5, 'ตารางเรียนนักเรียนระดับชั้น ประถมศึกษาตอนต้น (ป.4 - ป.6)', 'ส่งลิงก์', 1),
(6, 'ตารางเรียนนักเรียนระดับชั้น มัธยมศึกษาตอนต้น (ม.1 - ม.3)', 'ส่งลิงก์', 1),
(7, 'ตารางเรียนนักเรียนระดับชั้น มัธยมศึกษาตอนปลายสายวิทย์ (ม.4 - ม.6)', 'ส่งลิงก์', 1),
(8, 'ตารางเรียนนักเรียนระดับชั้น มัธยมศึกษาตอนปลายสายศิลป์ (ม.4 - ม.6)', 'ส่งลิงก์', 1),
(9, 'ตารางเรียนนักเรียนระดับชั้น มัธยมศึกษาตอนปลายสายศิลป์ภาษา (ม.4 - ม.6)', 'ส่งลิงก์', 1),
(10, 'สอบถามหลักสูตร โครงการพิเศษ', 'ส่งลิงก์', 1),
(11, 'สอบถามหลักสูตร English Program', 'จัดการเรียนตามหลักสูตรแกนกลางขั้นพื้นฐาน พุทธศักราช 2551 และหลักสูตรสถานศึกษาโรงเรียนชลประทานวิทยา ระดับชั้นประถมศึกษาตอนต้น โดยจัดการเรียนการสอนในวิชาภาษาอังกฤษอย่างเข้มข้นรวมวิชาภาษาอังกฤษ 9 คาบ/สัปดาห์ ** ครูผู้สอนเป็นชาวต่างชาติ (Native Speaker)   9 ค', 1),
(12, 'สอบถามรายละเอียดวิชาว่ายน้ำ', 'ส่งลิงก์', 1),
(14, 'รายละเอียดโครงการเสริมพิเศษวิทยาศาสตร์และคณิตศาสตร์ : ESMP', '\"จัดการเรียนการสอนตามหลักสูตรแกนกลางการศึกษาขั้นพื้นฐาน พุทธศักราช 2551 โดยเพิ่มวิชาภาษาอังกฤษอย่างเข้มข้น และจัดสอนรายวิชาเพิ่มเติมตามแนวทางของ สสวท. ด้านวิทยาศาสตร์ คณิตศาสตร์  วิศวกรรมและเทคโนโลยี รายวิชาเพิ่มพูนประสบการณ์และ / หรือ รายวิชาเพิ่มเติมเรี', 1),
(15, 'โครงการห้องเรียนพิเศษ English Chonprathanwittaya', '\"จัดการเรียนตามหลักสูตรแกนกลางขั้นพื้นฐาน พุทธศักราช 2551 และหลักสูตรสถานศึกษาโรงเรียนชลประทานวิทยา ระดับชั้นประถมศึกษาตอนต้น โดยจัดการเรียนการสอนในวิชาภาษาอังกฤษอย่างเข้มข้นรวมวิชาภาษาอังกฤษ 9 คาบ/สัปดาห์ ** ครูผู้สอนเป็นชาวต่างชาติ (Native Speaker)   9 ', 1),
(19, 'สอบถามเรื่องระเบียบการเเต่งการของนักเรียน', 'ส่งลิงก์', 3),
(20, 'ติดต่อครูฝ่ายปกครอง', 'เบอร์ครูเอก / เบอร์ครูหนุ่ม', 3),
(21, 'สอบถามเรื่องระเบียบการเเต่งการของนักเรียน', 'ส่งลิงก์', 3),
(22, 'ติดต่อครูฝ่ายปกครอง', 'เบอร์ครูเอก / เบอร์ครูหนุ่ม', 3),
(23, 'ติดต่อหน่วยงานนักศึกษาวิชาทหาร ชปว', 'เบอร์ครูเอก / เบอร์ครูเบิร์ด', 3),
(24, 'ติดต่อคณะกรรมการนักเรียน ชปว', 'Facebook: https://web.facebook.com/leaderofcpw', 3),
(25, 'ขั้นตอนการชำระเงินของโรงเรียน', 'แอปชำระเงินของโรงเรียน', 4),
(26, 'ค่าเทอมนักเรียน อนุบาล', 'ส่งลิงก์', 4),
(27, 'ค่าเทอมนักเรียน ประถม', 'ส่งลิงก์', 4),
(28, 'ค่าเทอมนักเรียน มัธยม', 'ส่งลิงก์', 4),
(29, 'ประกาศรับสมัครครูโรงเรียนชลประทานวิทยา', 'ส่งลิงก์', 5),
(30, 'ประกาศรับสมัครพนักงานโรงเรียนชลประทานวิทยา', 'ส่งลิงก์', 5),
(31, 'ติดต่อศูนย์สารสนเทศ', 'เบอร์ติดต่อศูนย์สารสนเทศ', 5),
(32, 'เวลาทำการของโรงเรียนชลประทานวิทยา', 'เปิดวันจันทร์ - ศุกร์ 06:30 น. - 18:00 น. ', 5),
(33, 'ตำแหน่งที่ตั้งของโรงเรียนชลประทานวิทยา', 'ที่อยู่: 201 หมู่ที่ 1 ถ. ติวานนท์ ตำบลบางตลาด อำเภอปากเกร็ด นนทบุรี 11120', 5),
(34, 'ติดต่อโรงเรียนชลประทานวิทยา', 'โทรศัพท์: 02 583 4047', 5),
(36, 'รายละเอียดอาหารประจำวัน', 'ส่งลิงก์', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cpw_user`
--

CREATE TABLE `cpw_user` (
  `userID` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `agency_id` int(10) DEFAULT NULL,
  `profilepic` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cpw_user`
--

INSERT INTO `cpw_user` (`userID`, `username`, `user_name`, `agency_id`, `profilepic`) VALUES
(1, '12345', 'สวัสดีฉันชื่อดอลล่า', 6, NULL),
(2, '20010', 'นายทนางศักดิ์ อ่อนน้อม', 6, NULL),
(3, '6204062636163', 'นายพงศฑล ทะโทน', 1, NULL),
(4, '22022', 'นายมงคล เปิดประตูให้หน่อย', 6, NULL),
(12, '292191', 'เอสเจเมพขิงๆ', 1, NULL),
(13, '202002', 'แอดมินโภชนาการ', 1, NULL),
(14, '202002', 'แอดมินฝ่ายปกครอง', 3, NULL),
(17, '365', 'ใครรักใครขอให้แต่งงานกัน', 7, NULL),
(18, '25280', 'นางสาวพาทินธิดา นามอยู่', 2, NULL),
(19, '25280', 'นางสาวพาทินธิดา นามอยู่', 2, NULL),
(20, '29218', 'นางสาวธนพร เงินมี', 2, NULL),
(21, '2921822', 'ร้อยเอกอนุวัฒน์', 2, NULL),
(22, '294335', 'ส่งลิงก์', 2, NULL),
(23, '112334', 'พลเอก ซีซ่า', 2, NULL),
(24, ' 202003', 'แอดมินฝ่ายปกคราองอีกคน', 2, NULL),
(26, '081968', 'Peter Parker', 7, NULL),
(27, '2002007', 'แอดมิน ผู้บริหาร', 7, NULL),
(28, '2002001', 'แอดมิน ฝ่ายวิชาการ', 7, NULL),
(29, '2002001', 'แอดมิน ของฝ่ายวิชาการ', 1, NULL),
(30, '2002002', 'แอดมิน โภชนาการ', 2, NULL),
(31, '2002003', 'ครูเบิร์ด เซนไต', 3, NULL),
(32, '2002004', 'ผู้ดูแล ฝ่ายธุรการและบัญชี', 4, NULL),
(33, '2002005', 'ครูแอร์คนสวย', 4, NULL),
(34, '2002005', 'ครูแอร์คนสวย', 5, NULL),
(9999, 'LineBot', 'CpwChatBot', 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `recive_text` varchar(100) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `contactor` varchar(50) DEFAULT NULL,
  `reply` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `date`, `recive_text`, `message_type`, `contactor`, `reply`) VALUES
(1, '2024-01-11 23:29:16', 'Hello', '1', NULL, NULL),
(2, '2024-01-20 15:37:25', 'ถามไปก็ไม่เคยมาอ่านหรือตอบ แย่มาก', '', NULL, 1),
(3, '2024-01-20 15:40:58', 'อาหารสัปดาห์นี้มายังค่ะ', '', NULL, 1),
(4, '2024-01-20 15:49:13', 'อาหารสัปดาห์นี้มายังค่ะ', '', NULL, 1),
(5, '2024-01-20 22:22:21', 'sdfsdfsf', 'eiei', NULL, 1),
(6, '2024-01-20 22:27:06', 'sdfsdfsf', '1', NULL, 1),
(7, '2024-01-20 22:37:30', 'รร สะอาดมากเลยค่ะ', 'negative', NULL, 1),
(8, '2024-01-20 22:37:30', 'รร สะอาดมากเลยค่ะ', 'ขอบคุณสำหรับคำแนะนำค่ะ ทางโรงเรียนชลประทานวิทยาจะดำเนินการแจ้งให้กับหน่วยงานที่เกี่ยวข้องได้รับทราบค่ะ', NULL, 1),
(9, '2024-01-20 22:46:04', 'อยากกลับบ้าน', 'positive', NULL, 1),
(10, '2024-01-20 22:46:26', 'ค่าเทอม', 'question', NULL, 1),
(11, '2024-01-20 22:47:10', 'ห้องน้ำอยู่ไหน', 'negative', NULL, 1),
(12, '2024-01-20 22:59:06', 'ห้องน้ำอยู่ไหน', 'negative', NULL, 1),
(13, '2024-01-20 22:59:24', 'ค่าเทอม', 'question', NULL, 1),
(14, '2024-01-20 22:59:47', 'ดีใจจัง', 'negative', NULL, 1),
(15, '2024-01-20 23:00:03', 'ดีใจด้วย', 'positive', NULL, 1),
(16, '2024-01-20 23:05:45', 'ห้องน้ำอยู่ไหน', 'negative', NULL, 1),
(17, '2024-01-20 23:22:02', 'อยากกลับบ้าน', 'positive', NULL, 1),
(18, '2024-01-20 23:25:04', 'ะมึอยากกลับบ้าน', 'positive', NULL, 1),
(19, '2024-01-20 23:25:34', 'เรฃอยากกลับบ้าน', 'positive', NULL, 1),
(20, '2024-01-20 23:26:50', '่', 'negative', NULL, 1),
(21, '2024-01-20 23:29:39', 'พวคอยากกลับบ้าน', 'positive', 'Pang', 1),
(22, '2024-01-20 23:30:25', 'จาหวัดดี', 'positive', 'Deer', 1),
(23, '2024-01-20 23:35:34', 'สพสพสช', 'negative', 'Deer', 1),
(24, '2024-01-20 23:35:35', 'มกมกมชชช', 'negative', 'Deer', 1),
(25, '2024-01-20 23:35:38', 'โหลลลๆๆๆ', 'negative', 'Deer', 1),
(26, '2024-01-20 23:35:39', 'เี', 'negative', 'Deer', 1),
(27, '2024-01-20 23:35:42', 'สงสัยค่ะขอถาม', 'positive', 'Deer', 1),
(28, '2024-01-20 23:59:32', 'ปิ้วๆๆๆ', 'negative', 'Deer', 1),
(29, '2024-01-20 23:59:56', 'ชิโน๊ะสุเกะะะะะ', 'negative', 'Deer', 1),
(30, '2024-01-21 00:00:08', 'อู้หูว', 'negative', 'Deer', 1),
(31, '2024-01-21 00:00:30', 'พรุ่งนี้หวยออกมั้ย', 'positive', 'Deer', 1),
(32, '2024-01-21 00:00:54', 'พ่อแท่จะมาหา', 'negative', 'Deer', 1),
(33, '2024-01-21 00:01:03', 'พ่อแม่จะมาหา', 'question', 'Deer', 1),
(34, '2024-01-21 00:01:11', 'พ่อแม่', 'question', 'Deer', 1),
(35, '2024-01-21 00:01:19', 'เล่นพ่อแม่ลูกกัน', 'positive', 'Deer', 1),
(36, '2024-01-21 00:01:52', 'สวัสเี', 'negative', 'Deer', 1),
(37, '2024-01-21 00:03:40', 'สวัสดี', 'Greeting', 'Deer', 1),
(38, '2024-01-21 00:05:33', 'สวัสดีค่ะ', 'Greeting', 'Pang', 1),
(39, '2024-01-21 00:05:59', 'สวัสดีครับ', 'Greeting', 'Pang', 1),
(40, '2024-01-21 00:06:12', 'สวัสดีค่า', 'Greeting', 'Pang', 1),
(41, '2024-01-21 00:06:22', 'สวัสดีฮ้าบบบ', 'Greeting', 'Pang', 1),
(42, '2024-01-21 00:06:36', 'ดีจ้า', 'negative', 'Pang', 1),
(43, '2024-01-22 16:20:15', 'สมัครภาค  ep หน่อยค่ะ', 'question', 'Pang', 1),
(44, '2024-01-22 18:11:16', 'สหกรณ์', 'question', 'Pang', 1),
(45, '2024-01-22 18:44:49', 'สวัสดีครับอยากจัดกิจกรรมภายในโรงเรียนสามารถติดต่อได้ที่ไหน', 'Greeting', 'Pang', 1),
(46, '2024-01-22 18:47:30', 'จะจัดกิจกรรมภายในโรงเรียนมีค่าใช้จ่ายอะไรบ้าง', 'question', 'Pang', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_message`
--
ALTER TABLE `admin_message`
  ADD PRIMARY KEY (`a_message_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `contacter`
--
ALTER TABLE `contacter`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `contacter_message`
--
ALTER TABLE `contacter_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `cpw_agency`
--
ALTER TABLE `cpw_agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `cpw_faq`
--
ALTER TABLE `cpw_faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `cpw_user`
--
ALTER TABLE `cpw_user`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cpw_faq`
--
ALTER TABLE `cpw_faq`
  MODIFY `faq_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `cpw_user`
--
ALTER TABLE `cpw_user`
  MODIFY `userID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_message`
--
ALTER TABLE `admin_message`
  ADD CONSTRAINT `admin_message_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `contacter` (`c_id`);

--
-- Constraints for table `contacter_message`
--
ALTER TABLE `contacter_message`
  ADD CONSTRAINT `contacter_message_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `contacter` (`c_id`),
  ADD CONSTRAINT `contacter_message_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `cpw_agency` (`agency_id`);

--
-- Constraints for table `cpw_faq`
--
ALTER TABLE `cpw_faq`
  ADD CONSTRAINT `cpw_faq_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `cpw_agency` (`agency_id`);

--
-- Constraints for table `cpw_user`
--
ALTER TABLE `cpw_user`
  ADD CONSTRAINT `cpw_user_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `cpw_agency` (`agency_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
