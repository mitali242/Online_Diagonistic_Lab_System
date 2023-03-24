-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.26-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table odlms_db.appointment_list
CREATE TABLE IF NOT EXISTS `appointment_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `schedule` datetime NOT NULL,
  `client_id` int(30) NOT NULL,
  `prescription_path` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `appointment_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.appointment_list: ~3 rows (approximately)
/*!40000 ALTER TABLE `appointment_list` DISABLE KEYS */;
REPLACE INTO `appointment_list` (`id`, `code`, `schedule`, `client_id`, `prescription_path`, `status`, `date_created`, `date_updated`) VALUES
	(1, '202201-0001', '2022-01-11 15:30:00', 2, '1_sample.pdf?v=1641884206', 6, '2022-01-11 14:06:30', '2022-01-11 16:11:57'),
	(3, '202201-0002', '2022-01-11 17:00:00', 5, 'test.pdf?v=1641891660', 2, '2022-01-11 17:01:00', '2022-01-11 17:03:30'),
	(4, '202201-0003', '2022-01-13 10:00:00', 2, '', 3, '2022-01-11 17:07:05', '2022-04-04 12:03:19');
/*!40000 ALTER TABLE `appointment_list` ENABLE KEYS */;

-- Dumping structure for table odlms_db.appointment_test_list
CREATE TABLE IF NOT EXISTS `appointment_test_list` (
  `appointment_id` int(30) NOT NULL,
  `test_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `appointment_id` (`appointment_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `appointment_test_list_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_test_list_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.appointment_test_list: ~25 rows (approximately)
/*!40000 ALTER TABLE `appointment_test_list` DISABLE KEYS */;
REPLACE INTO `appointment_test_list` (`appointment_id`, `test_id`, `date_created`) VALUES
	(1, 1, '2022-01-11 14:06:30'),
	(1, 3, '2022-01-11 14:06:30'),
	(1, 1, '2022-01-11 14:14:13'),
	(1, 3, '2022-01-11 14:14:13'),
	(1, 1, '2022-01-11 14:15:45'),
	(1, 3, '2022-01-11 14:15:45'),
	(1, 1, '2022-01-11 14:15:57'),
	(1, 3, '2022-01-11 14:15:57'),
	(1, 1, '2022-01-11 14:16:34'),
	(1, 3, '2022-01-11 14:16:34'),
	(1, 1, '2022-01-11 14:16:39'),
	(1, 3, '2022-01-11 14:16:39'),
	(1, 1, '2022-01-11 14:17:44'),
	(1, 3, '2022-01-11 14:17:44'),
	(1, 1, '2022-01-11 14:48:09'),
	(1, 3, '2022-01-11 14:48:09'),
	(1, 1, '2022-01-11 14:56:46'),
	(1, 3, '2022-01-11 14:56:46'),
	(3, 2, '2022-01-11 17:01:00'),
	(3, 5, '2022-01-11 17:01:00'),
	(3, 4, '2022-01-11 17:01:00'),
	(4, 3, '2022-01-11 17:07:05'),
	(4, 5, '2022-01-11 17:07:05'),
	(4, 3, '2022-04-04 11:46:56'),
	(4, 5, '2022-04-04 11:46:56');
/*!40000 ALTER TABLE `appointment_test_list` ENABLE KEYS */;

-- Dumping structure for table odlms_db.client_list
CREATE TABLE IF NOT EXISTS `client_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `contact` varchar(150) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `avatar` text,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.client_list: ~2 rows (approximately)
/*!40000 ALTER TABLE `client_list` DISABLE KEYS */;
REPLACE INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `email`, `password`, `dob`, `address`, `avatar`, `delete_flag`, `date_created`, `date_updated`) VALUES
	(2, 'Claire', 'C', 'Blake', 'Female', '09456789123', 'cblake@sample.com', '4744ddea876b11dcb1d169fadf494418', '1997-10-14', 'Sample Address only', 'uploads/client-2.png?v=1641873547', 0, '2022-01-11 11:35:33', '2022-01-11 16:34:07'),
	(5, 'John', 'D', 'Smith', 'Male', '09456789123', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', '1997-07-15', 'Sample ADdress only.', 'uploads/client-5.png?v=1641891731', 0, '2022-01-11 16:56:43', '2022-01-11 17:02:11');
/*!40000 ALTER TABLE `client_list` ENABLE KEYS */;

-- Dumping structure for table odlms_db.history_list
CREATE TABLE IF NOT EXISTS `history_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(30) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`appointment_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `history_list_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.history_list: ~4 rows (approximately)
/*!40000 ALTER TABLE `history_list` DISABLE KEYS */;
REPLACE INTO `history_list` (`id`, `appointment_id`, `status`, `remarks`, `date_created`) VALUES
	(2, 1, 1, 'Appointment has been approved.', '2022-01-11 15:47:27'),
	(10, 3, 1, 'Appointment has been approved.', '2022-01-11 17:03:08'),
	(11, 3, 2, 'Samples has been collected.', '2022-01-11 17:03:30'),
	(13, 4, 3, '', '2022-04-04 12:03:19');
/*!40000 ALTER TABLE `history_list` ENABLE KEYS */;

-- Dumping structure for table odlms_db.system_info
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.system_info: ~5 rows (approximately)
/*!40000 ALTER TABLE `system_info` DISABLE KEYS */;
REPLACE INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
	(1, 'name', 'Online Diagnostic Lab Management System using PHP and MYSQL'),
	(6, 'short_name', 'ODLMS'),
	(11, 'logo', 'uploads/logo-1649045166.png'),
	(13, 'user_avatar', 'uploads/user_avatar.jpg'),
	(14, 'cover', 'uploads/cover-1649045097.png');
/*!40000 ALTER TABLE `system_info` ENABLE KEYS */;

-- Dumping structure for table odlms_db.test_list
CREATE TABLE IF NOT EXISTS `test_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `cost` float NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.test_list: ~6 rows (approximately)
/*!40000 ALTER TABLE `test_list` DISABLE KEYS */;
REPLACE INTO `test_list` (`id`, `name`, `description`, `cost`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
	(1, 'CT scan', 'A CT (computed tomography) scan is a type of x-ray that creates 3-dimensional images of your body, including bones, organs, tissues and tumours. The machine moves in a circular motion around you and takes x-rays of very thin slices of your body to create a cross-sectional image.', 2500, 1, 0, '2022-01-11 10:20:35', NULL),
	(2, 'Electrocardiogram (ECG)', 'An ECG is a graph of your heart\'s electrical activity. It is a safe test. There is no risk of being electrocuted.', 1500, 1, 0, '2022-01-11 10:21:20', NULL),
	(3, 'Magnetic Resonance Imaging (MRI) Scan', 'A magnetic resonance imaging (MRI) scan takes detailed pictures of the inside of the body. It can show up problems in the soft tissues without the need for surgery. It is also useful for planning some treatments of the same areas.', 2500, 1, 0, '2022-01-11 10:22:06', NULL),
	(4, 'X-Rays', 'An x-ray uses radiation to create a picture of the inside of the body. The x-ray beam is absorbed differently by various structures in the body, such as bones and soft tissues, and this is used to create the image. X-ray is also known as radiography.', 750, 1, 0, '2022-01-11 10:22:41', NULL),
	(5, 'Ultrasound', 'An ultrasound scan creates a real-time picture of the inside of the body using sound waves. Ultrasound is generally painless and non-invasive. Ultrasound works differently to x-ray in that it does not use radiation.', 1500, 1, 0, '2022-01-11 10:23:07', NULL),
	(6, 'Sample 101', ' To Be Deleted', 123, 0, 1, '2022-01-11 10:23:18', '2022-01-11 10:23:38');
/*!40000 ALTER TABLE `test_list` ENABLE KEYS */;

-- Dumping structure for table odlms_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `middlename` text,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table odlms_db.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
	(1, 'tedted', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2022-04-04 13:12:11'),
	(6, 'C', NULL, 'B', 'member ', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-6.png?v=1641629093', NULL, 2, 1, '2022-01-08 16:04:17', '2022-04-04 13:12:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
