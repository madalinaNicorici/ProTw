-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for funweb
CREATE DATABASE IF NOT EXISTS `funweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `funweb`;


-- Dumping structure for table funweb.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table funweb.categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Dumping structure for table funweb.game_levels
DROP TABLE IF EXISTS `game_levels`;
CREATE TABLE IF NOT EXISTS `game_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) DEFAULT NULL,
  `min_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.game_levels: ~5 rows (approximately)
/*!40000 ALTER TABLE `game_levels` DISABLE KEYS */;
INSERT INTO `game_levels` (`level_id`, `description`, `min_score`) VALUES
	(1, 'HTML + CSS', 0),
	(2, 'PHP + JAVASCRIPT', 500),
	(3, 'HTTP + COOKIE', 1000),
	(4, 'REST + AJAX', 2000),
	(5, 'MASHUP + SECURITY', 4000);
/*!40000 ALTER TABLE `game_levels` ENABLE KEYS */;


-- Dumping structure for table funweb.keys
DROP TABLE IF EXISTS `keys`;
CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.keys: ~1 rows (approximately)
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
	(1, 0, '123456', 0, 0, 0, NULL, 0);
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;


-- Dumping structure for table funweb.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.logs: ~3 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `rtime`, `authorized`, `response_code`) VALUES
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"1074df3a-3e54-bf3f-ff75-705b0ddfbc64";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464263192, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"3a3084be-9024-a74f-89d0-9551003edafd";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464263809, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"7e5c2496-9571-b8e3-6e3f-e36203d2f86e";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464263847, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"f554ab27-c260-165a-0469-f5074af1f3ce";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264234, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"d36d70ef-0f7c-51ce-f222-1511bfbf2f3b";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264329, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"67f15f8f-3bf8-8d43-f240-7c698acb2b36";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264374, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"5fba41f8-b775-66b4-09bc-f9a8e08dfbb4";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264417, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"8239dc87-d781-3b5b-1c54-732988924490";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264437, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"51fada75-60d7-0c24-55cd-0bf1aa31f91d";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264469, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"6b698c67-df86-1967-8feb-1929fd043a78";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264481, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"ba50acd1-a630-2432-5061-cb88ad8f26ef";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264498, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"f9d374d8-6583-7470-7011-4dad602e5224";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264566, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"b98def4e-b1c7-24a8-650b-3410690d06c4";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464264998, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"343faa5c-daa4-1873-3786-07d849629daa";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265096, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"206072bf-be1d-04bc-be7f-74761df02c02";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265114, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"a50d1766-2107-e8dd-710a-f2b4c8ac67e6";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265475, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"55349dcf-6c29-5978-daee-b37c46c76b3c";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265616, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"82fa0e28-72cf-8388-336a-669db02eead1";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265646, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"f1556a28-10c9-5944-ce3e-02c062d89c4c";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265901, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"afce22a2-05bf-cf1e-a90c-84dc44f7a111";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265944, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"23ea2260-41fd-d77f-de27-c7af4ef24bcf";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464265948, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"9d79450c-7326-e53f-320d-7532563fc985";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266087, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"2a1dfe34-1bf2-2d0d-d26c-bbddee4e5ee7";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266167, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"0c3de890-8bca-c86d-5707-a18396de717a";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266197, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"b725a032-f6b8-6167-cfd5-10cb9af0941e";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266210, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"36977582-47c9-7e0a-6800-7fd5a0b889a7";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266271, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"0e4b7820-9318-a017-0ea6-65c43ec36b95";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266272, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"f3bd7cce-7fe1-8e58-6ab8-2d5c9da4d6f5";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464266281, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"99782707-54ef-962f-1603-ea22b0f62713";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267071, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"9061141e-878b-d702-0df2-66481ed5c0b9";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267447, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"6e660d3b-7a31-b00d-b96f-3f66e1cd2d3a";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267526, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"5cf6a38d-476e-27d6-25b1-dda7e04179bc";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267551, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"c7d706f4-179d-4c9d-2161-3f29f8e8d65f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267564, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"c043543c-ba8e-de23-2021-872d21fdc27d";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267581, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"6e8ee47c-b8b6-96c1-b01b-af66e772f1c6";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267616, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"dd7056e4-8241-ea98-8551-66073063fab4";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267627, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"a5fe6c63-26ee-e055-7ecd-da65e6d3a38c";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267662, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"63daaf31-e56d-208f-0383-498421a1d051";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267774, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"504b90e6-eb5c-87c4-4cc1-5f48e23a2156";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267833, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"5e34bf6c-9d18-f03f-1f8d-c9ce643e4083";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267835, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"107d80d0-69a9-2022-7f17-cae38f3f119d";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267906, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"c3f6d561-3498-5741-e311-8fbf8a6880cc";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464267947, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"f0ba1da7-272e-4d03-0ad3-7a5242ba7b90";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268081, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"c51ac7be-0424-4bb4-cb4b-599b13131443";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268105, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"54afef0b-e953-3419-63ec-5371b3cbd22f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268150, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"940f2a4a-1083-9a7f-12e6-17d98dcc24da";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268159, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"4219e3bf-7a38-cbd3-2906-7ebf3f0e3647";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268202, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"92efbad6-81f0-2649-f055-6fa6b6e2eb18";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268214, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"6bf43959-9968-e304-d820-1b4fab8cde14";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268233, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"dadab6da-61a4-b005-447d-a924e39d81f8";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268236, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"9e00eea8-c7db-33ea-2bf3-26799a209531";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268255, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"02f8cd5f-14ad-a3d0-40ac-4e3f7870f34f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268258, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"2e2d8fa8-136b-0547-84cf-1aeecb174859";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268350, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"e7458687-679f-c9fd-1d2b-0e118a4e440e";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268380, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"d8ad331b-1c3d-ce5e-1b4b-e1d9f5e4c54b";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268422, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"94cb806c-5064-cdef-b0f0-de1a772bee23";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268522, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"12039cf4-0f88-f957-d277-b2b4faa40f0a";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464268843, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"89cf8e34-bdce-9e94-175e-9b79e3b1ccb9";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269129, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"d4c5273a-4c8a-2b3e-9c81-4ec540fb2056";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269235, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"d2fe9a1d-5c50-3bdf-5e34-b36f263cc7fb";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269255, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"64637a87-3bd6-2269-0e48-41c826397046";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269275, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"b19b6b61-0b5e-5195-eb37-8e3fe6b30ec1";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269453, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"66c2dbad-e967-556d-81fa-5a25b7755f04";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269513, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"975b71e5-c41b-b055-256d-81f0e09321f0";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269683, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"1ad5570f-d540-aa47-9e91-83606b44ec05";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269712, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"8d73deeb-7df6-7021-a033-64176a548962";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269726, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"e81bea3e-e603-ca0f-6bc1-731226594283";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269751, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"ba4d0d5d-7594-496e-bd09-96f3f20e3847";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269753, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"66fb28df-fa06-6761-7c11-d02b1458995d";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269777, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"9fc745ea-593f-cc0f-8ff0-4e7eea3967ed";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269804, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"ce28d68b-9134-b210-8363-61a0633cfc0e";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269820, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"682b8ea4-bfb4-21a1-b7e3-847774e5dc9e";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269918, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"fdfae4b6-9503-c25a-b695-63ae56b2250e";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269935, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"d7aba9d2-3e96-840d-1cb8-2b8a494eaa36";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269944, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"923b097b-23ae-0843-85ee-c8a87c870e69";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269958, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"ba134084-a735-cc6b-adfe-4119dfdd37ee";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269960, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"082b1fa7-ee7f-1173-8be0-fd714c920758";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269962, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"cb3611f2-d82e-aab5-8349-39028110f5d4";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269963, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"b5689768-ba40-fc83-4815-07dd8080e2ee";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269969, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"7759a35c-7d2a-b468-a338-7996ec6b194b";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269976, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"5aee0b0e-4916-21d6-3cce-895578e95d4a";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464269984, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"49e65217-54b8-32b9-db22-99af00f7f7d7";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270092, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"212e852c-fc00-106c-8f78-5bf13cb8ae2d";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270146, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"220b2e6d-69a1-8745-65f7-f6a6e116a768";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270187, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"997cfab8-ec74-f7fe-e2f3-7d3e4345d5ee";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270214, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"a50237ba-19f4-4b24-95c9-ab3a1473507b";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270236, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"b85b8e87-9c0f-abf5-1fde-91d76ce22901";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270983, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"2ef605bb-a2d0-87b4-b35a-ad4aa6a6e10f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270985, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"ae4021b7-2a9c-6a75-3dc6-7167934a440c";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464270987, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"2133d1ea-4d49-b630-618f-992ded1d1f0b";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464271893, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"f29d21c6-d8f5-2769-4acc-8a14885b9834";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464272599, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"22c4a855-83ac-6702-2143-12e3de190740";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464272636, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"43680fb8-7bae-6be6-7e0e-f779e7a0a910";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464272796, 0.562032, '1', 200),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"fa13f5ad-2821-afd5-553a-c3320c9dd4f7";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464272835, 0.562032, '1', 0),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"7d364d3b-91bb-e95c-5407-c4a067592c0f";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464273451, 0.562032, '1', 0),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"84672382-e25e-45f1-4d74-e06e37203511";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464273472, 0.562032, '1', 0),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"c11583b0-d081-593d-0112-0e74d2715797";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464273521, 0.562032, '1', 0),
	(0, 'quizzes/quiz/1', 'get', 'a:11:{i:0;N;s:4:"Host";s:9:"localhost";s:10:"Connection";s:10:"keep-alive";s:13:"Cache-Control";s:8:"no-cache";s:10:"User-Agent";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";s:9:"X-API-Key";s:6:"123456";s:13:"Postman-Token";s:36:"9a641aac-80ad-d841-cad9-9fddba30b19d";s:6:"Accept";s:3:"*/*";s:15:"Accept-Encoding";s:19:"gzip, deflate, sdch";s:15:"Accept-Language";s:44:"ro-RO,ro;q=0.8,en-US;q=0.6,en;q=0.4,fr;q=0.2";i:1;N;}', '123456', '::1', 1464273630, 0.562032, '1', 0);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table funweb.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_body` varchar(500) DEFAULT NULL,
  `answer_r` varchar(200) DEFAULT NULL,
  `answer_w1` varchar(200) DEFAULT NULL,
  `answer_w2` varchar(200) DEFAULT NULL,
  `answer_w3` varchar(200) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `hint` varchar(500) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `points` int(11) DEFAULT '10',
  PRIMARY KEY (`question_id`),
  KEY `fk_level_q` (`level_id`),
  CONSTRAINT `fk_level_q` FOREIGN KEY (`level_id`) REFERENCES `game_levels` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.questions: ~160 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`question_id`, `q_body`, `answer_r`, `answer_w1`, `answer_w2`, `answer_w3`, `level_id`, `hint`, `source`, `points`) VALUES
	(1, 'What does HTML stand for?', 'Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Heading Text Markup Language', 1, 'HTML is a markup language for describing web documents.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(2, 'Choose the correct HTML element for the largest heading:', '<h1>', '<heading>', '<head>', '<h6>', 1, 'HTML headings are defined with the <h1> to <h6> tags', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(3, 'What is the correct HTML element for inserting a line break?', '<br>', '<break>', '<lb>', '<ol>', 1, 'Use <br> if you want a line break (a new line) without starting a new paragraph', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(4, 'What is the correct HTML for adding a background color?', '<body style="background-color:yellow;">', '<background>yellow</background>', '<body bg="yellow">', '<body background="yellow">', 1, 'The background-color property defines the background color for an HTML element.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(5, 'Choose the correct HTML element to define important text:', '<strong>', '<b>', '<important>', '<i>', 1, 'The HTML ... element defines strong text, with added semantic "strong" importance.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(6, 'Choose the correct HTML element to define emphasized text:', '<em>', '<i>', '<italic>', '<b>', 1, 'The HTML <i> element defines italic text, without any extra importance and the HTML ...  element defines emphasized text, with added semantic importance.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(7, 'What is questionsthe correct HTML for creating a hyperlink?', '<a href="http://www.w3schools.com">W3Schools</a>', '<a>http://www.w3schools.com</a>', '<a name="http://www.w3schools.com">W3Schools.com</a>', '<a url="http://www.w3schools.com">W3Schools.com</a>\r\n    ', 1, 'In HTML, links are defined with the <a> tag and the href attribute specifies the destination address.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(8, 'Which character is used to indicate an end tag?', '/', '*', '<', '^', 1, 'HTML elements are written with a start tag, with an end tag, with the content in between: <tagname>content</tagname>', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(9, 'How can you open a link in a new tab/browser window?', '<a href="url" target="_blank">', '<a href="url" target="new">', '<a href="url" new>', '<a hreaf="new" target="uri">', 1, 'The target attribute specifies where to open the linked document.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(10, 'Which of these elements are all <table> elements?', '<table><tr><td>', '<thead><body><tr>', '<table><tr><tt>', '<table><head><tfoot>', 1, 'Tables are defined with the <table> tag. Tables are divided into table rows with the <tr> tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(11, 'How can you make a numbered list?', '<ol>', '<dl>', '<list>', '<ul>', 1, 'An unordered list starts with the <ul> tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(12, 'How can you make a bulleted list?', '<ul>', '<list>', '<dl>', '<ol>', 1, 'An unordered list starts with the <ul> tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(13, 'What is the correct HTML for making a checkbox?', '<input type="checkbox">', '<check>', '<input type="check">', '<checkbox>', 1, 'The Input Checkbox object represents an HTML <input> element with checkbox attribute.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(14, 'What is the correct HTML for making a text input field?', '<input type="text">', '<input type="textfield">', '<textinput type="text">', '<textfield>', 1, '<input type="password"> defines a password field', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(15, 'What is the correct HTML for making a drop-down list?', '<select>', '<input type="list">', '<list>', '<input type="dropdown">', 1, 'The <option> tags inside the <select> element define the available options in the list.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(16, 'What is the correct HTML for making a text area?', '<textarea>', '<input type="textbox">', '<input type="textarea">', '<input type="text">', 1, 'The ... tag defines a multi-line text input control.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(17, 'What is the correct HTML for inserting an image?', '<img src="image.gif" alt="MyImage">', '<img alt="MyImage">image.gif</img>', '<img href="image.gif" alt="MyImage">', '<image src="image.gif" alt="MyImage">', 1, 'In HTML, images are defined with the <img> tag. The <img> tag is empty, it contains attributes only, and does not have a closing tag.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(18, 'What is the correct HTML for inserting a background image?', '<body style="background-image:url(background.gif)">', '<body bg="background.gif">', '<background img="background.gif">', '<background bg="background.gif">', 1, 'he <body> background attribute is not supported in HTML5.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(19, 'Which HTML element defines the title of a document?', '<title>', '<meta>', '<head>', '<body>', 1, 'The <head> element is a container for metadata. The following tags describe metadata: <title>, <style>, <meta>, <link>, <script>, and <base>.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(20, 'Which HTML attribute specifies an alternate text for an image, if the image cannot be displayed?', 'alt', 'src', 'longdesc', 'title', 1, 'The src attribute specifies the URL of the image', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML', 10),
	(21, 'What does CSS stand for?', 'Cascading Style Sheets', 'Creative Style Sheets', 'Colorful Style Sheets', 'Computer Style Sheets', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(22, 'What is the correct HTML for referring to an external style sheet?', '<link rel="stylesheet" type="text/css" href="mystyle.css">', '<stylesheet>mystyle.css</stylesheet>', '<style src="mystyle.css">', '<link rel="text/css">', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(23, 'Where in an HTML document is the correct place to refer to an external style sheet?', 'In the <head> section', 'At the end of the document', 'In the <body> section', 'At the beginning of the document', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(24, 'Which HTML tag is used to define an internal style sheet?', '<style>', '<script>', '<css>', '<stylesheet>', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(25, 'Which HTML attribute is used to define inline styles?', 'style', 'class', 'font', 'styles', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(26, 'Which is the correct CSS syntax?', 'body {color: black;}', '{body;color:black;}', 'body:color=black;', ' {body:color=black;}', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(27, 'How do you insert a comment in a CSS file?', '/* this is a comment */', '\' this is a comment', '// this is a comment //', '// this is a comment', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(28, 'Which property is used to change the background color?', 'background-color', 'color', 'bgcolor', 'background', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(29, 'How do you add a background color for all <h1> elements?', ' h1 {background-color:#FFFFFF;}', 'h1.all {background-color:#FFFFFF;}', 'all.h1 {background-color:#FFFFFF;}', '*.h1 {background-color:#FFFFFF;}', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(30, 'Which CSS property is used to change the text color of an element?', 'color', 'text-color', ' fgcolor', 'element-color', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(31, 'Which CSS property controls the text size?', 'font-size', 'font-style', 'text-size', 'text-style', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(32, 'What is the correct CSS syntax for making all the <p> elements bold?', ' p {font-weight:bold;}', '<p style="font-size:bold;">', '<p style="text-size:bold;">', 'p {text-size:bold;}', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(33, 'How do you display hyperlinks without an underline?', 'a {text-decoration:none;}', 'a {underline:none;}', 'a {decoration:no-underline;}', ' {text-decoration:no-underline;}', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(34, 'How do you make each word in a text start with a capital letter?', 'text-transform:capitalize', 'text-transform:uppercase', 'You can\'t do that with CSS', 'text-transform:upper', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(35, 'Which property is used to change the font of an element?', 'Both font-family and font can be used', 'font-family', 'font', 'font-style', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(36, 'How do you make the text bold?', 'font-weight:bold;', 'style:bold;', 'font:bold;', 'font-style:bold', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(37, 'How do you display a border like this:The top border = 10 pixels, The bottom border = 5 pixels, The left border = 20 pixels, The right border = 1pixel?', 'border-width:10px 1px 5px 20px;', 'border-width:10px 20px 5px 1px;', 'border-width:5px 20px 10px 1px;', 'border-width:10px 5px 20px 1px;', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(38, 'Which property is used to change the left margin of an element?', 'margin-left', 'padding-left', 'indent', 'allign-left', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(39, 'How do you make a list that lists its items with squares?', 'list-style-type: square;', 'list-type: square;', 'list: square;', 'list-style: square', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(40, 'How do you select an element with id "demo"?', '#demo', '*demo', 'demo', '.demo', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(41, 'How do you select elements with class name "test"?', '.test', 'test', '*test', ' #test', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(42, 'How do you select all p elements inside a div element?', 'div p', 'div + p', 'div.p', 'p.div', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(43, 'How do you group selectors?', 'Separate each selector with a comma', 'Separate each selector with a space', 'Separate each selector with a plus sign', 'Separate each selector with a minus sign', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(44, 'What is the default value of the position property?', 'static', 'relative', 'fixed', 'absolute', 1, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=CSS', 10),
	(45, 'What is the previous version of HTML, prior to HTML5?', 'HTML 4.01', 'HTML 4.9', 'HTML 4', 'HTML 4.1', 1, 'The last version for HTML4 is HTML 4.01', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(46, 'Which doctype is correct for HTML5?', '<!DOCTYPE html>', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.0//EN" "http://www.w3.org/TR/html5/strict.dtd">', '<!DOCTYPE HTML5>', '<!DOCTYPE HTML>', 1, 'The DOCTYPE declaration for HTML5 is identical to the DOCTYPE declaration for HTML !', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(47, 'Which HTML5 element is used to specify a footer for a document or section?', '<footer>', '<bottom>', '<section>', '<head>', 1, 'The <f.....> element specifies a footer for a document or section.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(48, 'Which element is no longer supported in HTML5?', '<font>', '<menu>', '<ins>', '<q>', 1, '<acronym>, <applet>, <basefont>, <big>, <center>, <dir>, <font>, <frame>, <frameset>, <noframes>, <strike>, <tt> :not supported in HTML5', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(49, 'Which element is no longer supported in HTML5?', '<acronym>', '<base>', '<cite>', '<abbr>', 1, '<acronym>, <applet>, <basefont>, <big>, <center>, <dir>, <font>, <frame>, <frameset>, <noframes>, <strike>, <tt> :not supported in HTML5', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(50, 'In HTML5, onblur and onfocus are:', 'Event attributes', 'HTML elements', 'HTML attributes', 'Style attributes', 1, 'Onblur and onfocus are event .....', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(51, 'What is the correct HTML5 element for playing video files?', '<video>', '<media>', '<movie>', '<audio>', 1, 'Before HTML5, there was no standard for showing videos on a web page and now is the <v....> element', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(52, 'What is the correct HTML5 element for playing audio files?', '<audio>', '<mp3>', '<sound>', '<video>', 1, 'Before HTML5, there was no standard for playing audio files on a web page and now is the <a....> element', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(53, 'Which attribute for <script> elements is no longer required in HTML5?', '<type>', '<href>', '<rel>', '<src>', 1, 'The "type" attribute is required in HTML 4, but optional in HTML5.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(54, 'In HTML5, which method is used to get the current location of a user?', 'getCurrentPosition()', 'getUserPosition()', 'getPosition()', 'getCurrent()', 1, 'The getCurrent___() method is used to get the user\'s position', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(55, 'The new HTML5 global attribute, "contenteditable" is used to:', 'Specify whether the content of an element should be editable or not', 'Specifies a context menu for an element. The menu appears when a user right-clicks on the element', 'Return the position of the first found occurrence of content inside a string', 'Update content from the server', 1, 'The contenteditable attribute specifies whether the content of an element...', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(56, 'In HTML5, contextmenu and spellcheck are:', 'HTML attributes', 'Style attributes', 'HTML elements', 'Event attributes', 1, 'Attributes added in HTML5...', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(57, 'Graphics defined by SVG is in which format?', 'XML', 'HTML', 'CSS', 'PHP', 1, 'SVG defines the graphics in XML format', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(58, 'The <canvas> element in HTML5 is used to:', 'draw graphics', 'display database records', 'manipulate data in MySQL', 'create draggable elements', 1, 'The <canvas> element is only a container for graphics.You must use a script to actually draw the graphics.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(59, 'Which built-in HTML5 object is used to draw on the canvas?', 'getContext', 'getContent', 'getGraphics', 'getCanvas', 1, 'The getContext() method returns an object that provides methods and properties for drawing on the canvas.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(60, 'In HTML5, which attribute is used to specify that an input field must be filled out?', 'required', 'formvalidate', 'validate', 'placeholder', 1, 'A Required Field is a field that must be filled in with value before submission of a form. Required field sometimes known as Mandatory field or Compulsory field.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(61, 'Which input type defines a slider control?', 'range', 'slider', 'controls', 'search', 1, 'With the range input element, you can create sliding controls for your site users.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(62, 'Which input type defines a week and year control (no time zone)?', 'week', 'date', 'year', 'month', 1, 'The <input type="week"> allows the user to select a week and year (no time zone)', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(63, 'Which HTML5 element is used to display a scalar measurement within a known range?', '<meter>', '<measure>', '<range>', '<gauge>', 1, 'The <meter> tag defines a scalar measurement within a known range, or a fractional value. This is also known as a gauge.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(64, 'Which HTML5 element defines navigation links?', '<nav>', '<navig>', '<navigation>', '<navigate>', 1, 'The <nav> element is intended for large blocks of navigation links. However, not all links in a document should be inside a <nav> element!', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(65, 'In HTML5, what does the <aside> element define?', 'Content aside from the page content', 'A navigation list to be shown at the left side of the page', 'The ASCII character-set; to send information between computers on the Internet', 'something else....', 1, 'The <aside> tag defines some content aside from the content it is placed in. The aside content should be related to the surrounding content.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(66, 'Which HTML5 element is used to specify a header for a document or section?', '<header>', '<head>', '<section>', '<top>', 1, 'The <header> element specifies a header for a document or section. The <header> element should be used as a container for introductory content. You can have several <header> elements in one document.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(67, 'Which HTML5 element defines an article?', '<article>', '<content>', '<section>', '<header>', 1, 'The <article> element specifies independent, self-contained content. An article should make sense on its own, and it should be possible to read it independently from the rest of the web site.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=HTML5', 20),
	(68, 'What does PHP stand for?', 'PHP: Hypertext Preprocessor', 'Private Home Page', 'Personal Hypertext Processor', 'Personal Home Page', 2, 'PHP is an acronym for "PHP: Hypertext Preprocessor", PHP is a widely-used, open source scripting language, PHP scripts are executed on the server, PHP is free to download and use', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(69, 'PHP server scripts are surrounded by delimiters, which?', '<?php...?>', '<script>...</script>', '<&>...</&>', '<?php>...</?>', 2, 'A PHP script can be placed anywhere in the document. A PHP script starts with <?php and ends with ?>.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(70, 'How do you write "Hello World" in PHP', 'echo "Hello World";', 'Document.Write("Hello World");', '"Hello World";', '/\'Hello World/', 2, 'The echo() function outputs one or more strings. The echo() function is not actually a function, so you are not required to use parentheses with it. However, if you want to pass more than one parameter to echo(), using parentheses will generate a parse error. The echo() function is slightly faster than print().', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(71, 'All variables in PHP start with which symbol?', '$', '!', '&', '*', 2, 'A variable starts with the $ sign, followed by the name of the variable. A variable name must start with a letter or the underscore character.', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(72, 'What is the correct way to end a PHP statement?', ';', '</php>', 'New line', '.', 2, 'PHP statements end with a semicolon (;).', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(73, 'The PHP syntax is most similar to:', 'Perl and C', 'JavaScript', 'VBScript', 'C', 2, 'C and ...', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(74, 'How do you get information from a form that is submitted using the "get" method?', '$_GET[];', 'Request.QueryString;', 'Request.Form;', '/%%_GET[];', 2, 'The form-data can be sent as URL variables with method="get"', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(75, 'What is the correct way to include the file "time.inc" ?', '<?php include "time.inc"; ?>', '<?php include:"time.inc"; ?>', '<?php include file="time.inc"; ?>', '<!-- include file="time.inc" -->', 2, 'Syntax include \'filename\';', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(76, 'What is the correct way to create a function in PHP?', 'function myFunction()', 'new_function myFunction()', 'create myFunction()', 'create function myFunction()', 2, 'function functionName()', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(77, 'What is the correct way to open the file "time.txt" as readable?', 'fopen("time.txt","r");', 'open("time.txt","read");', 'fopen("time.txt","r+");', 'open("time.txt");', 2, 'The first parameter of fopen() contains the name of the file to be opened', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(78, 'Which superglobal variable holds information about headers, paths, and script locations?', '$_SERVER', '$_SESSION', '$_GLOBALS', '%_GET', 2, '$GLOBALS is a PHP super global variable which is used to access global variables', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(79, 'What is the correct way to add 1 to the $count variable?', '$count++;', '$count =+1', '++count', 'count++;', 2, '++$x is pre-increment', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(80, 'What is a correct way to add a comment in PHP?', '/*...*/', '*...*', '<!--...-->', '<comment>...</comment>', 2, 'In HTML we have <!--...-->', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(81, 'Which one of these variables has an illegal name?', '$my-Var', '$myVar', '$my_Var', '$my_var', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(82, 'How do you create an array in PHP?', '$cars = array("Volvo", "BMW", "Toyota");', '$cars = "Volvo", "BMW", "Toyota";', '$cars = array["Volvo", "BMW", "Toyota"];', '$cars = ("Volvo", "BMW", "Toyota");', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(83, 'Which operator is used to check if two values are equal and of same data type?', '===', '!=', '=', '==', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(84, 'Inside which HTML element do we put the JavaScript?', '<script>', '<javascript>', '<scripting>', '<js>', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(85, 'What is the correct JavaScript syntax to change the content of the HTML element below?', 'document.getElementById("demo").innerHTML = "Hello World!";', 'document.getElement("p").innerHTML = "Hello World!";', 'document.getElementByName("p").innerHTML = "Hello World!";', '#demo.innerHTML = "Hello World!";', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(86, 'Where is the correct place to insert a JavaScript?', 'Both the <head> section and the <body> section are correct', 'The <head> section', 'The <body> section', 'Both the <head> section and the <body> section', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(87, 'What is the correct syntax for referring to an external script called "xxx.js"?', '<script src="xxx.js">', '<script href="xxx.js">', '<script name="xxx.js">', '<script name=="xxx.js">', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(88, 'How do you write "Hello World" in an alert box?', 'alert("Hello World");', 'sgBox("Hello World");', 'alertBox("Hello World");', 'msg("Hello World");', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(89, 'How do you create a function in JavaScript?', 'function myFunction()', 'function:myFunction()', 'function=myFunction()', 'function.myFunction()', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(90, 'How do you call a function named "myFunction"?', 'myFunction()', 'call myFunction()', 'call function myFunction()', 'function myFunction()', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(91, 'How to write an IF statement in JavaScript?', 'if (i == 5)', 'if i = 5 then', 'if i = 5', 'if i == 5 then', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(92, 'How to write an IF statement for executing some code if "i" is NOT equal to 5?', 'if (i != 5)', 'if i =! 5 then', 'if i <> 5', 'if (i <> 5)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(93, 'How does a WHILE loop start?', 'while (i <= 10)', 'while (i <= 10; i++)', 'while i = 1 to 10', 'while (i < 10)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(94, 'How does a FOR loop start?', 'for (i = 0; i <= 5; i++)', 'for i = 1 to 5', 'for (i <= 5; i++)', 'for (i = 0; i <= 5)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(95, 'How can you add a comment in a JavaScript?', '//This is a comment', '"This is a comment', '<!--This is a comment-->', '/*This is a comment', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(96, 'How to insert a comment that has more than one line?', '/*This comment has more than one line*/', '<!--This comment has more than one line-->', '//This comment has more than one line//', '//This comment has more than one line', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(97, 'What is the correct way to write a JavaScript array?', 'var colors = (1:"red", 2:"green", 3:"blue")', 'var colors = 1 = ("red"), 2 = ("green"), 3 = ("blue")', 'var colors = ["red", "green", "blue"]', 'var colors = "red", "green", "blue"', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(98, 'How do you round the number 7.25, to the nearest integer?', 'Math.round(7.25)', 'round(7.25)', 'Math.rnd(7.25)', 'rnd(7.25)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(99, 'How do you find the number with the highest value of x and y?', 'Math.max(x, y)', 'top(x, y)', 'Math.ceil(x, y)', 'ceil(x, y)', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(100, 'What is the correct JavaScript syntax for opening a new window called "w2" ?', 'w2 = window.open("http://www.w3schools.com");', 'w2 = window.new("http://www.w3schools.com");', 'w2 = window.open.new("http://www.w3schools.com");', 'w2 = window.new.open("http://www.w3schools.com");', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(101, 'How can you detect the client\'s browser name?', 'navigator.appName', 'client.navName', 'browser.name', 'nav.name', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(102, 'Which event occurs when the user clicks on an HTML element?', 'onclick', 'onmouseclick', 'onmouseover', 'onchange', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(103, 'How do you declare a JavaScript variable?', 'var carName;', 'var_carName;', 'v carName;', 'variable carName;', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(104, 'Which operator is used to assign a value to a variable?', '=', '*', 'x', '-', 2, '', 'http://www.w3schools.com/quiztest/quiztest.asp?qtest=PHP', 20),
	(105, 'Multiple object can be sent over a TCP connection between client and server in ', 'persistent HTTP', 'nonpersistent HTTP', 'persistent HTTP and nonpersistent HTTP', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30),
	(106, 'HTTP is ________ protocol.', 'application layer', 'transport layer', 'network layer', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30),
	(107, 'In the network HTTP resources are located by ', 'uniform resource identifier', 'unique resource locator', 'unique resource identifier', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30),
	(108, 'In HTTP pipelining ', 'multiple HTTP requests are sent on a single TCP connection without waiting for the corresponding responses', 'multiple HTTP requests can not be sent on a single TCP connection', 'multiple HTTP requests are sent in a queue on a single TCP connection', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30),
	(109, 'HTTP client requests by establishing a __________ connection to a particular port on the server.', 'transmission control protocol', 'user datagram protocol', 'broader gateway protocol', 'none of the mentioned', 3, '', 'http://www.sanfoundry.com/computer-networks-questions-answers-http-ftp/', 30),
	(110, 'The HTTP ____ contains metadata, like encoding information and HTTP methods in some cases.', 'header', 'URL', 'Body', 'Http Codes', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(111, '_____ is the most popular way of establishing an encrypted HTTP connection.', 'HTTPS', 'http://', 'HTTs', 'www', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(112, 'Hypertext Transfer Protocol is the protocol that allows for sending ___________ back and forth on the web.', 'text or documents', 'none', 'URL only', 'used for authentication', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(113, 'HTTP error messages, also called ______________ are response codes given by Web-servers and help identify the cause of the problem.', 'HTTP status codes', 'HTTP recovery codes', 'HTTP fix', 'HTTPs', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(114, 'With HTTP you can send __________,as long as both the client and the server know how to handle the data content.', 'any type of data', 'http Bolton send url', 'only text', 'audio', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(115, 'Hypertext Transfer Protocol (HTTP) is ____________ protocol.', 'connectionless', 'connection oriented', ' none', 'routing', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(116, '_______ HTTP code means the HTTP method used is not supported for this resource.', '405', '100', '401', '404', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(117, 'HTTP code ____ indicates that the required resource could not be found.', '404', '101', '400', '401', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(118, 'HTTP ___ code is used when processing fails due to unanticipated circumstances on the server side, which causes the server to error out.', '500', '401', '404', '505', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(119, 'HTTP ____ was the first documented version of HTTP.', 'V 0.9', 'V1', 'V 0.8', 'V 1.1', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(120, '_____ HTTP code means that the data does not pass validation, or is in the wrong format.', '400', '101', '404', '100', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(121, 'HTTP have two different roles that is server and client. In general, the ____ always start the conversation and the ____replies.', 'client, server', 'Server, client', 'none', 'URL', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(122, 'In http ______ method is used to retrieve information from the given server using a given URL. Requests using ____ should only retrieve data.', 'GET , GET', 'GET , post', 'post, post', 'none', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(123, 'The HTTP client and server exchange information about resources identified by ', 'URLs', 'HTML', 'hyper-text', 'SNTP', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(124, 'The Hypertext Transfer Protocol (HTTP) is an _____________ protocol.', 'application-level', 'layer-2', 'layer-3', 'physical', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(125, '_______ HTTP code means the client has requested the server to switch protocols and server is acknowledging it.', '101', '100', '404', '401', 3, '', 'http://tipschief.com/http-quiz-online-test-on-hypertext-transfer-protocol/', 30),
	(126, 'Where do Internet cookies come from?', 'a Web site\'s server', 'the Internet\'s central hub', 'outer space', 'from Google', 3, 'Internet cookies are produced by a central server for a Web site and uploaded onto a user\'s computer when he or she first enters a site.', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(127, 'Cookies store state information. What is that?', 'information about a user\'s preferences', 'information about the size of your computer\'s hard drive', 'top secrets that are surreptitiously stored on one user\'s computer then moved to another', 'information about your personal lifestyle', 3, 'State information is details about your computer and preferences', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(128, 'Other information that a cookie may store about a user doesn\'t include:', 'preferences attached to other cookies', 'items in your online shopping cart', 'how often you visit a Web site', 'user\'s preferences', 3, 'Cookies can\'t look at other cookies', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(129, 'If you want to erase your cookies, what folder should you access on your PC?', 'Temporary Internet Files', 'Web Activity folder', 'Drivers folder', 'Downloads Folder', 3, 'To erase cookies, you\'ll have to go into your Temporary Internet Files folder.', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(130, 'What\'s "targeting" as far as Internet cookies are concerned?', 'focused marketing', 'the process of accessing a user\'s cookie', 'finding a s physical location', 'the storing procces', 3, 'Targeting is essentially ___ marketing to Internet users based on information found in their cookies.', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(131, 'DoubleClick is a company that produces cookies that:', 'can track users across the Internet', 'contain a user\'s personal information', 'smell like real, fresh-baked cookies', 'are malware', 3, 'DoubleClick produces cookies that can track users across the Internet, not just on one site.', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(132, 'The small, 1x1 pixel cookies implanted in banner ads are called:', 'Web bugs', 'devil cookies', 'Web scum', 'malware cookie', 3, 'Web bugs are tiny files hidden in banner ads that upload cookies onto a user\'s machine when he or she clicks a banner ad.', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(133, 'Cookies are written in what kind of text?', 'name-value pairs', 'ASCII', 'DOS', 'UTF8', 3, 'Cookies are written in name-value pairs. The name may be as simple as "UserID," and the value is a string of numbers and characters, the actual ID tag for the user\'s computer.', 'http://computer.howstuffworks.com/internet/basics/internet-cookie-quiz.htm', 30),
	(134, 'Which of the following is correct about web services?', 'Both of the above.', 'A web service is a collection of open protocols and standards used for exchanging data between applications or systems.', 'Software applications written in various programming languages and running on various platforms can use web services to exchange data among them over computer networks like the Internet.', 'None of the above.', 4, 'A web service is a collection of open protocols and standards used for exchanging data between applications or systems. Software applications written in various programming languages and running on various platforms can use web services to exchange data over computer networks like the Internet in a manner similar to inter-process communication on a single computer.', 'http://cronyweb.com/tutorials/restful/restful_online_quiz.html', 40),
	(135, 'Which of the following component of HTTP request contains metadata for the HTTP Request message as key-value pairs?', 'Request Header', 'VERB', 'URI', 'HTTP Version', 4, 'Request Header ? Contains metadata for the HTTP Request message as key-value pairs. For example, client ( or browser) type, format supported by client, format of message body, cache settings etc.', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm', 40),
	(136, 'Which of the following is advantage of RESTful web service being stateless?', 'All of the above.', 'Web services can treat each method request independently.', 'Web services need not to maintain client\'s previous interactions. It simplifies application design.', 'As HTTP is itself a statelessness protocol, RESTful Web services work seamlessly with HTTP protocol.', 4, '', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=26&max=50', 40),
	(137, 'Which of the following HTTP method should be used to get list the supported operations in RESTful web service?', 'OPTIONS', 'GET', 'HEAD', 'PUT', 4, 'OPTIONS opearations should be used to get list the supported operations in RESTful web service.', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=26&max=50', 40),
	(138, 'Which of the following directive of Cache Control Header of HTTP response can set the time limit of caching?', 'max-age', 'Public', 'Private', 'no-cache/no-store', 4, 'max-age directive indicates that the caching is valid up to max-age in seconds. After this, client has to make another request.', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=26&max=50', 40),
	(139, 'Which of the following HTTP Status code means NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests?', '304', '200', '201', '204', 4, 'HTTP Status Code 304 means NOT MODIFIED, used to reduce network bandwidth usage in case of conditional GET requests.', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=51&max=75', 40),
	(140, 'Which of the following annotation of JAX RS API is used to annotate a method used to fetch resource?', '@GET', '@Path', '@PUT', '@POST', 4, 'HTTP Get request, used to fetch resource.', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=51&max=75', 40),
	(141, 'Which of the following annotation of JAX RS API states the HTTP Response generated by web service?', '@Produces', '@DELETE', '@HEAD', '@Consumes', 4, '@Produces ? States the HTTP Response generated by web service, for example APPLICATION/XML, TEXT/HTML, APPLICATION/JSON etc', 'http://www.tutorialspoint.com/restful/restful_mock_test.htm?min=51&max=75', 40),
	(142, 'What is the name of the DLL that contains Ajax control tool kit?', 'Ajaxcontroltoolkit.dll', 'Ajaxtoolkit.dll', 'Ajaxcontrol.dll', 'control.dll', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(143, 'Which property is used to control the duration of Ajax request.', 'AsyncPostBackTimeout', 'AsyncTimeout', 'Timeout', 'PostBackTimeout', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(144, 'Which property is used to check whether AJAX request has been completed.', 'readyState', 'ready', 'open', 'onreadyState', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(145, 'How can you test the Ajax code?', 'JSUnit', 'JSU', 'AjaxJSU', 'JSUnitAjax', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(146, 'How can we cancel the XMLHttpRequest in AJAX?', 'Abort()', 'cancel()', 'remove()', 'none', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(147, 'What is the name of object used for AJAX request?', 'Request', 'XMLHTTPRequest', 'xmlRequest', 'HttpRequest', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(148, 'Which manager are use for pre-requisite Update Panel in Ajax.', 'Script Manager', 'Javascript Manager and Ajax Manager', 'Javascript Manager', 'Ajax Manager', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(149, 'Ajax is a…', 'Technology', 'Programing Language', 'Programing Language and OOPs concepts', 'OOPs concepts', 4, '', 'http://career.guru99.com/ajax-quiz/', 40),
	(150, 'A session-based system authenticates a user to a Web site to provide access to restricted resources. To increase security in this scenario, an authentication token should meet which of the following requirements?', 'It should always use a non-persistent cookie.', 'It should identify returning users to the site.', 'It should be public information.', 'It should always use a persistent cookie.', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(151, 'Which of the following is the best way to protect a Web application from unvalidated redirects and forwards?', 'Validate the referrer header.', 'Use extended validation certificates.', 'Use the escaping technique.', 'Disallow requests to unauthorized file types.', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(152, 'Which mitigation technique helps you tell the parser that a specific character is a literal and not a control character?', 'Escaping', 'Table indirection', 'Allow list', 'Block list', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(153, 'Which of the following is most vulnerable to injection attacks?', 'Regular expressions', 'Server configuration files', 'Registry keys', 'Session IDs', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(154, 'Which of the following vulnerabilities is most likely to occur due to an insecure direct object reference attack?', 'Accessing a resource without authorization.', 'Executing commands on the server.', 'Impersonating any user on the system.', 'Modifying SQL data pointed to by the query.', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(155, 'Which of the following actions should you take to test the security of your Web application?', 'Use your browser to forge unauthorized requests.', 'Set the secure flag on session ID cookies.', 'Use policy mechanisms.', 'Use a simple and positive model at every layer.', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(156, 'Which of the following procedures are involved in the hardening process?', 'Disable unnecessary features.', 'Resubmit POST parameters during redirection.', 'Update the environment with changes only when needed.', 'Repeat the process at random intervals.', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(157, 'Which of the following factors helps you secure keys?', 'Complexity', 'Escaping', 'Session-based indirection', 'Encryption', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(158, 'A user is able to pass malicious input that invokes control codes in your Web application. Which vulnerability is most likely to occur in your Web application?', 'Injection', 'Insufficient transport layer protection', 'Insecure direct object references', 'Failure to restrict URL access', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(159, 'Which of the following is the best way to reevaluate your environment and address new threats?', 'Add or remove network segments.', 'Use the white-list validation of allowed input technique.', 'Use your browser to forge unauthorized requests.', 'Use custom cryptographic algorithms.', 5, '', 'https://websecurity.firebaseapp.com/', 50),
	(160, 'Which of the following is most likely to result from unvalidated redirects and forwards?', 'Bypassed authorization checks', 'Brute force attack', 'Network sniffing', 'Man-in-the-middle attack', 5, '', 'https://websecurity.firebaseapp.com/', 50);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


-- Dumping structure for table funweb.quizzes
DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE IF NOT EXISTS `quizzes` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) DEFAULT NULL,
  `questions_list` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `fk_level_quiz` (`level_id`),
  CONSTRAINT `fk_level_quiz` FOREIGN KEY (`level_id`) REFERENCES `game_levels` (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.quizzes: ~6 rows (approximately)
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` (`quiz_id`, `level_id`, `questions_list`) VALUES
	(1, 1, '8,20,44,1,2,6,24,37,46,52,'),
	(2, 1, '57,63,12,1,35,41,32,36,19,52,'),
	(3, 2, '70,103,94,92,75,91,71,85,74,82,'),
	(4, 2, '85,77,98,84,94,80,76,96,101,99,'),
	(5, 3, '120,109,113,106,115,105,131,125,129,107,'),
	(6, 4, '147,136,140,142,141,148,138,135,146,144,');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;


-- Dumping structure for table funweb.users_profile
DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE IF NOT EXISTS `users_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT 'active',
  `is_admin` tinyint(4) DEFAULT '0',
  `is_log` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `fast_user` (`username`,`user_password`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.users_profile: ~40 rows (approximately)
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` (`user_id`, `name`, `surname`, `username`, `email`, `user_password`, `status`, `is_admin`, `is_log`) VALUES
	(1, 'Chaney', 'Moran', 'Lacota_Mckenzie', 'nec.mauris.blandit@Proin.net', 'AIf96GEm0PP', 'active', 0, 0),
	(2, 'Dustin', 'Clemons', 'Yuri_Price', 'eget@nuncsedpede.edu', 'KXj54HAr1AT', 'active', 1, 0),
	(3, 'Idona', 'Beck', 'Shelly_Daugherty', 'Aliquam.rutrum.lorem@nuncinterdumfeugiat.com', 'BAs91TAc8GY', 'active', 1, 0),
	(4, 'Sasha', 'Berry', 'Rowan_Tate', 'massa@faucibusorciluctus.org', 'VGo66EJm4AT', 'active', 0, 0),
	(5, 'Hamilton', 'Mcmahon', 'Vera_Holman', 'Donec.dignissim@non.net', 'TKe08MWk1PB', 'active', 0, 0),
	(6, 'Marah', 'Kidd', 'Amena_Hood', 'facilisi@necanteMaecenas.net', 'LOd41SDn2ZV', 'active', 0, 0),
	(7, 'Inez', 'Mason', 'Noel_Mitchell', 'lorem.eget@ante.com', 'WNj91USl6WA', 'active', 0, 0),
	(8, 'Isaiah', 'Lowe', 'Lareina_Ayala', 'ornare.placerat@euligulaAenean.org', 'IVn95XSz6ED', 'active', 0, 0),
	(9, 'Jolene', 'Payne', 'Naomi_Marshall', 'non.hendrerit@amet.org', 'PBu13IJt0FM', 'active', 0, 0),
	(10, 'Chaney', 'Joyce', 'Adrian_Lancaster', 'tellus.Aenean@lobortisquam.co', 'ICv41ZTg8IT', 'active', 0, 0),
	(11, 'Beatrice', 'Calhoun', 'Evan_Hunter', 'metus@urna.net', 'VYo99MLw6GU', 'active', 0, 0),
	(12, 'Zorita', 'Sykes', 'Hilel_Vazquez', 'Mauris.eu@tellusSuspendissesed.ca', 'WXz37WVw5TK', 'active', 0, 0),
	(13, 'Lucy', 'Brady', 'Aladdin_Harrington', 'Nulla.facilisis@parturientmontes.com', 'UVa77IOg9KH', 'active', 0, 0),
	(14, 'Leroy', 'Hewitt', 'Katell_Wilcox', 'pharetra.ut.pharetra@necquam.net', 'NZs06MZh5PN', 'active', 0, 0),
	(15, 'Cassidy', 'Burns', 'Ray_Solis', 'cursus@CurabiturmassaVestibulum.com', 'TSb86NXm4XL', 'active', 0, 0),
	(16, 'Marvin', 'Gay', 'Imogene_Gonzales', 'Sed.auctor@sodalespurus.com', 'RAv15UOj7MW', 'active', 0, 0),
	(17, 'Dustin', 'Cameron', 'Jerome_Franklin', 'Nunc@AeneanmassaInteger.edu', 'UIs53MUe5GP', 'active', 0, 0),
	(18, 'Tanek', 'Whitfield', 'Neve_Bowman', 'fringilla.cursus.purus@consectetueradipiscing.co', 'WHb75HDx2SH', 'active', 0, 0),
	(19, 'Susan', 'Atkins', 'Camille_Smith', 'neque.et.nunc@arcu.com', 'IYh92EOr0BZ', 'active', 0, 0),
	(20, 'Iona', 'Pickett', 'Justin_Morse', 'erat.nonummy@suscipitest.net', 'CIh31NUw8VX', 'active', 0, 0),
	(21, 'Maggie', 'Rodgers', 'Eleanor_Bailey', 'orci.adipiscing.non@atvelitPellentesque.edu', 'PGi22UOl1UE', 'active', 0, 0),
	(22, 'Lillian', 'Oneill', 'Carolyn_Nolan', 'dolor.sit@risusDuisa.edu', 'RSh44BWn3UU', 'active', 0, 0),
	(23, 'Rinah', 'Holmes', 'Michael_Roman', 'eu@egestas.edu', 'QJt88FPf8RQ', 'active', 0, 0),
	(24, 'Judith', 'Vargas', 'Kirk_Morales', 'Donec@Phasellus.ca', 'JOf51QIz4GY', 'active', 0, 0),
	(25, 'Nissim', 'Jennings', 'Blaine_Hutchinson', 'Cras.vehicula@cursus.co', 'DCe22NTc6OI', 'active', 0, 0),
	(26, 'Nell', 'Powell', 'Raphael_Middleton', 'Suspendisse.sed.dolor@Aliquamornare.net', 'HRd77DTg6ZU', 'active', 0, 0),
	(27, 'Gloria', 'Dickson', 'Chanda_Pratt', 'lacus.Quisque.imperdiet@posuerecubilia.org', 'GXz40PWg3YH', 'active', 0, 0),
	(28, 'Priscilla', 'Kim', 'Rowan_Livingston', 'ac@odiovelest.org', 'RIe09GYe1IP', 'active', 0, 0),
	(29, 'Isadora', 'Higgins', 'Dominic_Nichols', 'vulputate.lacus.Cras@nonummy.edu', 'ZHn05JEu1MJ', 'active', 0, 0),
	(30, 'Veda', 'Haley', 'Jade_Gillespie', 'Proin.non@elementumsem.edu', 'OWo26CVm3BY', 'active', 0, 0),
	(31, 'Josiah', 'Spence', 'Kibo_Weaver', 'risus.a@Aliquamgravidamauris.co', 'ZXy89UCx3AG', 'active', 0, 0),
	(32, 'Jerry', 'Chase', 'Fredericka_Hendrix', 'turpis.In@Maurismolestie.edu', 'ZEd78ZUm5SL', 'active', 0, 0),
	(33, 'Amber', 'Weiss', 'Rowan_Shields', 'odio.vel.est@Nullamvelit.net', 'VIa78NGr2ON', 'active', 0, 0),
	(34, 'Damon', 'Hutchinson', 'Griffith_Murray', 'arcu.eu.odio@liberoMorbi.net', 'COb34YLl2BJ', 'active', 0, 0),
	(35, 'Martina', 'Hawkins', 'Hedley_Haney', 'ligula.Aenean.gravida@commodotincidunt.org', 'XZz38YAw7BR', 'active', 0, 0),
	(36, 'Eleanor', 'Cox', 'Tiger_Chase', 'nibh@sedsapien.edu', 'NQd05OKj2QT', 'active', 0, 0),
	(37, 'Herrod', 'Knapp', 'Yeo_Dunn', 'massa.Quisque@Nuncquisarcu.com', 'RJb41KFp6BZ', 'active', 0, 0),
	(38, 'Gannon', 'Morin', 'Philip_Harris', 'augue@a.net', 'UBl80SPa4UR', 'active', 0, 0),
	(39, 'Mechelle', 'Beach', 'Wade_Fox', 'at.velit@molestieorcitincidunt.com', 'SDg77QIi8NB', 'active', 0, 0),
	(40, 'Odysseus', 'Tyson', 'Brianna_Kinney', 'urna.convallis@tellusSuspendissesed.ca', 'FPr18GUx5GA', 'active', 0, 0);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;


-- Dumping structure for table funweb.users_quiz_status
DROP TABLE IF EXISTS `users_quiz_status`;
CREATE TABLE IF NOT EXISTS `users_quiz_status` (
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`quiz_id`),
  KEY `fk_quizz` (`quiz_id`),
  CONSTRAINT `fk_quizz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.users_quiz_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `users_quiz_status` DISABLE KEYS */;
INSERT INTO `users_quiz_status` (`user_id`, `quiz_id`, `result`) VALUES
	(1, 1, 300);
/*!40000 ALTER TABLE `users_quiz_status` ENABLE KEYS */;


-- Dumping structure for table funweb.users_status
DROP TABLE IF EXISTS `users_status`;
CREATE TABLE IF NOT EXISTS `users_status` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT '0',
  `level_id` int(11) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  KEY `fk_level` (`level_id`),
  KEY `fast_score` (`points`,`level_id`),
  CONSTRAINT `fk_level` FOREIGN KEY (`level_id`) REFERENCES `game_levels` (`level_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table funweb.users_status: ~40 rows (approximately)
/*!40000 ALTER TABLE `users_status` DISABLE KEYS */;
INSERT INTO `users_status` (`user_id`, `points`, `level_id`) VALUES
	(1, 0, 1),
	(2, 0, 1),
	(3, 0, 1),
	(4, 0, 1),
	(5, 0, 1),
	(6, 0, 1),
	(7, 0, 1),
	(8, 0, 1),
	(9, 0, 1),
	(10, 0, 1),
	(11, 0, 1),
	(12, 0, 1),
	(13, 0, 1),
	(14, 0, 1),
	(15, 0, 1),
	(16, 0, 1),
	(17, 0, 1),
	(18, 0, 1),
	(19, 0, 1),
	(20, 0, 1),
	(21, 0, 1),
	(22, 0, 1),
	(23, 0, 1),
	(24, 0, 1),
	(25, 0, 1),
	(26, 0, 1),
	(27, 0, 1),
	(28, 0, 1),
	(29, 0, 1),
	(30, 0, 1),
	(31, 0, 1),
	(32, 0, 1),
	(33, 0, 1),
	(34, 0, 1),
	(35, 0, 1),
	(36, 0, 1),
	(37, 0, 1),
	(38, 0, 1),
	(39, 0, 1),
	(40, 0, 1);
/*!40000 ALTER TABLE `users_status` ENABLE KEYS */;


-- Dumping structure for procedure funweb.add_answer
DROP PROCEDURE IF EXISTS `add_answer`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_answer`(IN p_user_id INT, IN p_quiz_id INT, IN p_result INT)
BEGIN
      DECLARE v_count INT;
      DECLARE v_answer_r VARCHAR(200);
      DECLARE v_point INT DEFAULT(10);
      DECLARE v_result INT;
      SET v_count=0;
      select count(*) into v_count from users_quiz_status where user_id = p_user_id and quiz_id = p_quiz_id;
      if(v_count = 0) then
        insert into users_quiz_status(user_id,quiz_id) values(p_user_id, p_quiz_id);
      end if;
      select level_id into v_point from quizzes where quiz_id = p_quiz_id;
        SET v_point = v_point * 10;
        select result into v_result from users_quiz_status WHERE user_id = p_user_id and quiz_id = p_quiz_id;
        if(v_result is not null) then
          UPDATE users_quiz_status SET result = result + p_result * v_point WHERE user_id = p_user_id and quiz_id = p_quiz_id;
        else
          UPDATE users_quiz_status SET result = p_result * v_point WHERE user_id = p_user_id and quiz_id = p_quiz_id;
        end if;
    END//
DELIMITER ;


-- Dumping structure for procedure funweb.delete_user
DROP PROCEDURE IF EXISTS `delete_user`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`( IN p_user_id INT)
BEGIN
      DECLARE v_count INT;
      SELECT COUNT(user_id) INTO v_count FROM users_profile WHERE user_id=p_user_id;
      IF v_count=0 THEN 
          SIGNAL SQLSTATE '20107'
             SET MESSAGE_TEXT='Invalid user_id! Try again!';
      ELSE
            DELETE FROM users_status WHERE user_id=p_user_id ;
            DELETE FROM users_profile WHERE user_id=p_user_id ;
      END IF;
    END//
DELIMITER ;


-- Dumping structure for procedure funweb.log_in
DROP PROCEDURE IF EXISTS `log_in`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_in`( IN p_username VARCHAR(30), IN p_password VARCHAR(100), OUT p_user_id INT )
BEGIN
       DECLARE v_count INT;
       DECLARE v_countp INT;
       SELECT COUNT(username)INTO v_count FROM users_profile WHERE username=p_username;
       SELECT COUNT(user_password)INTO v_countp FROM users_profile WHERE user_password=p_password AND username=p_username;
       IF v_count=0 THEN
          SIGNAL SQLSTATE '20105'
             SET MESSAGE_TEXT='Invalid username! Try again!';
       ELSE
			   IF v_countp=0 THEN
	          SIGNAL SQLSTATE '20106'
	             SET MESSAGE_TEXT='Invalid user_password! Try again!';
	         ELSE
	          SELECT user_id INTO p_user_id FROM users_profile WHERE username=p_username AND user_password=p_password;
	         END IF;
       END IF;
    END//
DELIMITER ;


-- Dumping structure for procedure funweb.populate_quiz
DROP PROCEDURE IF EXISTS `populate_quiz`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `populate_quiz`()
BEGIN
  		DECLARE done INT DEFAULT FALSE;
  		DECLARE question_list VARCHAR(500);
   	DECLARE v_start,v_end,v_check INT;
   	DECLARE q_id,l_id INT;
   	DECLARE  v_question_id INT;
   	DECLARE  v_ok TINYINT;
  		DECLARE  v_count_existent_question INT;
   	DECLARE  i INT ;
   	DECLARE  existent_question VARCHAR(500);
   	DECLARE cc CURSOR FOR select quiz_id,level_id from quizzes;
   	
   	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  
  		OPEN cc;
		
  		
  		for_loop: LOOP	
  			
  			FETCH cc into q_id,l_id;
			IF done THEN
      		LEAVE for_loop;
      	end if;
	    	if l_id = 6 then
	        		SET v_start = 1;
	        		select count(*) into v_end from questions;
	    	else
	     			select question_id into v_start from questions where level_id = l_id order by question_id LIMIT 1;
	      		select question_id into v_end from questions where level_id = l_id order by question_id DESC LIMIT 1;
	    			SET i = 0;
		    		label1 : LOOP
		    		SET i = i + 1;
		    		IF i < 11 THEN
		    			SET v_check = 1;
		    			
		    			select (floor(rand()*(v_end - v_start) + v_start)) into v_question_id from dual;
		    			if i = 1 then
		    				SET question_list = v_question_id;
		    				SET question_list = concat(question_list, ",");
		    				update quizzes set questions_list = question_list where quiz_id = q_id; 
		    			else
		    				while v_check > 0 do
			    				select find_in_set(v_question_id,question_list) into v_check;
			    				if v_check <> 0 then
			    					select (floor(rand()*(v_end - v_start) + v_start)) into v_question_id from dual;
			    				else
								 	SET question_list = concat(question_list, v_question_id);
								 	SET question_list = concat(question_list, ",");
								 	update quizzes set questions_list = question_list where quiz_id = q_id; 
						 		end if;
		    				end while;
		    			end if;	
		    		ELSE 
		    			LEAVE label1;
		    		END IF;
		    		END LOOP label1;
	    	end if;
    	
  		end loop for_loop;	
  		close cc;
  		
  END//
DELIMITER ;


-- Dumping structure for procedure funweb.return_quiz_id
DROP PROCEDURE IF EXISTS `return_quiz_id`;
DELIMITER //
//
DELIMITER ;


-- Dumping structure for procedure funweb.show_question
DROP PROCEDURE IF EXISTS `show_question`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_question`(IN p_question_id INT, OUT p_body VARCHAR(500), OUT p_answer_r VARCHAR(200), OUT p_answer_w1 VARCHAR(200), 
		OUT p_answer_w2 VARCHAR(200),OUT p_answer_w3 VARCHAR(200))
BEGIN
      select q_body, answer_r, answer_w1, answer_w2, answer_w3 into p_body, p_answer_r, p_answer_w1, p_answer_w2, p_answer_w3 from questions where question_id = p_question_id;
    END//
DELIMITER ;


-- Dumping structure for procedure funweb.show_user_info
DROP PROCEDURE IF EXISTS `show_user_info`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_user_info`(IN p_user_id INT,
       OUT p_name VARCHAR(30),OUT p_surname VARCHAR(30),OUT p_username VARCHAR(30),
      OUT p_email VARCHAR(100),OUT p_points INT,OUT p_level INT)
BEGIN
      SELECT up.name, up.surname, up.username, up.email, us.points, us.level_id INTO p_name, p_surname, p_username, p_email, p_points, p_level
      FROM users_profile up JOIN users_status us ON us.user_id = up.user_id
        WHERE up.user_id = p_user_id;  
    END//
DELIMITER ;


-- Dumping structure for procedure funweb.sign_in
DROP PROCEDURE IF EXISTS `sign_in`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_in`(IN p_name VARCHAR(30), IN p_surname VARCHAR(30), IN p_username VARCHAR(30), IN p_email VARCHAR(100),IN  p_user_password VARCHAR(100))
BEGIN
      DECLARE v_count_username INT ;
      DECLARE v_count_profile INT ;
      DECLARE v_last_id INT;
      DECLARE v_user_id INT;
      
      SET v_count_username = 0;
      SET v_count_profile = 0;
      SELECT user_id INTO v_last_id FROM users_profile ORDER BY  user_id DESC  LIMIT 1; 
      SET v_user_id = v_last_id + 1;
      
      SELECT count(*) INTO v_count_username FROM users_profile where username = p_username;
      SELECT count(*) INTO v_count_profile FROM users_profile WHERE name=p_name AND surname = p_surname AND username = p_username AND email=p_email AND user_password=p_user_password;
		
		IF(v_count_profile > 0) then
        SIGNAL SQLSTATE '20106'
			 SET MESSAGE_TEXT='Profile already exists! Try to login.';
      ELSE 
		 IF (v_count_username > 0) then
			 SIGNAL SQLSTATE '20105'
				SET MESSAGE_TEXT='Username already exists!';
		 ELSE
		  IF not p_name regexp '^[a-zA-Z-]+$' then
			  SIGNAL SQLSTATE '20100'
				SET MESSAGE_TEXT='Invalid characters in name! It should contain only letters and -.';
		
		  ELSE
			IF not p_surname regexp '^[a-zA-Z-]+$' then
				     SIGNAL SQLSTATE '20101'
					       SET MESSAGE_TEXT='Invalid characters in surname! It should contain only letters and -.';
		   ELSE 
			  IF instr(p_username,';') > 0 OR length(p_username) > 30 OR length(p_username) < 4  THEN 
		             SIGNAL SQLSTATE '20102'
					       SET MESSAGE_TEXT='Invalid username! It should not contain ; and it shoult be between 4-30 characters.';
		     ELSE
				IF not p_email regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$' then
		           SIGNAL SQLSTATE '20103'
					       SET MESSAGE_TEXT='Invalid email!';
		      ELSE 
				 IF length(p_user_password) < 6 OR instr(p_user_password,';') > 0 THEN
		         SIGNAL SQLSTATE '20104'
					       SET MESSAGE_TEXT='Invalid password! It should not contain ; and it shoult not be shorter then 6 characters.';
		       ELSE
		        INSERT INTO users_profile VALUES(v_user_id, p_name, p_surname, p_username, p_email, p_user_password);
		      END IF;
		     END IF;
		    END IF;
		   END IF;
		  END IF;
	   END IF;
	  END IF;
    END//
DELIMITER ;


-- Dumping structure for procedure funweb.update_user
DROP PROCEDURE IF EXISTS `update_user`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`( IN p_user_id INT, IN p_name VARCHAR(30), IN p_surname VARCHAR(30), IN p_username VARCHAR(30), IN p_email VARCHAR(100), IN p_user_password VARCHAR(100) )
BEGIN
	       DECLARE v_count INT;
	       SELECT COUNT(user_id) INTO v_count FROM users_profile WHERE user_id=p_user_id;
	       IF (v_count = 0) THEN 
          		SIGNAL SQLSTATE '20108'
	             		SET MESSAGE_TEXT='Invalid user_id! Try again!';
	       ELSE
	            IF (p_name IS NOT NULL ) THEN
			            IF not p_name regexp '^[a-zA-Z-]+$' then
			                   SIGNAL SQLSTATE '20109'
				                    SET MESSAGE_TEXT='Invalid characters in name! It should contain only letters and -.';
			            ELSE
			                   UPDATE users_profile SET name = p_name WHERE user_id=p_user_id;
			            END IF;
               END IF;
               
              IF (p_surname IS NOT NULL ) THEN
		              IF not p_surname regexp '^[a-zA-Z-]+$' then
		                  SIGNAL SQLSTATE '20110'
			                    SET MESSAGE_TEXT='Invalid characters in surname! It should contain only letters and -.';
		              ELSE
		                  UPDATE users_profile SET surname = p_surname WHERE user_id=p_user_id;
		              END IF;
             END IF;
             
             IF (p_username IS NOT NULL) THEN
		              IF instr(p_username,';') > 0 OR length(p_username) > 30 OR length(p_username) < 4  THEN 
		                   SIGNAL SQLSTATE '20111'
			                    SET MESSAGE_TEXT='Invalid username! It should not contain ; and it shoult be between 4-30 characters.';
		              ELSE
		                   UPDATE users_profile SET username = p_username WHERE user_id=p_user_id;
		              END IF;
            END IF;
            
            IF (p_email IS NOT NULL) THEN
		             IF not p_email regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$' then
		                   SIGNAL SQLSTATE '20112'
			                   SET MESSAGE_TEXT='Invalid email!';
		             ELSE
		               UPDATE users_profile SET email = p_email WHERE user_id=p_user_id;
		             END IF;
            END IF;
            
            IF (p_user_password IS NOT NULL) THEN
		            IF length(p_user_password) < 6 OR instr(p_user_password,';') > 0 THEN
		                  SIGNAL SQLSTATE '20113'
			                   SET MESSAGE_TEXT='Invalid password! It should not contain ; and it shoult not be shorter then 6 characters.';
		            ELSE
		              UPDATE users_profile SET user_password = p_user_password WHERE user_id=p_user_id;
		            END IF;
            END IF;
          
	       END IF;
	END//
DELIMITER ;


-- Dumping structure for trigger funweb.insert_user
DROP TRIGGER IF EXISTS `insert_user`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `insert_user` AFTER INSERT ON `users_profile` FOR EACH ROW INSERT INTO users_status(user_id) VALUES(NEW.user_id)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
