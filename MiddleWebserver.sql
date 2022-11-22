-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 13, 2022 at 03:34 PM
-- Server version: 10.5.13-MariaDB-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xs958314_yugyosen`
--

-- --------------------------------------------------------

--
-- Table structure for table `boats`
--

CREATE TABLE IF NOT EXISTS `boats` (
  `id` bigint(20) unsigned NOT NULL,
  `lender_id` bigint(20) unsigned NOT NULL,
  `boat_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '船名',
  `boat_name_kana` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '船名(かな)',
  `fishing_area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '対応エリア',
  `capacity` int(11) NOT NULL COMMENT '最大定員',
  `departure` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出航時間',
  `fishing_point` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '釣り座',
  `tackle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '貸タックル',
  `length` int(11) DEFAULT NULL COMMENT '全長',
  `weight` int(11) DEFAULT NULL COMMENT '重量',
  `caption_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '船長コメント',
  `boat_img_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '船画像',
  `boat_img_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '船画像',
  `boat_img_3` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '船画像',
  `boat_img_4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '船画像',
  `boat_img_5` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '船画像',
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boats`
--

INSERT INTO `boats` (`id`, `lender_id`, `boat_name`, `boat_name_kana`, `fishing_area`, `capacity`, `departure`, `fishing_point`, `tackle`, `length`, `weight`, `caption_comment`, `boat_img_1`, `boat_img_2`, `boat_img_3`, `boat_img_4`, `boat_img_5`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '旭鱗丸', 'きょくりんまる', '漁港から30分', 21, 'テスト', 'テスト釣り座', 'テスト', NULL, NULL, 'はじめまして。よろしくお願いします！はじめまして。よろしくお願いいたします。はじめまして。よろしくお願いします！はじめまして。よろしくお願いいたします。', '/storage/images/boat/202219518i25_4636504_s.jpg', NULL, NULL, NULL, NULL, 2, 2, '2022-08-12 09:19:32', '2022-08-13 06:12:46', NULL),
(2, 2, '幌岩丸', 'ほろいわまる', 'オホーツク海', 14, '5:30', '船長の指定', NULL, NULL, NULL, NULL, '/storage/images/boat/202210519i13_4636504_s.jpg', NULL, NULL, NULL, NULL, 2, 2, '2022-08-12 10:10:18', '2022-08-12 10:10:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `boat_by_facilities`
--

CREATE TABLE IF NOT EXISTS `boat_by_facilities` (
  `id` bigint(20) unsigned NOT NULL,
  `boat_id` bigint(20) unsigned NOT NULL,
  `facility_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_by_facilities`
--

INSERT INTO `boat_by_facilities` (`id`, `boat_id`, `facility_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(3, 2, 1, NULL, NULL, NULL),
(4, 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `boat_by_fishing_options`
--

CREATE TABLE IF NOT EXISTS `boat_by_fishing_options` (
  `id` bigint(20) unsigned NOT NULL,
  `boat_id` bigint(20) unsigned NOT NULL,
  `fishing_option_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_by_fishing_options`
--

INSERT INTO `boat_by_fishing_options` (`id`, `boat_id`, `fishing_option_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5, NULL, NULL, NULL),
(2, 2, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `boat_by_operations`
--

CREATE TABLE IF NOT EXISTS `boat_by_operations` (
  `id` bigint(20) unsigned NOT NULL,
  `boat_id` bigint(20) unsigned NOT NULL,
  `operation_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_by_operations`
--

INSERT INTO `boat_by_operations` (`id`, `boat_id`, `operation_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(3, 2, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `boat_by_targets`
--

CREATE TABLE IF NOT EXISTS `boat_by_targets` (
  `id` bigint(20) unsigned NOT NULL,
  `boat_id` bigint(20) unsigned NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `season_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boat_by_targets`
--

INSERT INTO `boat_by_targets` (`id`, `boat_id`, `target_id`, `season_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, NULL, NULL, NULL),
(2, 1, 2, 2, NULL, NULL, NULL),
(3, 1, 1, 3, NULL, NULL, NULL),
(4, 1, 3, 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) unsigned NOT NULL,
  `prefecture_id` bigint(20) unsigned NOT NULL,
  `city_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_name_kana` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_param` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `prefecture_id`, `city_name`, `city_name_kana`, `url_param`, `comment`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '函館市', 'はこだてし', 'c0002', NULL, NULL, 2, '2022-07-06 05:46:22', '2022-07-06 05:46:22', NULL),
(2, 1, '旭川市', 'あさひかわし', 'c0004', NULL, NULL, 2, '2022-07-06 05:47:23', '2022-07-06 05:47:23', NULL),
(3, 1, '佐呂間町', 'さろまちょう', 'c0129', NULL, NULL, 2, '2022-07-06 05:50:39', '2022-07-06 05:50:39', NULL),
(4, 1, '北見市', 'きたみし', 'c0008', NULL, NULL, 2, '2022-07-06 05:51:45', '2022-07-06 05:51:45', NULL),
(5, 1, '網走市', 'あばしりし', 'c0011', NULL, NULL, 2, '2022-07-06 05:55:30', '2022-07-06 05:55:30', NULL),
(6, 1, '大空町', 'おおぞらちょう', 'c0136', NULL, NULL, 2, '2022-07-06 05:58:02', '2022-07-06 05:58:02', NULL),
(7, 1, '斜里町', 'しゃりちょう', 'c0124', NULL, NULL, 2, '2022-07-06 06:00:01', '2022-07-06 06:00:01', NULL),
(8, 1, '標津町', 'しべつちょう', 'c0178', NULL, NULL, 2, '2022-07-06 06:02:10', '2022-07-06 06:02:10', NULL),
(9, 1, '厚岸町', 'あっけしちょう', 'c0170', NULL, NULL, 2, '2022-07-06 06:04:31', '2022-07-06 06:04:31', NULL),
(10, 1, '釧路市', 'くしろし', 'c0006', NULL, NULL, 2, '2022-07-06 06:05:35', '2022-07-06 06:05:35', NULL),
(11, 1, '白糠町', 'しらぬかちょう', 'c0175', NULL, NULL, 2, '2022-07-06 06:07:14', '2022-07-06 06:07:14', NULL),
(12, 1, '豊頃町', 'とよころちょう', 'c0164', NULL, NULL, 2, '2022-07-06 06:08:37', '2022-07-06 06:08:37', NULL),
(13, 1, '新ひだか町', 'しんひだかちょう', 'c0150', NULL, NULL, 2, '2022-07-06 06:10:16', '2022-07-06 06:10:16', NULL),
(14, 1, '苫小牧市', 'とまこまいし', 'c0013', NULL, NULL, 2, '2022-07-06 06:11:23', '2022-07-06 06:11:23', NULL),
(15, 1, '白老町', 'しらおいちょう', 'c0139', NULL, NULL, 2, '2022-07-06 06:12:32', '2022-07-06 06:12:32', NULL),
(16, 1, '室蘭市', 'むろらんし', 'c0005', NULL, NULL, 2, '2022-07-06 06:13:43', '2022-07-06 06:13:43', NULL),
(17, 1, '石狩市', 'いしかりし', 'c0034', NULL, NULL, 2, '2022-07-06 06:15:03', '2022-07-06 06:15:03', NULL),
(18, 1, '積丹町', 'しゃこたんちょう', 'c0068', NULL, NULL, 2, '2022-07-06 06:16:38', '2022-07-06 06:16:38', NULL),
(19, 1, '紋別市', 'もんべつし', 'c0019', NULL, NULL, 2, '2022-07-06 06:18:03', '2022-07-06 06:18:03', NULL),
(20, 2, '東通村', 'ひがしどおりむら', 'c0217', NULL, NULL, 2, '2022-07-06 06:20:08', '2022-07-06 06:20:08', NULL),
(21, 2, '横浜町', 'よこはままち', 'c0212', NULL, NULL, 2, '2022-07-06 06:21:47', '2022-07-06 06:21:47', NULL),
(22, 2, '三沢市', 'みさわし', 'c0192', NULL, NULL, 2, '2022-07-06 06:22:36', '2022-07-06 06:22:36', NULL),
(23, 2, '八戸市', 'はちのへし', 'c0188', NULL, NULL, 2, '2022-07-06 06:23:26', '2022-07-06 06:23:26', NULL),
(24, 2, '階上町', 'はしかみちょう', 'c0224', NULL, NULL, 2, '2022-07-06 06:24:24', '2022-07-06 06:24:24', NULL),
(25, 2, '平内町', 'へいないまち', 'c0196', NULL, NULL, 2, '2022-07-06 06:25:41', '2022-07-06 06:25:41', NULL),
(26, 2, '青森市', 'あおもりし', 'c0186', NULL, NULL, 2, '2022-07-06 06:26:54', '2022-08-01 05:15:10', NULL),
(27, 2, '外ヶ浜町', 'そとがはままち', 'c0199', NULL, NULL, 2, '2022-07-06 06:28:33', '2022-07-06 06:28:33', NULL),
(28, 2, '今別町', 'いまべつまち', 'c0197', NULL, NULL, 2, '2022-07-06 06:29:37', '2022-07-06 06:29:37', NULL),
(29, 2, '中泊町', 'なかどまりまち', 'c0208', NULL, NULL, 2, '2022-07-06 06:31:10', '2022-07-06 06:31:10', NULL),
(30, 2, '五所川原市', 'ごしょがわらし', 'c0190', NULL, NULL, 2, '2022-07-06 06:32:33', '2022-07-06 06:32:33', NULL),
(31, 2, '鰺ヶ沢町', 'あじがさわまち', 'c0200', NULL, NULL, 2, '2022-07-06 06:35:01', '2022-07-06 06:35:01', NULL),
(32, 2, '深浦町', 'ふかうらまち', 'c0201', NULL, NULL, 2, '2022-07-06 06:36:43', '2022-07-06 06:36:43', NULL),
(33, 3, '宮古市', 'みやこし', 'c0227', NULL, NULL, 2, '2022-07-06 06:37:43', '2022-07-06 06:37:43', NULL),
(34, 3, '山田町', 'やまだまち', 'c0250', NULL, NULL, 2, '2022-07-06 06:38:54', '2022-07-06 06:38:54', NULL),
(35, 3, '釜石市', 'かまいしし', 'c0235', NULL, NULL, 2, '2022-07-06 06:39:48', '2022-07-06 06:39:48', NULL),
(36, 3, '大船渡市', 'おおふなとし', 'c0228', NULL, NULL, 2, '2022-07-06 06:41:38', '2022-07-06 06:41:38', NULL),
(37, 5, '能代市', 'のしろし', 'c0295', NULL, NULL, 2, '2022-07-06 06:42:47', '2022-07-06 06:42:47', NULL),
(38, 5, '男鹿市', 'おがし', 'c0298', NULL, NULL, 2, '2022-07-06 06:43:52', '2022-07-06 06:43:52', NULL),
(39, 5, '秋田市', 'あきたし', 'c0294', NULL, NULL, 2, '2022-07-06 06:44:59', '2022-07-06 06:44:59', NULL),
(40, 5, '由利本荘市', 'ゆりほんじょうし', 'c0301', NULL, NULL, 2, '2022-07-06 06:46:00', '2022-07-06 06:46:00', NULL),
(41, 5, 'にかほ市', 'にかほし', 'c0305', NULL, NULL, 2, '2022-07-06 06:46:55', '2022-07-06 06:46:55', NULL),
(42, 6, '遊佐町', 'ゆざまち', 'c0353', NULL, NULL, 2, '2022-07-06 06:50:57', '2022-07-06 06:50:57', NULL),
(43, 6, '酒田市', 'さかたし', 'c0322', NULL, NULL, 2, '2022-07-06 06:51:49', '2022-07-06 06:51:49', NULL),
(44, 4, '気仙沼市', 'けせんぬまし', 'c0262', NULL, NULL, 2, '2022-07-06 06:52:59', '2022-07-06 06:52:59', NULL),
(45, 4, '南三陸町', 'みなみさんりくちょう', 'c0293', NULL, NULL, 2, '2022-07-06 06:54:02', '2022-07-06 06:54:02', NULL),
(46, 4, '石巻市', 'いしのまきし', 'c0260', NULL, NULL, 2, '2022-07-06 06:54:59', '2022-07-06 06:54:59', NULL),
(47, 4, '東松島市', 'ひがしまつしまし', 'c0270', NULL, NULL, 2, '2022-07-06 06:56:26', '2022-07-06 06:56:26', NULL),
(48, 4, '塩竈市', 'しおがまし', 'c0261', NULL, NULL, 2, '2022-07-06 06:57:27', '2022-07-06 06:57:27', NULL),
(49, 4, '多賀城市', 'たがじょうし', 'c0266', NULL, NULL, 2, '2022-07-06 06:58:38', '2022-07-06 06:58:38', NULL),
(50, 4, '七ヶ浜町', 'しちがはままち', 'c0283', NULL, NULL, 2, '2022-07-06 07:00:09', '2022-07-06 07:00:09', NULL),
(51, 4, '仙台市', 'せんだいし', 'c0259', NULL, NULL, 2, '2022-07-06 07:00:58', '2022-07-06 07:00:58', NULL),
(52, 4, '名取市', 'なとりし', 'c0264', NULL, NULL, 2, '2022-07-06 07:02:08', '2022-07-06 07:02:08', NULL),
(53, 4, '亘理町', 'わたりちょう', 'c0280', NULL, NULL, 2, '2022-07-06 07:03:10', '2022-07-06 07:03:10', NULL),
(54, 4, '岩沼市', 'いわぬまし', 'c0267', NULL, NULL, 2, '2022-07-06 07:04:09', '2022-07-06 07:04:09', NULL),
(55, 7, 'いわき市', 'いわきし', 'c0357', NULL, NULL, 2, '2022-07-06 07:10:23', '2022-07-06 07:10:23', NULL),
(56, 8, '北茨城市', 'きたいばらきし', 'c0424', NULL, NULL, 2, '2022-07-06 07:12:08', '2022-07-06 07:12:08', NULL),
(57, 8, '日立市', 'ひたちし', 'c0414', NULL, NULL, 2, '2022-07-06 07:13:13', '2022-07-06 07:13:13', NULL),
(58, 8, 'ひたちなか市', 'ひたちなかし', 'c0429', NULL, NULL, 2, '2022-07-06 07:14:49', '2022-07-06 07:14:49', NULL),
(59, 8, '大洗町', 'おおあらいまち', 'c0446', NULL, NULL, 2, '2022-07-06 07:16:38', '2022-07-06 07:16:38', NULL),
(60, 8, '鹿嶋市', 'かしまし', 'c0430', NULL, NULL, 2, '2022-07-06 07:17:43', '2022-07-06 07:17:43', NULL),
(61, 8, '神栖市', 'かみすし', 'c0440', NULL, NULL, 2, '2022-07-06 07:18:38', '2022-07-06 07:18:38', NULL),
(62, 11, '戸田市', 'とだし', 'c0537', NULL, NULL, 2, '2022-07-06 07:19:36', '2022-07-06 07:19:36', NULL),
(63, 14, '横浜市', 'よこはまし', 'c0696', NULL, NULL, 2, '2022-07-06 07:20:31', '2022-07-06 07:20:31', NULL),
(64, 14, '横須賀市', 'よこすかし', 'c0699', NULL, NULL, 2, '2022-07-06 07:21:38', '2022-07-06 07:21:38', NULL),
(65, 14, '三浦市', 'みうらし', 'c0706', NULL, NULL, 2, '2022-07-06 07:22:36', '2022-07-06 07:22:36', NULL),
(66, 14, '葉山町', 'はやままち', 'c0715', NULL, NULL, 2, '2022-07-06 07:24:11', '2022-07-06 07:24:11', NULL),
(67, 14, '鎌倉市', 'かまくらし', 'c0701', NULL, NULL, 2, '2022-07-06 07:25:23', '2022-07-06 07:25:23', NULL),
(68, 14, '藤沢市', 'ふじさわし', 'c0702', NULL, NULL, 2, '2022-07-06 07:26:27', '2022-07-06 07:26:27', NULL),
(69, 14, '茅ヶ崎市', 'ちがさきし', 'c0704', NULL, NULL, 2, '2022-07-06 07:27:32', '2022-07-06 07:27:32', NULL),
(70, 14, '平塚市', 'ひらつかし', 'c0700', NULL, NULL, 2, '2022-07-06 07:28:34', '2022-07-06 07:28:34', NULL),
(71, 14, '小田原市', 'おだわらし', 'c0703', NULL, NULL, 2, '2022-07-06 07:29:36', '2022-07-06 07:29:36', NULL),
(72, 14, '真鶴町', 'まなづるまち', 'c0725', NULL, NULL, 2, '2022-07-06 07:30:35', '2022-07-06 07:30:35', NULL),
(73, 14, '湯河原町', 'ゆがわらまち', 'c0726', NULL, NULL, 2, '2022-07-06 07:31:50', '2022-07-06 07:31:50', NULL),
(74, 13, '足立区', 'あだちく', 'c0654', NULL, NULL, 2, '2022-07-06 07:34:15', '2022-07-06 07:34:15', NULL),
(75, 13, '葛飾区', 'かつしかく', 'c0655', NULL, NULL, 2, '2022-07-06 07:40:53', '2022-07-06 07:40:53', NULL),
(76, 13, '江戸川区', 'えどがわく', 'c0656', NULL, NULL, 2, '2022-07-06 07:41:45', '2022-07-06 07:41:45', NULL),
(77, 13, '江東区', 'こうとうく', 'c0641', NULL, NULL, 2, '2022-07-06 07:42:53', '2022-07-06 07:42:53', NULL),
(78, 13, '中央区', 'ちゅうおうく', 'c0635', NULL, NULL, 2, '2022-07-06 07:43:57', '2022-07-06 07:43:57', NULL),
(79, 13, '品川区', 'しながわく', 'c0642', NULL, NULL, 2, '2022-07-06 07:44:48', '2022-07-06 07:44:48', NULL),
(80, 13, '大田区', 'おおたく', 'c0644', NULL, NULL, 2, '2022-07-06 07:45:24', '2022-07-06 07:45:24', NULL),
(81, 12, '浦安市', 'うらやすし', 'c0604', NULL, NULL, 2, '2022-07-06 07:46:34', '2022-07-06 07:46:34', NULL),
(82, 12, '市川市', 'いちかわし', 'c0582', NULL, NULL, 2, '2022-07-06 07:48:00', '2022-07-06 07:48:00', NULL),
(83, 12, '船橋市', 'ふなばしし', 'c0583', NULL, NULL, 2, '2022-07-06 07:48:46', '2022-07-06 07:48:46', NULL),
(84, 12, '木更津市', 'きさらづし', 'c0585', NULL, NULL, 2, '2022-07-06 07:52:53', '2022-07-06 07:52:53', NULL),
(85, 12, '富津市', 'ふっつし', 'c0603', NULL, NULL, 2, '2022-07-06 07:53:42', '2022-07-06 07:53:42', NULL),
(86, 12, '鋸南町', 'きょなんまち', 'c0633', NULL, NULL, 2, '2022-07-06 07:57:32', '2022-07-06 07:57:32', NULL),
(87, 12, '南房総市', 'みなみぼうそうし', 'c0611', NULL, NULL, 2, '2022-07-06 07:58:54', '2022-07-06 07:58:54', NULL),
(88, 12, '館山市', 'たてやまし', 'c0584', NULL, NULL, 2, '2022-07-06 07:59:44', '2022-07-06 07:59:44', NULL),
(89, 12, '鴨川市', 'かもがわし', 'c0600', NULL, NULL, 2, '2022-07-06 08:02:13', '2022-07-06 08:02:13', NULL),
(90, 12, '勝浦市', 'かつうらし', 'c0595', NULL, NULL, 2, '2022-07-06 08:03:07', '2022-07-06 08:03:07', NULL),
(91, 12, '御宿町', 'おんじゅくまち', 'c0632', NULL, NULL, 2, '2022-07-06 08:04:15', '2022-07-06 08:04:15', NULL),
(92, 12, 'いすみ市', 'いすみし', 'c0615', NULL, NULL, 2, '2022-07-06 08:05:15', '2022-07-06 08:05:15', NULL),
(93, 12, '九十九里町', 'くじゅうくりまち', 'c0622', NULL, NULL, 2, '2022-07-06 08:07:20', '2022-07-06 08:07:20', NULL),
(94, 12, '旭市', 'あさひし', 'c0592', NULL, NULL, 2, '2022-07-06 08:10:16', '2022-07-06 08:10:16', NULL),
(95, 12, '銚子市', 'ちょうしし', 'c0581', NULL, NULL, 2, '2022-07-06 08:11:34', '2022-07-06 08:11:34', NULL),
(96, 15, '村上市', 'むらかみし', 'c0738', NULL, NULL, 2, '2022-07-06 08:28:13', '2022-07-06 08:28:13', NULL),
(97, 15, '長岡市', 'ながおかし', 'c0730', NULL, NULL, 2, '2022-07-06 08:28:57', '2022-07-06 08:28:57', NULL),
(98, 16, '入善町', 'にゅうぜんまち', 'c0772', NULL, NULL, 2, '2022-07-06 08:30:13', '2022-07-06 08:30:13', NULL),
(99, 18, '坂井市', 'さかいし', 'c0801', NULL, NULL, 2, '2022-07-06 08:31:47', '2022-07-06 08:31:47', NULL),
(100, 18, '福井市', 'ふくいし', 'c0793', NULL, NULL, 2, '2022-07-06 08:32:42', '2022-07-06 08:32:42', NULL),
(101, 18, '越前町', 'えちぜんちょう', 'c0805', NULL, NULL, 2, '2022-07-06 08:33:50', '2022-07-06 08:33:50', NULL),
(102, 18, '敦賀市', 'つるがし', 'c0794', NULL, NULL, 2, '2022-07-06 08:34:40', '2022-07-06 08:34:40', NULL),
(103, 18, '美浜町', 'みはまちょう', 'c0806', NULL, NULL, 2, '2022-07-06 08:35:51', '2022-07-06 08:35:51', NULL),
(104, 18, '小浜市', 'おばまし', 'c0795', NULL, NULL, 2, '2022-07-06 08:37:25', '2022-07-06 08:37:25', NULL),
(105, 18, '高浜町', 'たかはまちょう', 'c0807', NULL, NULL, 2, '2022-07-06 08:38:35', '2022-07-06 08:38:35', NULL),
(106, 22, '熱海市', 'あたみし', 'c0959', NULL, NULL, 2, '2022-07-06 08:40:19', '2022-07-06 08:40:19', NULL),
(107, 22, '伊東市', 'いとうし', 'c0962', NULL, NULL, 2, '2022-07-06 08:41:51', '2022-07-06 08:41:51', NULL),
(108, 22, '下田市', 'しもだし', 'c0971', NULL, NULL, 2, '2022-07-06 08:42:57', '2022-07-06 08:42:57', NULL),
(109, 22, '南伊豆町', 'みなみいずちょう', 'c0981', NULL, NULL, 2, '2022-07-06 08:44:08', '2022-07-06 08:44:08', NULL),
(110, 22, '松崎町', 'まつざきちょう', 'c0982', NULL, NULL, 2, '2022-07-06 08:45:14', '2022-07-06 08:45:14', NULL),
(111, 22, '伊豆市', 'いずし', 'c0974', NULL, NULL, 2, '2022-07-06 08:45:52', '2022-07-06 08:45:52', NULL),
(112, 22, '沼津市', 'ぬまづし', 'c0958', NULL, NULL, 2, '2022-07-06 08:47:22', '2022-07-06 08:47:22', NULL),
(113, 22, '富士市', 'ふじし', 'c0964', NULL, NULL, 2, '2022-07-06 08:48:25', '2022-07-06 08:48:25', NULL),
(114, 22, '静岡市', 'しずおかし', 'c0956', NULL, NULL, 2, '2022-07-06 08:50:08', '2022-07-06 08:50:08', NULL),
(115, 22, '焼津市', 'やいづし', 'c0966', NULL, NULL, 2, '2022-07-06 08:51:02', '2022-07-06 08:51:02', NULL),
(116, 22, '牧之原市', 'まきのはらし', 'c0978', NULL, NULL, 2, '2022-07-06 08:52:22', '2022-07-06 08:52:22', NULL),
(117, 22, '御前崎市', 'おまえざきし', 'c0975', NULL, NULL, 2, '2022-07-06 08:53:13', '2022-07-06 08:53:13', NULL),
(118, 22, '袋井市', 'ふくろいし', 'c0970', NULL, NULL, 2, '2022-07-06 08:54:00', '2022-07-06 08:54:00', NULL),
(119, 23, '蒲郡市', 'がまごおりし', 'c1005', NULL, NULL, 2, '2022-07-06 08:56:09', '2022-07-06 08:56:09', NULL),
(120, 23, '南知多町', 'みなみちたちょう', 'c1038', NULL, NULL, 2, '2022-07-06 08:57:08', '2022-07-06 08:57:08', NULL),
(121, 24, '鳥羽市', 'とばし', 'c1054', NULL, NULL, 2, '2022-07-06 08:59:35', '2022-07-06 08:59:35', NULL),
(122, 24, '志摩市', 'しまし', 'c1057', NULL, NULL, 2, '2022-07-06 09:00:22', '2022-07-06 09:00:22', NULL),
(123, 26, '宮津市', 'みやづし', 'c1098', NULL, NULL, 2, '2022-07-06 09:01:23', '2022-07-06 09:01:23', NULL),
(124, 26, '伊根町', 'いねちょう', 'c1117', NULL, NULL, 2, '2022-07-06 09:02:16', '2022-07-06 09:02:16', NULL),
(125, 26, '京丹後市', 'きょうたんごし', 'c1105', NULL, NULL, 2, '2022-07-06 09:03:28', '2022-07-06 09:03:28', NULL),
(126, 27, '大阪市', 'おおさかし', 'c1119', NULL, NULL, 2, '2022-07-06 09:04:07', '2022-07-06 09:04:07', NULL),
(127, 27, '岬町', 'みさきちょう', 'c1158', NULL, NULL, 2, '2022-07-06 09:05:02', '2022-07-06 09:05:02', NULL),
(128, 28, '姫路市', 'ひめじし', 'c1163', NULL, NULL, 2, '2022-07-06 09:05:57', '2022-07-06 09:05:57', NULL),
(129, 28, '高砂市', 'たかさごし', 'c1177', NULL, NULL, 2, '2022-07-06 09:06:41', '2022-07-06 09:06:41', NULL),
(130, 28, '播磨町', 'はりまちょう', 'c1194', NULL, NULL, 2, '2022-07-06 09:07:40', '2022-07-06 09:07:40', NULL),
(131, 28, '明石市', 'あかしし', 'c1165', NULL, NULL, 2, '2022-07-06 09:08:43', '2022-07-06 09:08:43', NULL),
(132, 28, '神戸市', 'こうべし', 'c1162', NULL, NULL, 2, '2022-07-06 09:09:32', '2022-07-06 09:09:32', NULL),
(133, 28, '南あわじ市', 'みなみあわじし', 'c1185', NULL, NULL, 2, '2022-07-06 09:10:21', '2022-07-06 09:10:21', NULL),
(134, 30, '串本町', 'くしもとちょう', 'c1271', NULL, NULL, 2, '2022-07-06 09:12:47', '2022-07-06 09:12:47', NULL),
(135, 30, 'すさみ町', 'すさみちょう', 'c1266', NULL, NULL, 2, '2022-07-06 09:13:32', '2022-07-06 09:13:32', NULL),
(136, 30, '白浜町', 'しらはまちょう', 'c1264', NULL, NULL, 2, '2022-07-06 09:14:18', '2022-07-06 09:14:18', NULL),
(137, 30, '印南町', 'いなみちょう', 'c1261', NULL, NULL, 2, '2022-07-06 09:15:06', '2022-07-06 09:15:06', NULL),
(138, 30, '由良町', 'ゆらちょう', 'c1260', NULL, NULL, 2, '2022-07-06 09:15:52', '2022-07-06 09:15:52', NULL),
(139, 30, '和歌山市', 'わかやまし', 'c1242', NULL, NULL, 2, '2022-07-06 09:17:03', '2022-07-06 09:17:03', NULL),
(140, 31, '岩美町', 'いわみちょう', 'c1276', NULL, NULL, 2, '2022-07-06 09:17:54', '2022-07-06 09:17:54', NULL),
(141, 31, '鳥取市', 'とっとりし', 'c1272', NULL, NULL, 2, '2022-07-06 09:18:28', '2022-07-06 09:18:28', NULL),
(142, 31, '大山町', 'だいせんちょう', 'c1285', NULL, NULL, 2, '2022-07-06 09:19:29', '2022-07-06 09:19:29', NULL),
(143, 34, '松江市', 'まつえし', 'c1291', NULL, NULL, 2, '2022-07-06 09:21:33', '2022-07-06 09:21:33', NULL),
(144, 34, '出雲市', 'いずもし', 'c1293', NULL, NULL, 2, '2022-07-06 09:22:10', '2022-07-06 09:22:10', NULL),
(145, 34, '浜田市', 'はまだし', 'c1292', NULL, NULL, 2, '2022-07-06 09:22:53', '2022-07-06 09:22:53', NULL),
(146, 35, '柳井市', 'やないし', 'c1369', NULL, NULL, 2, '2022-07-06 09:23:41', '2022-07-06 09:23:41', NULL),
(147, 36, '鳴門市', 'なるとし', 'c1380', NULL, NULL, 2, '2022-07-06 09:24:40', '2022-07-06 09:24:40', NULL),
(148, 39, '松山市', 'まつやまし', 'c1420', NULL, NULL, 2, '2022-07-06 09:25:31', '2022-07-06 09:25:31', NULL),
(149, 40, '北九州市', 'きたきゅうしゅうし', 'c1474', NULL, NULL, 2, '2022-07-06 09:26:13', '2022-07-06 09:26:13', NULL),
(150, 40, '苅田町', 'かんだまち', 'c1529', NULL, NULL, 2, '2022-07-06 09:27:02', '2022-07-06 09:27:02', NULL),
(151, 40, '宗像市', 'むなかたし', 'c1492', NULL, NULL, 2, '2022-07-06 09:27:57', '2022-07-06 09:27:57', NULL),
(152, 40, '福津市', 'ふくつし', 'c1495', NULL, NULL, 2, '2022-07-06 09:28:43', '2022-07-06 09:28:43', NULL),
(153, 40, '福岡市', 'ふくおかし', 'c1475', NULL, NULL, 2, '2022-07-06 09:29:42', '2022-07-06 09:29:42', NULL),
(154, 40, '糸島市', 'いとしまし', 'c1501', NULL, NULL, 2, '2022-07-06 09:30:09', '2022-07-06 09:30:09', NULL),
(155, 41, '唐津市', 'からつし', 'c1535', NULL, NULL, 2, '2022-07-06 09:30:39', '2022-07-06 09:30:39', NULL),
(156, 42, '松浦市', 'まつうらし', 'c1560', NULL, NULL, 2, '2022-07-06 09:31:33', '2022-07-06 09:31:33', NULL),
(157, 41, '伊万里市', 'いまりし', 'c1538', NULL, NULL, 2, '2022-07-06 09:32:27', '2022-07-06 09:32:27', NULL),
(158, 42, '平戸市', 'ひらどし', 'c1559', NULL, NULL, 2, '2022-07-06 09:33:06', '2022-07-06 09:33:06', NULL),
(159, 43, '杵築市', 'きつきし', 'c1629', NULL, NULL, 2, '2022-07-06 09:34:03', '2022-07-06 09:34:03', NULL),
(160, 43, '別府市', 'べっぷし', 'c1621', NULL, NULL, 2, '2022-07-06 09:34:34', '2022-07-06 09:34:34', NULL),
(161, 43, '大分市', 'おおいたし', 'c1620', NULL, NULL, 2, '2022-07-06 09:35:06', '2022-07-06 09:35:06', NULL),
(162, 44, '玉名市', 'たまなし', 'c1580', NULL, NULL, 2, '2022-07-06 09:35:40', '2022-07-06 09:35:40', NULL),
(163, 44, '熊本市', 'くまもとし', 'c1575', NULL, NULL, 2, '2022-07-06 09:36:27', '2022-07-06 09:36:27', NULL),
(164, 44, '上天草市', 'かみあまくさし', 'c1584', NULL, NULL, 2, '2022-07-06 09:37:15', '2022-07-06 09:37:15', NULL),
(165, 46, '阿久根市', 'あくねし', 'c1667', NULL, NULL, 2, '2022-07-06 09:38:05', '2022-07-06 09:38:05', NULL),
(166, 46, '姶良市', 'あいらし', 'c1682', NULL, NULL, 2, '2022-07-06 09:38:56', '2022-07-06 09:38:56', NULL),
(167, 47, '宜野湾市', 'ぎのわんし', 'c1708', NULL, NULL, 2, '2022-07-06 09:39:50', '2022-07-06 09:39:50', NULL),
(169, 14, '川崎市', 'かわさきし', 'c0697', NULL, NULL, 2, '2022-08-04 07:15:18', '2022-08-04 07:15:33', NULL),
(170, 14, '逗子市', 'ずしし', 'c0705', NULL, NULL, 2, '2022-08-04 07:52:55', '2022-08-04 07:52:55', NULL),
(171, 22, '湖西市', 'こさいし', 'c0973', NULL, NULL, 2, '2022-08-09 12:12:42', '2022-08-09 12:12:42', NULL),
(172, 30, '湯浅町', 'ゆあさちょう', 'c1255', NULL, NULL, 2, '2022-08-09 14:44:41', '2022-08-09 14:44:41', NULL),
(173, 44, '宇城市', 'うきし', 'c1585', NULL, NULL, 2, '2022-08-10 10:28:34', '2022-08-10 10:28:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE IF NOT EXISTS `facilities` (
  `id` bigint(20) unsigned NOT NULL,
  `facility_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '船設備',
  `icon_img` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '設備アイコン',
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `facility_name`, `icon_img`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'トイレ', '/images/boatDetail/icon_toilet.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, 'キャビン', '/images/boatDetail/icon_cabin.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, 'イケス', '/images/boatDetail/icon_preserve.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(4, '電子レンジ', '/images/boatDetail/icon_microwave_oven.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(5, 'ポット', '/images/boatDetail/icon_pot.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(6, '電源12V', '/images/boatDetail/icon_power12.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(7, '電源24V', '/images/boatDetail/icon_power24.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(8, '電源100V', '/images/boatDetail/icon_power100.svg', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fishing_options`
--

CREATE TABLE IF NOT EXISTS `fishing_options` (
  `id` bigint(20) unsigned NOT NULL,
  `fishing_option_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fishing_options`
--

INSERT INTO `fishing_options` (`id`, `fishing_option_name`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '胴突き', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, 'コマセ(撒き餌)', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, 'ひとつテンヤ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(4, 'タイラバ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(5, 'ジギング', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(6, 'キャスティング', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(7, 'スロージギング', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(8, 'エギング＆テンヤ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(9, 'イカヅノ＆スッテ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(10, '落とし込み釣り', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(11, '泳がせ釣り', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(12, '天びん', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(13, '五目釣り', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(14, 'イカダ・カセ釣り', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(15, '船サビキ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lenders`
--

CREATE TABLE IF NOT EXISTS `lenders` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `member_type_id` bigint(20) unsigned NOT NULL COMMENT '表示箇所',
  `zip_code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '郵便番号',
  `prefecture_id` bigint(20) unsigned NOT NULL COMMENT '都道府県',
  `city_id` bigint(20) unsigned NOT NULL COMMENT '市町村',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所番地',
  `port_id` bigint(20) unsigned NOT NULL COMMENT '港',
  `map_url` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'googleMap',
  `access_example` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'アクセス説明',
  `phone` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電話番号',
  `hp_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ホームページ',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '料金',
  `parking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '駐車場',
  `permission_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '許可証',
  `boat_number` int(11) NOT NULL,
  `other` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lenders`
--

INSERT INTO `lenders` (`id`, `user_id`, `member_type_id`, `zip_code`, `prefecture_id`, `city_id`, `address`, `port_id`, `map_url`, `access_example`, `phone`, `hp_url`, `price`, `parking`, `permission_img`, `boat_number`, `other`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, '070-8016', 1, 2, '神居六条16-6-6', 1, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2882.02667559947!2d142.331801315501!3d43.751542829118094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5f0ce8bcb8583e7d%3A0x9c0f8a10c1ca7b85!2z44CSMDcwLTgwMTYg5YyX5rW36YGT5pet5bed5biC56We5bGF77yW5p2h77yR77yW5LiB55uu77yW!5e0!3m2!1sja!2sjp!4v1660295895906!5m2!1sja!2sjp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', NULL, '090-3119-5738', 'http://www.shakotan-net.com/cgi-bin/kyokurin/imgboard.cgi', 'テスト', 'テスト', NULL, 1, 'テスト', 2, 2, '2022-08-12 09:19:32', '2022-08-12 09:19:32', NULL),
(2, 4, 2, '093-0422', 1, 4, '幌岩1-12', 2, NULL, 'テスト', '090-5223-3614', 'http://karei.game.coocan.jp/', 'カレイ８０００円 その他 １００００円', 'テスト', NULL, 1, '仮眠施設あり', 2, 2, '2022-08-12 10:10:18', '2022-08-12 10:10:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lender_by_payment_options`
--

CREATE TABLE IF NOT EXISTS `lender_by_payment_options` (
  `id` bigint(20) unsigned NOT NULL,
  `lender_id` bigint(20) unsigned NOT NULL,
  `payment_option_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lender_by_payment_options`
--

INSERT INTO `lender_by_payment_options` (`id`, `lender_id`, `payment_option_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lender_posts`
--

CREATE TABLE IF NOT EXISTS `lender_posts` (
  `id` bigint(20) unsigned NOT NULL,
  `lender_id` bigint(20) unsigned NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_img_1` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_img_2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_3` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_5` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_img_6` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lender_post_by_fishing_options`
--

CREATE TABLE IF NOT EXISTS `lender_post_by_fishing_options` (
  `id` bigint(20) unsigned NOT NULL,
  `lender_post_id` bigint(20) unsigned NOT NULL,
  `fishing_option_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lender_post_by_targets`
--

CREATE TABLE IF NOT EXISTS `lender_post_by_targets` (
  `id` bigint(20) unsigned NOT NULL,
  `lender_post_id` bigint(20) unsigned NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_types`
--

CREATE TABLE IF NOT EXISTS `member_types` (
  `id` bigint(20) unsigned NOT NULL,
  `member_type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_types`
--

INSERT INTO `member_types` (`id`, `member_type_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '有料会員', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, '無料会員', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, '一般非会員', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_02_08_000618_create_roles_table', 1),
(3, '2022_02_08_000619_create_payment_options_table', 1),
(4, '2022_02_08_000620_create_member_types_table', 1),
(5, '2022_02_08_000724_create_users_table', 1),
(6, '2022_02_08_000830_create_regions_table', 1),
(7, '2022_02_08_000930_create_prefectures_table', 1),
(8, '2022_02_08_000944_create_cities_table', 1),
(9, '2022_02_08_000958_create_ports_table', 1),
(10, '2022_02_08_001049_create_operations_table', 1),
(11, '2022_02_08_001103_create_fishing_options_table', 1),
(12, '2022_02_08_001113_create_facilities_table', 1),
(13, '2022_02_08_001305_create_targets_table', 1),
(14, '2022_02_08_001409_create_lenders_table', 1),
(15, '2022_02_08_001441_create_boats_table', 1),
(16, '2022_02_08_001507_create_lender_posts_table', 1),
(17, '2022_02_08_114024_create_boat_by_operations_table', 1),
(18, '2022_02_08_202827_create_boat_by_fishing_options_table', 1),
(19, '2022_02_08_203016_create_boat_by_facilities_table', 1),
(20, '2022_02_08_203113_create_boat_by_targets_table', 1),
(21, '2022_02_09_203630_create_lender_by_payment_options_table', 1),
(22, '2022_02_09_203702_create_lender_post_by_fishing_options_table', 1),
(23, '2022_02_09_203729_create_lender_post_by_targets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE IF NOT EXISTS `operations` (
  `id` bigint(20) unsigned NOT NULL,
  `operation_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '業種名',
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `operation_name`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '乗合', NULL, NULL, NULL, NULL, NULL),
(2, '仕立て(チャーター)', NULL, NULL, NULL, NULL, NULL),
(3, '渡船(瀬渡し,イカダ)', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_options`
--

CREATE TABLE IF NOT EXISTS `payment_options` (
  `id` bigint(20) unsigned NOT NULL,
  `payment_option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_options`
--

INSERT INTO `payment_options` (`id`, `payment_option_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '現金(前払い)', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, '現金(後払い)', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, 'VISA', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(4, 'MASTER', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(5, 'JCB', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(6, 'AMEX', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(7, 'PayPay', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(8, 'QuickPay', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(9, 'LINE Pay', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(10, 'au PAY', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(11, 'd払い', '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(31, 'App\\Models\\User', 3, 'access-token', '28220a5bec4891d2f3b33e63bb62638ff351036c4b00264a65da0f99e9289700', '["*"]', '2022-08-12 09:42:39', '2022-08-12 09:22:38', '2022-08-12 09:42:39'),
(32, 'App\\Models\\User', 3, 'access-token', '1b36fd45bfc60e6d5f096f2b76562f2253bb8229875f29530ac6f660f596461b', '["*"]', '2022-08-12 09:47:27', '2022-08-12 09:47:12', '2022-08-12 09:47:27'),
(35, 'App\\Models\\User', 3, 'access-token', 'a89257643f3a68e5f04be5cb1c122282c737a72c0b66d001e18a0839345f6e8e', '["*"]', '2022-08-12 10:52:26', '2022-08-12 10:34:26', '2022-08-12 10:52:26'),
(36, 'App\\Models\\User', 2, 'access-token', '49d0e4fff58bb7f56b667831a9d51a821c56df61a8c2900d98f21b24735f4e36', '["*"]', '2022-08-12 11:56:15', '2022-08-12 11:55:18', '2022-08-12 11:56:15'),
(37, 'App\\Models\\User', 3, 'access-token', '0ce4ae40dfd5dee47580174d7c9dfe11a65e1481bd8059ac23d763a5f142592e', '["*"]', '2022-08-12 20:00:58', '2022-08-12 19:26:05', '2022-08-12 20:00:58'),
(38, 'App\\Models\\User', 2, 'access-token', '040fc551f199b844e753dd1645991b5b6ccb7fb065cf1b5bf979c761aed18e4e', '["*"]', '2022-08-13 06:12:46', '2022-08-13 06:10:43', '2022-08-13 06:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `ports`
--

CREATE TABLE IF NOT EXISTS `ports` (
  `id` bigint(20) unsigned NOT NULL,
  `city_id` bigint(20) unsigned NOT NULL,
  `port_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port_name_kana` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ports`
--

INSERT INTO `ports` (`id`, `city_id`, `port_name`, `port_name_kana`, `comment`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '頓別港', 'とんべつこう', NULL, 2, 2, '2022-08-01 04:37:39', '2022-08-01 04:37:39', NULL),
(2, 4, '常呂漁港', 'ところぎょこう', NULL, NULL, 2, '2022-08-01 04:39:47', '2022-08-01 04:44:36', NULL),
(3, 5, '能取新港', 'のとろしんこう', NULL, 2, 2, '2022-08-01 04:42:07', '2022-08-01 04:42:07', NULL),
(4, 5, '網走港', 'あばしりこう', NULL, 2, 2, '2022-08-01 04:45:47', '2022-08-01 04:45:47', NULL),
(5, 7, 'ウトロ港', 'うとろこう', NULL, 2, 2, '2022-08-01 04:47:37', '2022-08-01 04:47:37', NULL),
(6, 7, '知布泊港', 'ちっぷどまりこう', NULL, 2, 2, '2022-08-01 04:48:52', '2022-08-01 04:48:52', NULL),
(7, 8, '標津漁港', 'しべつぎょこう', NULL, 2, 2, '2022-08-01 04:49:53', '2022-08-01 04:49:53', NULL),
(8, 9, '厚岸港', 'あっけしこう', NULL, 2, 2, '2022-08-01 04:50:24', '2022-08-01 04:50:24', NULL),
(9, 10, '釧路東港', 'くしろひがしこう', NULL, 2, 2, '2022-08-01 04:51:53', '2022-08-01 04:51:53', NULL),
(10, 10, '釧路西港', 'くしろにしこう', NULL, 2, 2, '2022-08-01 04:52:23', '2022-08-01 04:52:23', NULL),
(11, 11, '白糠港', 'しらぬかこう', NULL, 2, 2, '2022-08-01 04:54:31', '2022-08-01 04:54:31', NULL),
(12, 12, '大津漁港', 'おおつぎょこう', NULL, 2, 2, '2022-08-01 04:58:14', '2022-08-01 04:58:14', NULL),
(13, 13, '静内漁港', 'しずないぎょこう', NULL, 2, 2, '2022-08-01 04:59:26', '2022-08-01 04:59:26', NULL),
(14, 14, '勇払マリーナ', 'ゆうふつまりーな', NULL, 2, 2, '2022-08-01 05:00:46', '2022-08-01 05:00:46', NULL),
(15, 14, '苫小牧西港', 'とまこまいにしこう', NULL, 2, 2, '2022-08-01 05:01:37', '2022-08-01 05:01:37', NULL),
(16, 15, '白老港', 'しらおいこう', NULL, 2, 2, '2022-08-01 05:02:13', '2022-08-01 05:02:13', NULL),
(17, 16, '室蘭港', 'むろらんこう', NULL, 2, 2, '2022-08-01 05:03:26', '2022-08-01 05:03:26', NULL),
(18, 17, '石狩湾新港花畔埠頭', 'いしかりわんしんこうばんなぐろふとう', NULL, 2, 2, '2022-08-01 05:08:05', '2022-08-01 05:08:05', NULL),
(19, 18, '余別漁港', 'よべつぎょこう', NULL, 2, 2, '2022-08-01 05:13:48', '2022-08-01 05:13:48', NULL),
(20, 1, '住吉漁港', 'すみよしぎょこう', NULL, 2, 2, '2022-08-01 05:14:48', '2022-08-01 05:14:48', NULL),
(21, 19, '紋別港', 'もんべつこう', NULL, 2, 2, '2022-08-01 05:16:04', '2022-08-01 05:16:04', NULL),
(22, 20, '大畑漁港', 'おおはたぎょこう', NULL, 2, 2, '2022-08-01 05:17:18', '2022-08-01 05:17:18', NULL),
(23, 20, '野牛漁港', 'やぎゅうぎょこう', NULL, 2, 2, '2022-08-01 05:18:58', '2022-08-01 05:18:58', NULL),
(24, 20, '東通白糠漁港', 'ひがしどおりしらぬかぎょこう', NULL, 2, 2, '2022-08-01 05:20:13', '2022-08-01 05:20:13', NULL),
(25, 21, '源氏ヶ浦漁港', 'げんじがうらぎょこう', NULL, 2, 2, '2022-08-01 05:21:32', '2022-08-01 05:21:32', NULL),
(26, 22, '三沢漁港', 'みさわぎょこう', NULL, 2, 2, '2022-08-01 05:22:11', '2022-08-01 05:22:11', NULL),
(27, 23, '白銀漁港', 'しろがねぎょこう', NULL, 2, 2, '2022-08-01 05:23:29', '2022-08-01 05:23:29', NULL),
(28, 23, '八戸漁港', 'はちのへぎょこう', NULL, 2, 2, '2022-08-01 05:24:08', '2022-08-01 05:24:08', NULL),
(29, 24, '追越漁港', 'おいこしぎょこう', NULL, 2, 2, '2022-08-01 05:31:35', '2022-08-01 05:31:35', NULL),
(30, 25, '清水川漁港', 'しみずがわぎょこう', NULL, 2, 2, '2022-08-01 05:32:49', '2022-08-01 05:32:49', NULL),
(31, 26, '浦島マリーナ', 'うらしままりーな', NULL, 2, 2, '2022-08-01 05:34:28', '2022-08-01 05:34:28', NULL),
(32, 26, '造道ボートパーク', 'つくりみちぼーとぱーく', NULL, 2, 2, '2022-08-01 05:35:33', '2022-08-01 05:35:33', NULL),
(33, 26, '青森県営マリーナ', 'あおもりけんえいまりーな', NULL, 2, 2, '2022-08-01 05:36:02', '2022-08-01 05:36:02', NULL),
(34, 27, '平舘漁港', 'たいらだてぎょこう', NULL, 2, 2, '2022-08-01 05:36:46', '2022-08-01 05:36:46', NULL),
(35, 28, '今別浜名漁港', 'いまべつはまなぎょこう', NULL, 2, 2, '2022-08-01 05:38:33', '2022-08-01 05:38:33', NULL),
(36, 27, '三厩漁港', 'みんまやぎょこう', NULL, 2, 2, '2022-08-03 02:39:07', '2022-08-03 02:39:07', NULL),
(37, 29, '小泊漁港', 'こどまりぎょこう', NULL, 2, 2, '2022-08-03 02:40:12', '2022-08-03 02:40:12', NULL),
(38, 30, '脇元漁港', 'わきもとぎょこう', NULL, 2, 2, '2022-08-03 02:41:38', '2022-08-03 02:41:38', NULL),
(39, 31, '鰺ヶ沢港', 'あじがさわこう', NULL, 2, 2, '2022-08-03 02:44:53', '2022-08-03 02:44:53', NULL),
(40, 32, '北金ヶ沢漁港', 'きたかねがさわぎょこう', NULL, 2, 2, '2022-08-03 02:50:33', '2022-08-03 02:50:33', NULL),
(41, 33, '宮古港', 'みやここう', NULL, 2, 2, '2022-08-03 05:34:06', '2022-08-03 05:34:06', NULL),
(42, 34, '山田港', 'やまだこう', NULL, 2, 2, '2022-08-03 05:34:58', '2022-08-03 05:34:58', NULL),
(43, 35, '佐須漁港', 'さずぎょこう', NULL, 2, 2, '2022-08-03 05:35:50', '2022-08-03 05:35:50', NULL),
(44, 36, '崎浜港', 'さきはまこう', NULL, 2, 2, '2022-08-03 05:36:53', '2022-08-03 05:36:53', NULL),
(45, 37, '能代港', 'のしろこう', NULL, 2, 2, '2022-08-04 06:11:51', '2022-08-04 06:11:51', NULL),
(46, 38, '湯ノ尻漁港', 'ゆのじりぎょこう', NULL, 2, 2, '2022-08-04 06:13:00', '2022-08-04 06:13:00', NULL),
(47, 38, '北浦港', 'きたうらこう', NULL, 2, 2, '2022-08-04 06:14:02', '2022-08-04 06:14:02', NULL),
(48, 38, '加茂漁港', 'かもぎょこう', NULL, 2, 2, '2022-08-04 06:16:22', '2022-08-04 06:16:22', NULL),
(49, 39, '秋田港', 'あきたこう', NULL, 2, 2, '2022-08-04 06:18:35', '2022-08-04 06:18:35', NULL),
(50, 40, '本荘マリーナ', 'ほんじょうまりーな', NULL, 2, 2, '2022-08-04 06:19:21', '2022-08-04 06:19:21', NULL),
(51, 41, '象潟漁港', 'きさかたぎょこう', NULL, 2, 2, '2022-08-04 06:20:10', '2022-08-04 06:20:10', NULL),
(52, 42, '吹浦新港', 'ふくらぎょこう', NULL, 2, 2, '2022-08-04 06:21:53', '2022-08-04 06:21:53', NULL),
(53, 43, '酒田北港', 'さかたきたこう', NULL, 2, 2, '2022-08-04 06:24:50', '2022-08-04 06:24:50', NULL),
(54, 43, '酒田港', 'さかたこう', NULL, 2, 2, '2022-08-04 06:25:16', '2022-08-04 06:25:16', NULL),
(55, 44, '気仙沼港', 'けせんぬまこう', NULL, 2, 2, '2022-08-04 06:28:36', '2022-08-04 06:28:36', NULL),
(56, 45, '歌津管の浜港', 'うたつくだのはまこう', NULL, 2, 2, '2022-08-04 06:32:52', '2022-08-04 06:32:52', NULL),
(57, 46, '雄勝港', 'おがつこう', NULL, 2, 2, '2022-08-04 06:33:52', '2022-08-04 06:33:52', NULL),
(58, 46, '鮎川港', 'あゆかわこう', NULL, 2, 2, '2022-08-04 06:34:51', '2022-08-04 06:34:51', NULL),
(59, 48, '塩釜港', 'しおがまこう', NULL, 2, 2, '2022-08-04 06:36:33', '2022-08-04 06:36:33', NULL),
(60, 50, '要害港', 'ようがいこう', NULL, 2, 2, '2022-08-04 06:37:45', '2022-08-04 06:37:45', NULL),
(61, 49, '貞山運河', 'てんざんうんが', NULL, 2, 2, '2022-08-04 06:39:22', '2022-08-04 06:39:22', NULL),
(62, 51, '閖上港', 'ゆりあげこう', NULL, 2, 2, '2022-08-04 06:40:27', '2022-08-04 06:40:27', NULL),
(63, 53, '荒浜漁港', 'あらはまぎょこう', NULL, 2, 2, '2022-08-04 06:45:43', '2022-08-04 06:45:43', NULL),
(64, 55, '小名浜港', 'おなはまこう', NULL, 2, 2, '2022-08-04 06:47:02', '2022-08-04 06:47:02', NULL),
(65, 56, '平潟港', 'ひらがたこう', NULL, 2, 2, '2022-08-04 06:48:55', '2022-08-04 06:48:55', NULL),
(66, 57, '会瀬港', 'おうせこう', NULL, 2, 2, '2022-08-04 06:50:21', '2022-08-04 06:50:21', NULL),
(67, 57, '日立港', 'ひたちこう', NULL, 2, 2, '2022-08-04 06:51:25', '2022-08-04 06:51:25', NULL),
(68, 57, '久慈漁港', 'くじぎょこう', NULL, 2, 2, '2022-08-04 06:52:33', '2022-08-04 06:52:33', NULL),
(69, 58, '那珂湊港', 'なかみなとこう', NULL, 2, 2, '2022-08-04 06:53:53', '2022-08-04 06:53:53', NULL),
(70, 59, '大洗港', 'おおあらいこう', NULL, 2, 2, '2022-08-04 06:54:42', '2022-08-04 06:54:42', NULL),
(71, 60, '鹿島新港', 'かしましんこう', NULL, 2, 2, '2022-08-04 06:56:14', '2022-08-04 06:56:14', NULL),
(72, 60, '鹿島港', 'かしまこう', NULL, 2, 2, '2022-08-04 06:56:50', '2022-08-04 06:56:50', NULL),
(73, 61, '波崎港', 'はさきこう', NULL, 2, 2, '2022-08-04 06:59:49', '2022-08-04 06:59:49', NULL),
(74, 62, '荒川笹目橋', 'あらかわささめばし', NULL, 2, 2, '2022-08-04 07:10:37', '2022-08-04 07:10:37', NULL),
(75, 169, '川崎エリア', 'かわさきえりあ', NULL, 2, 2, '2022-08-04 07:17:53', '2022-08-04 07:17:53', NULL),
(76, 63, '鶴見エリア', 'つるみえりあ', NULL, 2, 2, '2022-08-04 07:19:49', '2022-08-04 07:19:49', NULL),
(77, 63, '新山下エリア', 'しんやましたえりあ', NULL, 2, 2, '2022-08-04 07:21:58', '2022-08-04 07:21:58', NULL),
(78, 63, '本牧港', 'ほんもくこう', NULL, 2, 2, '2022-08-04 07:22:57', '2022-08-04 07:22:57', NULL),
(79, 63, '柴漁港', 'しばぎょこう', NULL, 2, 2, '2022-08-04 07:23:55', '2022-08-04 07:23:55', NULL),
(80, 63, '金沢漁港', 'かなざわぎょこう', NULL, 2, 2, '2022-08-04 07:24:38', '2022-08-04 07:24:38', NULL),
(81, 63, '金沢八景エリア', 'かなざわはっけいえりあ', NULL, 2, 2, '2022-08-04 07:26:52', '2022-08-04 07:26:52', NULL),
(82, 64, '新安浦港', 'しんやすうらこう', NULL, 2, 2, '2022-08-04 07:27:48', '2022-08-04 07:27:48', NULL),
(83, 64, '大津港', 'おおつこう', NULL, 2, 2, '2022-08-04 07:28:51', '2022-08-04 07:28:51', NULL),
(84, 64, '走水港', 'はしりみずこう', NULL, 2, 2, '2022-08-04 07:30:02', '2022-08-04 07:30:02', NULL),
(85, 64, '鴨居港', 'かもいこう', NULL, 2, 2, '2022-08-04 07:30:46', '2022-08-04 07:30:46', NULL),
(86, 64, '浦賀港', 'うらがこう', NULL, 2, 2, '2022-08-04 07:31:26', '2022-08-04 07:31:26', NULL),
(87, 64, '久比里港', 'くびりこう', NULL, 2, 2, '2022-08-04 07:32:55', '2022-08-04 07:32:55', NULL),
(88, 64, '久里浜港', 'くりはまこう', NULL, 2, 2, '2022-08-04 07:33:47', '2022-08-04 07:33:47', NULL),
(89, 65, '金田港', 'かねだこう', NULL, 2, 2, '2022-08-04 07:34:26', '2022-08-04 07:34:26', NULL),
(90, 65, '間口港', 'まぐちこう', NULL, 2, 2, '2022-08-04 07:35:13', '2022-08-04 07:35:13', NULL),
(91, 65, '松輪江奈港', 'まつわえなこう', NULL, 2, 2, '2022-08-04 07:37:57', '2022-08-04 07:37:57', NULL),
(92, 65, '毘沙門港', 'びしゃもんこう', NULL, 2, 2, '2022-08-04 07:39:17', '2022-08-04 07:39:17', NULL),
(93, 65, '城ヶ島エリア', 'じょうがしまえりあ', NULL, 2, 2, '2022-08-04 07:41:04', '2022-08-04 07:41:04', NULL),
(94, 64, '長井荒井港', 'ながいあらいこう', NULL, 2, 2, '2022-08-04 07:42:06', '2022-08-04 07:42:06', NULL),
(95, 65, '小網代湾', 'こあじろわん', NULL, NULL, 2, '2022-08-04 07:42:48', '2022-08-04 07:43:08', NULL),
(96, 64, '長井漆山港', 'ながいうるしやまこう', NULL, 2, 2, '2022-08-04 07:44:25', '2022-08-04 07:44:25', NULL),
(97, 64, '長井港', 'ながいこう', NULL, 2, 2, '2022-08-04 07:44:55', '2022-08-04 07:44:55', NULL),
(98, 64, '佐島漁港', 'さじまぎょこう', NULL, 2, 2, '2022-08-04 07:45:31', '2022-08-04 07:45:31', NULL),
(99, 64, '芦名港', 'あしなこう', NULL, 2, 2, '2022-08-04 07:46:28', '2022-08-04 07:46:28', NULL),
(100, 66, '芝崎港', 'しばさきこう', NULL, 2, 2, '2022-08-04 07:48:56', '2022-08-04 07:48:56', NULL),
(101, 66, 'あぶずり港', 'あぶずりこう', NULL, 2, 2, '2022-08-04 07:49:41', '2022-08-04 07:49:41', NULL),
(102, 170, '小坪港', 'こつぼこう', NULL, 2, 2, '2022-08-04 07:53:45', '2022-08-04 07:53:45', NULL),
(103, 67, '腰越港', 'こしごえこう', NULL, 2, 2, '2022-08-04 07:55:12', '2022-08-04 07:55:12', NULL),
(104, 68, '片瀬港', 'かたせこう', NULL, 2, 2, '2022-08-04 07:55:52', '2022-08-04 07:55:52', NULL),
(105, 69, '茅ヶ崎港', 'ちがさきこう', NULL, 2, 2, '2022-08-04 07:56:33', '2022-08-04 07:56:33', NULL),
(106, 70, '平塚新港', 'ひらつかしんこう', NULL, 2, 2, '2022-08-04 07:56:58', '2022-08-04 07:56:58', NULL),
(107, 71, '早川港', 'はやかわこう', NULL, 2, 2, '2022-08-04 07:59:17', '2022-08-04 07:59:17', NULL),
(108, 71, '小田原新港', 'おだわらしんこう', NULL, 2, 2, '2022-08-04 07:59:55', '2022-08-04 07:59:55', NULL),
(109, 72, '真鶴港', 'まなづるこう', NULL, 2, 2, '2022-08-04 08:00:50', '2022-08-04 08:00:50', NULL),
(110, 73, '福浦港', 'ふくうらこう', NULL, 2, 2, '2022-08-04 08:01:35', '2022-08-04 08:01:35', NULL),
(111, 74, '荒川鹿浜橋', 'あらかわしかはまばし', NULL, 2, 2, '2022-08-04 08:46:11', '2022-08-04 08:46:11', NULL),
(112, 75, '網平マリーナ', 'あみひらまりーな', NULL, 2, 2, '2022-08-04 08:48:06', '2022-08-04 08:48:06', NULL),
(113, 75, 'スパイラルマリーン内', 'すぱいらるまりーんない', NULL, 2, 2, '2022-08-04 08:49:37', '2022-08-04 08:49:37', NULL),
(114, 76, '新中川・鹿骨', 'しんなかがわししぼね', NULL, 2, 2, '2022-08-04 08:52:15', '2022-08-04 08:52:15', NULL),
(115, 77, '荒川・葛西橋', 'あらかわかさいばし', NULL, 2, 2, '2022-08-04 08:55:10', '2022-08-04 08:55:10', NULL),
(116, 77, '深川', 'ふかがわ', NULL, 2, 2, '2022-08-04 08:55:58', '2022-08-04 08:55:58', NULL),
(117, 78, '佃島', 'つくだじま', NULL, 2, 2, '2022-08-04 08:59:05', '2022-08-04 08:59:05', NULL),
(118, 79, '勝島運河', 'かつしまうんが', NULL, 2, 2, '2022-08-04 08:59:48', '2022-08-04 08:59:48', NULL),
(119, 80, '平和島', 'へいわじま', NULL, 2, 2, '2022-08-04 09:00:38', '2022-08-04 09:00:38', NULL),
(120, 80, '多摩川・羽田', 'たまがわはねだ', NULL, 2, 2, '2022-08-04 09:01:18', '2022-08-04 09:01:18', NULL),
(121, 81, '江戸川・浦安', 'えどがわうらやす', NULL, 2, 2, '2022-08-04 09:04:56', '2022-08-04 09:04:56', NULL),
(122, 82, '江戸川放水路', 'えどがわほうすいろ', NULL, 2, 2, '2022-08-04 09:05:34', '2022-08-04 09:05:34', NULL),
(123, 82, '真間川・原木', 'ままがわばらき', NULL, 2, 2, '2022-08-04 09:06:20', '2022-08-04 09:06:20', NULL),
(124, 83, '南船橋', 'みなみふなばし', NULL, 2, 2, '2022-08-04 09:06:59', '2022-08-04 09:06:59', NULL),
(125, 84, '木更津港', 'きさらずこう', NULL, 2, 2, '2022-08-04 09:07:30', '2022-08-04 09:07:30', NULL),
(126, 85, '上総湊港', 'かずさみなとこう', NULL, 2, 2, '2022-08-04 09:08:21', '2022-08-04 09:08:21', NULL),
(127, 85, '竹岡港', 'たけおかこう', NULL, 2, 2, '2022-08-04 09:09:39', '2022-08-04 09:09:39', NULL),
(128, 85, '金谷港', 'かなやこう', NULL, 2, 2, '2022-08-04 09:22:06', '2022-08-04 09:22:06', NULL),
(129, 86, '保田港', 'ほたこう', NULL, 2, 2, '2022-08-04 09:22:54', '2022-08-04 09:22:54', NULL),
(130, 86, '勝山港', 'かつやまこう', NULL, 2, 2, '2022-08-04 09:23:35', '2022-08-04 09:23:35', NULL),
(131, 87, '富浦港', 'とみうらこう', NULL, 2, 2, '2022-08-04 09:24:13', '2022-08-04 09:24:13', NULL),
(132, 88, '洲崎栄ノ浦港', 'すさきえいのうらこう', NULL, 2, 2, '2022-08-04 09:26:19', '2022-08-04 09:26:19', NULL),
(133, 88, '洲崎港', 'すさきこう', NULL, 2, 2, '2022-08-04 09:27:15', '2022-08-04 09:27:15', NULL),
(134, 88, '伊戸港', 'いとこう', NULL, 2, 2, '2022-08-04 09:28:15', '2022-08-04 09:28:15', NULL),
(135, 88, '相浜港', 'あいはまこう', NULL, 2, 2, '2022-08-04 09:29:12', '2022-08-04 09:29:12', NULL),
(136, 88, '布良港', 'めらこう', NULL, 2, 2, '2022-08-04 09:29:58', '2022-08-04 09:29:58', NULL),
(137, 87, '乙浜港', 'おとはまこう', NULL, 2, 2, '2022-08-04 09:30:49', '2022-08-04 09:30:49', NULL),
(138, 87, '白間津港', 'しらまづこう', NULL, 2, 2, '2022-08-04 09:32:16', '2022-08-04 09:32:16', NULL),
(139, 87, '千田港', 'せんだこう', NULL, 2, 2, '2022-08-04 09:32:51', '2022-08-04 09:32:51', NULL),
(140, 87, '千倉港', 'ちくらこう', NULL, 2, 2, '2022-08-04 09:33:36', '2022-08-04 09:33:36', NULL),
(141, 87, '和田港', 'わだこう', NULL, 2, 2, '2022-08-04 09:34:34', '2022-08-04 09:34:34', NULL),
(142, 89, '江見港', 'えみこう', NULL, 2, 2, '2022-08-04 09:36:10', '2022-08-04 09:36:10', NULL),
(143, 89, '太夫崎港', 'たいゆうざき', NULL, 2, 2, '2022-08-04 09:37:05', '2022-08-04 09:37:05', NULL),
(144, 89, '太海港', 'ふとみこう', NULL, 2, 2, '2022-08-04 09:37:44', '2022-08-04 09:37:44', NULL),
(145, 89, '鴨川港', 'かもがわこう', NULL, 2, 2, '2022-08-04 09:38:23', '2022-08-04 09:38:23', NULL),
(146, 89, '天津港', 'あまつこう', NULL, 2, 2, '2022-08-04 09:39:42', '2022-08-04 09:39:42', NULL),
(147, 89, '寄浦港', 'よりうらこう', NULL, 2, 2, '2022-08-04 09:44:01', '2022-08-04 09:44:01', NULL),
(148, 89, '小湊港', 'こみなとこう', NULL, 2, 2, '2022-08-04 09:44:47', '2022-08-04 09:44:47', NULL),
(149, 90, '浜行川港', 'はまなめかわこう', NULL, 2, 2, '2022-08-04 09:45:48', '2022-08-04 09:45:48', NULL),
(150, 90, '興津港', 'おきつこう', NULL, 2, 2, '2022-08-04 09:47:09', '2022-08-04 09:47:09', NULL),
(151, 90, '松部港', 'まつべこう', NULL, 2, 2, '2022-08-04 09:48:02', '2022-08-04 09:48:02', NULL),
(152, 90, '勝浦港', 'かつうらこう', NULL, 2, 2, '2022-08-04 09:49:29', '2022-08-04 09:49:29', NULL),
(153, 90, '川津港', 'かわづこう', NULL, 2, 2, '2022-08-04 09:51:00', '2022-08-04 09:51:00', NULL),
(154, 90, '豊浜港', 'とよはまこう', NULL, 2, 2, '2022-08-04 09:54:08', '2022-08-04 09:54:08', NULL),
(155, 91, '御宿港', 'おんじゅくこう', NULL, 2, 2, '2022-08-04 09:55:25', '2022-08-04 09:55:25', NULL),
(156, 91, '岩和田港', 'いわわだこう', NULL, 2, 2, '2022-08-04 09:56:35', '2022-08-04 09:56:35', NULL),
(157, 92, '大原港', 'おおはらこう', NULL, 2, 2, '2022-08-04 09:58:55', '2022-08-04 09:58:55', NULL),
(158, 92, '太東港', 'たいとうこう', NULL, 2, 2, '2022-08-04 12:05:53', '2022-08-04 12:05:53', NULL),
(159, 93, '片貝港', 'かたかいこう', NULL, 2, 2, '2022-08-04 12:07:15', '2022-08-04 12:07:15', NULL),
(160, 94, '飯岡港', 'いいおかこう', NULL, 2, 2, '2022-08-04 12:08:14', '2022-08-04 12:08:14', NULL),
(161, 95, '外川港', 'とかわこう', NULL, 2, 2, '2022-08-04 12:09:13', '2022-08-04 12:09:13', NULL),
(162, 96, '寝屋漁港', 'ねやぎょこう', NULL, 2, 2, '2022-08-04 12:10:15', '2022-08-04 12:10:15', NULL),
(163, 97, '寺泊港', 'てらどまりこう', NULL, 2, 2, '2022-08-04 12:11:17', '2022-08-04 12:11:17', NULL),
(164, 98, '黒部漁港', 'くろべぎょこう', NULL, 2, 2, '2022-08-04 12:12:22', '2022-08-04 12:12:22', NULL),
(165, 99, '三国漁港', 'みくにぎょこう', NULL, 2, 2, '2022-08-04 12:14:33', '2022-08-04 12:14:33', NULL),
(166, 100, '福井新港', 'ふくいしんこう', NULL, 2, 2, '2022-08-04 12:15:27', '2022-08-04 12:15:27', NULL),
(167, 100, '鷹巣漁港', 'たかすぎょこう', NULL, 2, 2, '2022-08-04 12:17:27', '2022-08-04 12:17:27', NULL),
(168, 100, '白浜漁港', 'しらはまぎょこう', NULL, 2, 2, '2022-08-04 12:18:35', '2022-08-04 12:18:35', NULL),
(169, 101, '小樟漁港', 'おこのぎぎょこう', NULL, 2, 2, '2022-08-04 12:20:52', '2022-08-04 12:20:52', NULL),
(170, 102, '色ヶ浜', 'いろがはま', NULL, 2, 2, '2022-08-04 12:23:20', '2022-08-04 12:23:20', NULL),
(171, 102, '敦賀港', 'つるがこう', NULL, 2, 2, '2022-08-04 12:24:31', '2022-08-04 12:24:31', NULL),
(172, 103, '丹生港', 'にゅうこう', NULL, 2, 2, '2022-08-04 12:25:51', '2022-08-04 12:25:51', NULL),
(173, 103, '早瀬港', 'はやせこう', NULL, 2, 2, '2022-08-04 12:27:21', '2022-08-04 12:27:21', NULL),
(174, 104, '西小川', 'にしおがわ', NULL, 2, 2, '2022-08-04 12:29:33', '2022-08-04 12:29:33', NULL),
(175, 104, '西津港', 'にしづこう', NULL, 2, 2, '2022-08-04 12:31:10', '2022-08-04 12:31:10', NULL),
(176, 104, '小浜旧港', 'おばまきゅうこう', NULL, 2, 2, '2022-08-04 12:32:38', '2022-08-04 12:32:38', NULL),
(177, 104, '小浜新港', 'おばましんこう', NULL, 2, 2, '2022-08-04 12:33:20', '2022-08-04 12:33:20', NULL),
(178, 105, '和田漁港', 'わだぎょこう', NULL, 2, 2, '2022-08-04 12:38:25', '2022-08-04 12:38:25', NULL),
(179, 106, '熱海港', 'あたみこう', NULL, 2, 2, '2022-08-04 12:39:58', '2022-08-04 12:39:58', NULL),
(180, 106, '多賀港', 'たがこう', NULL, 2, 2, '2022-08-04 12:40:44', '2022-08-04 12:40:44', NULL),
(181, 106, '網代港', 'あじろこう', NULL, 2, 2, '2022-08-04 12:42:01', '2022-08-04 12:42:01', NULL),
(182, 107, '宇佐美港', 'うさみこう', NULL, 2, 2, '2022-08-04 12:45:34', '2022-08-04 12:45:34', NULL),
(183, 107, '伊東港', 'いとうこう', NULL, 2, 2, '2022-08-04 12:46:58', '2022-08-04 12:46:58', NULL),
(184, 107, '富戸港', 'ふとこう', NULL, 2, 2, '2022-08-04 12:50:11', '2022-08-04 12:50:11', NULL),
(185, 108, '外浦港', 'とのうらこう', NULL, 2, 2, '2022-08-04 12:51:43', '2022-08-04 12:51:43', NULL),
(186, 108, '須崎港', 'すざきこう', NULL, 2, 2, '2022-08-04 12:53:10', '2022-08-04 12:53:10', NULL),
(187, 108, '稲生沢川・下田', 'いのうざわがわしもだ', NULL, 2, 2, '2022-08-05 09:14:53', '2022-08-05 09:14:53', NULL),
(188, 109, '南伊豆弓ヶ浜', 'みなみいずゆみがはま', NULL, 2, 2, '2022-08-05 09:16:17', '2022-08-05 09:16:17', NULL),
(189, 109, '青野川・手石', 'あおのがわていし', NULL, 2, 2, '2022-08-05 09:17:02', '2022-08-05 09:17:02', NULL),
(190, 109, '小稲港', 'こいなこう', NULL, 2, 2, '2022-08-05 09:17:36', '2022-08-05 09:17:36', NULL),
(191, 109, '大瀬港', 'おおせこう', NULL, 2, 2, '2022-08-05 09:19:15', '2022-08-05 09:19:15', NULL),
(192, 110, '松崎港', 'まつざきこう', NULL, 2, 2, '2022-08-05 09:19:52', '2022-08-05 09:19:52', NULL),
(193, 111, '土肥港', 'といこう', NULL, 2, 2, '2022-08-05 09:20:32', '2022-08-05 09:20:32', NULL),
(194, 112, '戸田港', 'へだこう', NULL, 2, 2, '2022-08-05 09:22:25', '2022-08-05 09:22:25', NULL),
(195, 112, '江梨港', 'えなしこう', NULL, 2, 2, '2022-08-05 09:23:40', '2022-08-05 09:23:40', NULL),
(196, 112, '足保港', 'あしぼこう', NULL, 2, 2, '2022-08-05 09:24:36', '2022-08-05 09:24:36', NULL),
(197, 112, '内浦港', 'うちうらこう', NULL, 2, 2, '2022-08-05 09:26:28', '2022-08-05 09:26:28', NULL),
(198, 112, '江浦', 'えのうら', NULL, 2, 2, '2022-08-05 09:27:39', '2022-08-05 09:27:39', NULL),
(199, 112, '沼津港', 'ぬまづこう', NULL, 2, 2, '2022-08-05 09:28:13', '2022-08-05 09:28:13', NULL),
(200, 113, '田子の浦港', 'たごのうらこう', NULL, NULL, 2, '2022-08-05 09:29:46', '2022-08-05 09:30:09', NULL),
(201, 114, '由比港', 'ゆいこう', NULL, 2, 2, '2022-08-05 09:31:26', '2022-08-05 09:31:26', NULL),
(202, 114, '興津港', 'おきつこう', NULL, 2, 2, '2022-08-05 09:32:46', '2022-08-05 09:32:46', NULL),
(203, 114, '清水港', 'しみずこう', NULL, 2, 2, '2022-08-05 09:33:25', '2022-08-05 09:33:25', NULL),
(204, 114, '用宗港', 'もちむねこう', NULL, 2, 2, '2022-08-05 09:34:08', '2022-08-05 09:34:08', NULL),
(205, 115, '焼津港', 'やいづこう', NULL, 2, 2, '2022-08-05 09:35:23', '2022-08-05 09:35:23', NULL),
(206, 115, '大井川港', 'おおいがわこう', NULL, 2, 2, '2022-08-05 09:36:30', '2022-08-05 09:36:30', NULL),
(207, 116, '相良平田港', 'さがらひらたこう', NULL, 2, 2, '2022-08-05 09:40:09', '2022-08-05 09:40:09', NULL),
(208, 116, '地頭方港', 'じとうがたむら', NULL, 2, 2, '2022-08-09 12:00:34', '2022-08-09 12:00:34', NULL),
(209, 117, '御前崎港', 'おまえざきこう', NULL, 2, 2, '2022-08-09 12:01:40', '2022-08-09 12:01:40', NULL),
(210, 118, '福田港', 'ふくでこう', NULL, 2, 2, '2022-08-09 12:08:12', '2022-08-09 12:08:12', NULL),
(211, 171, '新居港', 'あらいこう', NULL, 2, 2, '2022-08-09 12:13:56', '2022-08-09 12:13:56', NULL),
(212, 119, '知柄漁港', 'ちがらぎょこう', NULL, 2, 2, '2022-08-09 12:20:20', '2022-08-09 12:20:20', NULL),
(213, 120, '片名漁港', 'かたなぎょこう', NULL, 2, 2, '2022-08-09 12:26:21', '2022-08-09 12:26:21', NULL),
(214, 120, '新師崎漁港', 'しんもろざきぎょこう', NULL, 2, 2, '2022-08-09 12:27:27', '2022-08-09 12:27:27', NULL),
(215, 120, '師崎漁港', 'もろざきぎょこう', NULL, 2, 2, '2022-08-09 12:28:45', '2022-08-09 12:28:45', NULL),
(216, 121, '本浦港', 'もとうらこう', NULL, 2, 2, '2022-08-09 12:32:54', '2022-08-09 12:32:54', NULL),
(217, 122, '波切漁港', 'なきりぎょこう', NULL, 2, 2, '2022-08-09 12:34:54', '2022-08-09 12:34:54', NULL),
(218, 122, '御座漁港', 'こざぎょこう', NULL, 2, 2, '2022-08-09 12:58:23', '2022-08-09 12:58:23', NULL),
(219, 123, '宮津波路', 'みやづはじ', NULL, 2, 2, '2022-08-09 13:00:20', '2022-08-09 13:00:20', NULL),
(220, 123, '里波見漁港', 'さとはみぎょこう', NULL, 2, 2, '2022-08-09 13:02:17', '2022-08-09 13:02:17', NULL),
(221, 124, '伊根舟屋', 'いねふなや', NULL, 2, 2, '2022-08-09 13:08:12', '2022-08-09 13:08:12', NULL),
(222, 125, '浅茂川港', 'あさもがわこう', NULL, 2, 2, '2022-08-09 13:53:01', '2022-08-09 13:53:01', NULL),
(223, 125, '久美浜湊宮', 'くみはまみなとみや', NULL, 2, 2, '2022-08-09 14:11:27', '2022-08-09 14:11:27', NULL),
(224, 126, '大正内港', 'たいしょうないこう', NULL, 2, 2, '2022-08-09 14:16:24', '2022-08-09 14:16:24', NULL),
(225, 127, '谷川港', 'たにがわこう', NULL, 2, 2, '2022-08-09 14:18:54', '2022-08-09 14:18:54', NULL),
(226, 128, '網干港', 'おぼしこう', NULL, 2, 2, '2022-08-09 14:20:05', '2022-08-09 14:20:05', NULL),
(227, 128, '姫路港', 'ひめじこう', NULL, 2, 2, '2022-08-09 14:20:42', '2022-08-09 14:20:42', NULL),
(228, 129, '木場ヨットハーバー', 'きばよっとはーばー', NULL, 2, 2, '2022-08-09 14:21:45', '2022-08-09 14:21:45', NULL),
(229, 129, '荒井漁港', 'あらいぎょこう', NULL, 2, 2, '2022-08-09 14:22:42', '2022-08-09 14:22:42', NULL),
(230, 130, '播磨フィッシャリーナ', 'はりまふぃっしゃりーな', NULL, 2, 2, '2022-08-09 14:34:04', '2022-08-09 14:34:04', NULL),
(231, 131, '東二見港', 'ひがしふたみこう', NULL, 2, 2, '2022-08-09 14:35:03', '2022-08-09 14:35:03', NULL),
(232, 131, '明石港', 'あかしこう', NULL, 2, 2, '2022-08-09 14:35:25', '2022-08-09 14:35:25', NULL),
(233, 132, '垂水港', 'たるみこう', NULL, 2, 2, '2022-08-09 14:36:12', '2022-08-09 14:36:12', NULL),
(234, 133, '福良港', 'ふくらこう', NULL, 2, 2, '2022-08-09 14:37:16', '2022-08-09 14:37:16', NULL),
(235, 134, '古座', 'こざ', NULL, 2, 2, '2022-08-09 14:38:00', '2022-08-09 14:38:00', NULL),
(236, 135, '周参見', 'すさみ', NULL, 2, 2, '2022-08-09 14:38:50', '2022-08-09 14:38:50', NULL),
(237, 136, '袋港', 'ふくろこう', NULL, 2, 2, '2022-08-09 14:40:26', '2022-08-09 14:40:26', NULL),
(238, 137, '印南港', 'いなみこう', NULL, 2, 2, '2022-08-09 14:41:31', '2022-08-09 14:41:31', NULL),
(239, 138, '衣奈漁港', 'えなぎょこう', NULL, 2, 2, '2022-08-09 14:42:16', '2022-08-09 14:42:16', NULL),
(240, 172, '湯浅港', 'ゆあさこう', NULL, 2, 2, '2022-08-09 14:44:59', '2022-08-09 14:44:59', NULL),
(241, 139, '加太港', 'かだこう', NULL, 2, 2, '2022-08-09 14:45:37', '2022-08-09 14:45:37', NULL),
(242, 140, '網代漁港', 'あじろぎょこう', NULL, 2, 2, '2022-08-09 14:46:35', '2022-08-09 14:46:35', NULL),
(243, 141, '鳥取港', 'とっとりこう', NULL, 2, 2, '2022-08-09 14:47:15', '2022-08-09 14:47:15', NULL),
(244, 141, '酒津港', 'さけのつこう', NULL, 2, 2, '2022-08-09 14:48:39', '2022-08-09 14:48:39', NULL),
(245, 142, '逢坂港', 'おうさかこう', NULL, 2, 2, '2022-08-09 14:49:38', '2022-08-09 14:49:38', NULL),
(246, 143, '七類港', 'しちるいこう', NULL, 2, 2, '2022-08-10 06:33:54', '2022-08-10 06:33:54', NULL),
(247, 143, '江島港', 'えしまこう', NULL, 2, 2, '2022-08-10 06:34:37', '2022-08-10 06:34:37', NULL),
(248, 144, '鷺浦港', 'さぎうらこう', NULL, 2, 2, '2022-08-10 06:35:20', '2022-08-10 06:35:20', NULL),
(249, 144, '宇竜港', 'うりゅうこう', NULL, 2, 2, '2022-08-10 06:35:57', '2022-08-10 06:35:57', NULL),
(250, 144, '大社築港', 'たいしゃちっこう', NULL, 2, 2, '2022-08-10 06:37:20', '2022-08-10 06:37:20', NULL),
(251, 145, '浜田川・殿町', 'はまだがわとのまち', NULL, 2, 2, '2022-08-10 06:38:29', '2022-08-10 06:38:29', NULL),
(252, 145, '三隅古湊港', 'みすみふるみなとこう', NULL, 2, 2, '2022-08-10 06:40:42', '2022-08-10 06:40:42', NULL),
(253, 146, '大畠漁港', 'おおばたけぎょこう', NULL, 2, 2, '2022-08-10 06:41:56', '2022-08-10 06:41:56', NULL),
(254, 147, '鳴門堂浦漁港', 'なるとどうのうらぎょこう', NULL, 2, 2, '2022-08-10 06:43:58', '2022-08-10 06:43:58', NULL),
(255, 148, '高浜港', 'たかはまこう', NULL, 2, 2, '2022-08-10 06:45:26', '2022-08-10 06:45:26', NULL),
(256, 149, '門司港第二船溜り', 'もじこうだいにせんだまり', NULL, 2, 2, '2022-08-10 08:11:33', '2022-08-10 08:11:33', NULL),
(257, 149, '門司大里港', 'もじだいりこう', NULL, 2, 2, '2022-08-10 08:12:47', '2022-08-10 08:12:47', NULL),
(258, 149, '小倉港', 'こくらこう', NULL, 2, 2, '2022-08-10 08:13:23', '2022-08-10 08:13:23', NULL),
(259, 149, '戸畑漁港', 'とばたぎょこう', NULL, 2, 2, '2022-08-10 08:14:17', '2022-08-10 08:14:17', NULL),
(260, 149, '北九州市漁協・若松支所前', 'きたきゅうしゅうしぎょきょうわかまつししょまえ', NULL, 2, 2, '2022-08-10 08:15:36', '2022-08-10 08:15:36', NULL),
(261, 149, '若松脇田漁港', 'わかまつわいたぎょこう', NULL, 2, 2, '2022-08-10 08:16:54', '2022-08-10 08:16:54', NULL),
(262, 149, '芦屋漁港', 'あしやぎょこう', NULL, 2, 2, '2022-08-10 08:17:49', '2022-08-10 08:17:49', NULL),
(263, 151, '鐘崎漁港', 'かねさきぎょこう', NULL, 2, 2, '2022-08-10 08:19:23', '2022-08-10 08:19:23', NULL),
(264, 151, '神湊漁港', 'こうのみなとぎょこう', NULL, 2, 2, '2022-08-10 08:20:06', '2022-08-10 08:20:06', NULL),
(265, 152, '津屋崎', 'つやざき', NULL, 2, 2, '2022-08-10 08:21:03', '2022-08-10 08:21:03', NULL),
(266, 153, '港カモメ広場前', 'みなとかもめひろばまえ', NULL, 2, 2, '2022-08-10 08:22:18', '2022-08-10 08:22:18', NULL),
(267, 153, '姪浜港', 'めいのはまこう', NULL, 2, 2, '2022-08-10 08:22:47', '2022-08-10 08:22:47', NULL),
(268, 154, '深江漁港', 'ふかえぎょこう', NULL, 2, 2, '2022-08-10 10:09:12', '2022-08-10 10:09:12', NULL),
(269, 155, '串浦港', 'くしうらこう', NULL, 2, 2, '2022-08-10 10:10:52', '2022-08-10 10:10:52', NULL),
(270, 156, '松浦福島', 'まつうらふくしま', NULL, 2, 2, '2022-08-10 10:11:35', '2022-08-10 10:11:35', NULL),
(271, 157, '久原港', 'くばらこう', NULL, 2, 2, '2022-08-10 10:12:23', '2022-08-10 10:12:23', NULL),
(272, 158, '平戸早福', 'ひらどはいふく', NULL, 2, 2, '2022-08-10 10:13:15', '2022-08-10 10:13:15', NULL),
(273, 159, '納屋港', 'なやこう', NULL, 2, 2, '2022-08-10 10:13:58', '2022-08-10 10:13:58', NULL),
(274, 160, '新若草港', 'しんわかくさこう', NULL, 2, 2, '2022-08-10 10:15:14', '2022-08-10 10:15:14', NULL),
(275, 161, '家島港', 'いえじまこう', NULL, 2, 2, '2022-08-10 10:20:45', '2022-08-10 10:20:45', NULL),
(276, 162, '新川漁港', 'しんかわぎょこう', NULL, 2, 2, '2022-08-10 10:26:29', '2022-08-10 10:26:29', NULL),
(277, 173, '三角東港', 'みすみひがしこう', NULL, 2, 2, '2022-08-10 10:29:15', '2022-08-10 10:29:15', NULL),
(278, 164, '鳩之釜港', 'はとのがまこう', NULL, 2, 2, '2022-08-10 10:29:36', '2022-08-10 10:29:36', NULL),
(279, 165, '阿久根港', 'あくねこう', NULL, 2, 2, '2022-08-10 10:30:21', '2022-08-10 10:30:21', NULL),
(280, 166, '重富漁港', 'しげとみえき', NULL, 2, 2, '2022-08-10 10:31:07', '2022-08-10 10:31:07', NULL),
(281, 167, '牧港漁港', 'まきみなとぎょこう', NULL, 2, 2, '2022-08-10 10:34:54', '2022-08-10 10:34:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prefectures`
--

CREATE TABLE IF NOT EXISTS `prefectures` (
  `id` bigint(20) unsigned NOT NULL,
  `region_id` bigint(20) unsigned NOT NULL,
  `prefecture_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefecture_name_kana` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_param` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prefectures`
--

INSERT INTO `prefectures` (`id`, `region_id`, `prefecture_name`, `prefecture_name_kana`, `url_param`, `comment`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '北海道', 'ほっかいどう', 'hokkaido', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, 1, '青森県', 'あおもりけん', 'aomori', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, 1, '岩手県', 'いわてけん', 'iwate', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(4, 1, '宮城県', 'みやぎけん', 'miyagi', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(5, 1, '秋田県', 'あきたけん', 'akita', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(6, 1, '山形県', 'やまがたけん', 'yamagata', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(7, 1, '福島県', 'ふくしまけん', 'fukushima', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(8, 2, '茨城県', 'いばらきけん', 'ibaraki', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(9, 2, '栃木県', 'とちぎけん', 'tochigi', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(10, 2, '群馬県', 'ぐんまけん', 'gunma', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(11, 2, '埼玉県', 'さいたまけん', 'saitama', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(12, 2, '千葉県', 'ちばけん', 'chiba', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(13, 2, '東京都', 'とうきょうと', 'tokyo', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(14, 2, '神奈川県', 'かながわけん', 'kanagawa', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(15, 3, '新潟県', 'にいがたけん', 'niigata', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(16, 3, '富山県', 'とやまけん', 'toyama', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(17, 3, '石川県', 'いしかわけん', 'ishikawa', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(18, 3, '福井県', 'ふくいけん', 'fukui', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(19, 3, '山梨県', 'やまなしけん', 'yamanashi', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(20, 3, '長野県', 'ながのけん', 'nagano', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(21, 4, '岐阜県', 'ぎふけん', 'gifu', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(22, 4, '静岡県', 'しずおかけん', 'shizuoka', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(23, 4, '愛知県', 'あいちけん', 'aichi', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(24, 4, '三重県', 'みえけん', 'mie', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(25, 5, '滋賀県', 'しがけん', 'shiga', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(26, 5, '京都府', 'きょうとふ', 'kyoto', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(27, 5, '大阪府', 'おおさかふ', 'osaka', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(28, 5, '兵庫県', 'ひょうごけん', 'hyogo', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(29, 5, '奈良県', 'ならけん', 'nara', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(30, 5, '和歌山県', 'わかやまけん', 'wakayama', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(31, 6, '鳥取県', 'とっとりけん', 'tottori', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(32, 6, '岡山県', 'しまねけん', 'shimane', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(33, 6, '広島県', 'おかやまけん', 'okayama', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(34, 6, '島根県', 'ひろしまけん', 'hiroshima', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(35, 6, '山口県', 'やまぐちけん', 'yamaguchi', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(36, 6, '徳島県', 'とくしまけん', 'tokushima', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(37, 6, '香川県', 'かがわけん', 'kagawa', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(38, 6, '高知県', 'えひめけん', 'ehime', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(39, 6, '愛媛県', 'こうちけん', 'kochi', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(40, 7, '福岡県', 'ふくおかけん', 'fukuoka', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(41, 7, '佐賀県', 'さがけん', 'saga', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(42, 7, '長崎県', 'ながさきけん', 'nagasaki', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(43, 7, '大分県', 'くまもとけん', 'kumamoto', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(44, 7, '熊本県', 'おおいたけん', 'oita', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(45, 7, '宮崎県', 'みやざきけん', 'miyazaki', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(46, 7, '鹿児島県', 'かごしまけん', 'kagoshima', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(47, 7, '沖縄県', 'おきなわけん', 'okinawa', NULL, 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `id` bigint(20) unsigned NOT NULL,
  `region_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `region_name`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '北海道・東北', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, '関東', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, '北陸・甲信越', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(4, '東海', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(5, '近畿', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(6, '中国・四国', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(7, '九州・沖縄', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '管理者', NULL, NULL, NULL),
(2, '貸舟業者', NULL, NULL, NULL),
(3, '閲覧者', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

CREATE TABLE IF NOT EXISTS `targets` (
  `id` bigint(20) unsigned NOT NULL,
  `target_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `targets`
--

INSERT INTO `targets` (`id`, `target_name`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'マダイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(2, 'ブリ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(3, 'マアジ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(4, 'ヒラメ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(5, 'カサゴ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(6, 'アマダイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(7, 'マサバ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(8, 'カワハギ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(9, 'イサキ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(10, 'タチウオ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(11, 'キダイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(12, 'キハダ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(13, 'ヒラマサ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(14, 'サワラ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(15, 'メバル', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(16, 'カンパチ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(17, 'クロムツ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(18, 'キンメダイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(19, 'アコウ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(20, 'アカハタ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(21, 'クロダイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(22, 'メジナ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(23, 'イシダイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(24, 'オオモンハタ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(25, 'カツオ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(26, 'マゴチ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(27, 'スジアラ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(28, 'クエ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(29, 'ロウニンアジ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(30, 'シイラ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(31, 'マガレイ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(32, 'ヤリイカ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(33, 'アオリイカ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(34, 'コウイカ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL),
(35, 'マダコ', 1, 1, '2022-03-31 15:00:00', '2022-03-31 15:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_kana` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `access_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_app_datetime` datetime DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `name_kana`, `email`, `password`, `role_id`, `access_token`, `login_app_datetime`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '遊漁船管理者', 'かんりしゃ', 'osakanayugyo1', '$2y$10$LYro1VxOBunfwEvJF466lOVR.AllEzp/B0hrGEuKrjqRxMZGivaCe', 1, '13|GPqwnR4WRhKImfabKwTT18fKje6ZLxubws59vQYO', NULL, NULL, NULL, NULL, '2022-07-31 02:40:58', NULL),
(2, '開発用ID', 'かいはつしゃ', 'adminLogin1', '$2y$10$ESKkzL1LNzkLZypVpAE5M.pjoOh915EsghtDUFHgLkheTS3Fsac0m', 1, '38|Kuncxo1P7VtkvUzOmG6lsUgAM6bKO5gTw7fvqbmJ', NULL, NULL, NULL, NULL, '2022-08-13 06:10:43', NULL),
(3, '阿部 勝好', 'あべかつよし', 'yugyosen.search@gmail.com', '$2y$10$.m5gPrL7/PbJevujiXOD7OQl1o3aHsaWvMO0v1kmNiMmHKMWt.ite', 2, '37|EIWbN3uv7fv1R02y5tD0ts9puQn18MAVdjswjJlZ', NULL, 2, 2, '2022-08-12 09:19:32', '2022-08-12 19:26:05', NULL),
(4, '皆川寛紀', 'みながわひろき', '2@gmail.com', '$2y$10$oLFw.7hhfYQoO.VSmYI0ROMKrP39Xp8pFevErm.9MCELlTDGto6Jy', 2, NULL, NULL, 2, 2, '2022-08-12 10:10:18', '2022-08-12 10:10:18', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boats_created_user_id_foreign` (`created_user_id`),
  ADD KEY `boats_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `boats_lender_id_index` (`lender_id`);

--
-- Indexes for table `boat_by_facilities`
--
ALTER TABLE `boat_by_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boat_by_facilities_boat_id_index` (`boat_id`),
  ADD KEY `boat_by_facilities_facility_id_index` (`facility_id`);

--
-- Indexes for table `boat_by_fishing_options`
--
ALTER TABLE `boat_by_fishing_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boat_by_fishing_options_boat_id_index` (`boat_id`),
  ADD KEY `boat_by_fishing_options_fishing_option_id_index` (`fishing_option_id`);

--
-- Indexes for table `boat_by_operations`
--
ALTER TABLE `boat_by_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boat_by_operations_boat_id_index` (`boat_id`),
  ADD KEY `boat_by_operations_operation_id_index` (`operation_id`);

--
-- Indexes for table `boat_by_targets`
--
ALTER TABLE `boat_by_targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boat_by_targets_boat_id_index` (`boat_id`),
  ADD KEY `boat_by_targets_target_id_index` (`target_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_created_user_id_foreign` (`created_user_id`),
  ADD KEY `cities_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `cities_prefecture_id_index` (`prefecture_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilities_created_user_id_foreign` (`created_user_id`),
  ADD KEY `facilities_updated_user_id_foreign` (`updated_user_id`);

--
-- Indexes for table `fishing_options`
--
ALTER TABLE `fishing_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fishing_options_created_user_id_foreign` (`created_user_id`),
  ADD KEY `fishing_options_updated_user_id_foreign` (`updated_user_id`);

--
-- Indexes for table `lenders`
--
ALTER TABLE `lenders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lenders_member_type_id_foreign` (`member_type_id`),
  ADD KEY `lenders_prefecture_id_foreign` (`prefecture_id`),
  ADD KEY `lenders_city_id_foreign` (`city_id`),
  ADD KEY `lenders_port_id_foreign` (`port_id`),
  ADD KEY `lenders_created_user_id_foreign` (`created_user_id`),
  ADD KEY `lenders_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `lenders_user_id_index` (`user_id`);

--
-- Indexes for table `lender_by_payment_options`
--
ALTER TABLE `lender_by_payment_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lender_by_payment_options_lender_id_index` (`lender_id`),
  ADD KEY `lender_by_payment_options_payment_option_id_index` (`payment_option_id`);

--
-- Indexes for table `lender_posts`
--
ALTER TABLE `lender_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lender_posts_created_user_id_foreign` (`created_user_id`),
  ADD KEY `lender_posts_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `lender_posts_lender_id_index` (`lender_id`);

--
-- Indexes for table `lender_post_by_fishing_options`
--
ALTER TABLE `lender_post_by_fishing_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lender_post_by_fishing_options_lender_post_id_index` (`lender_post_id`),
  ADD KEY `lender_post_by_fishing_options_fishing_option_id_index` (`fishing_option_id`);

--
-- Indexes for table `lender_post_by_targets`
--
ALTER TABLE `lender_post_by_targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lender_post_by_targets_lender_post_id_index` (`lender_post_id`),
  ADD KEY `lender_post_by_targets_target_id_index` (`target_id`);

--
-- Indexes for table `member_types`
--
ALTER TABLE `member_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operations_created_user_id_foreign` (`created_user_id`),
  ADD KEY `operations_updated_user_id_foreign` (`updated_user_id`);

--
-- Indexes for table `payment_options`
--
ALTER TABLE `payment_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ports`
--
ALTER TABLE `ports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ports_created_user_id_foreign` (`created_user_id`),
  ADD KEY `ports_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `ports_city_id_index` (`city_id`);

--
-- Indexes for table `prefectures`
--
ALTER TABLE `prefectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prefectures_created_user_id_foreign` (`created_user_id`),
  ADD KEY `prefectures_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `prefectures_region_id_index` (`region_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_created_user_id_foreign` (`created_user_id`),
  ADD KEY `regions_updated_user_id_foreign` (`updated_user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `targets`
--
ALTER TABLE `targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `targets_created_user_id_foreign` (`created_user_id`),
  ADD KEY `targets_updated_user_id_foreign` (`updated_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_created_user_id_foreign` (`created_user_id`),
  ADD KEY `users_updated_user_id_foreign` (`updated_user_id`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boats`
--
ALTER TABLE `boats`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `boat_by_facilities`
--
ALTER TABLE `boat_by_facilities`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `boat_by_fishing_options`
--
ALTER TABLE `boat_by_fishing_options`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `boat_by_operations`
--
ALTER TABLE `boat_by_operations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `boat_by_targets`
--
ALTER TABLE `boat_by_targets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=174;
--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `fishing_options`
--
ALTER TABLE `fishing_options`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `lenders`
--
ALTER TABLE `lenders`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lender_by_payment_options`
--
ALTER TABLE `lender_by_payment_options`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lender_posts`
--
ALTER TABLE `lender_posts`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lender_post_by_fishing_options`
--
ALTER TABLE `lender_post_by_fishing_options`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lender_post_by_targets`
--
ALTER TABLE `lender_post_by_targets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_types`
--
ALTER TABLE `member_types`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment_options`
--
ALTER TABLE `payment_options`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `ports`
--
ALTER TABLE `ports`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=282;
--
-- AUTO_INCREMENT for table `prefectures`
--
ALTER TABLE `prefectures`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `targets`
--
ALTER TABLE `targets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `boats`
--
ALTER TABLE `boats`
  ADD CONSTRAINT `boats_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `boats_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `boat_by_facilities`
--
ALTER TABLE `boat_by_facilities`
  ADD CONSTRAINT `boat_by_facilities_boat_id_foreign` FOREIGN KEY (`boat_id`) REFERENCES `boats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boat_by_facilities_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `boat_by_fishing_options`
--
ALTER TABLE `boat_by_fishing_options`
  ADD CONSTRAINT `boat_by_fishing_options_boat_id_foreign` FOREIGN KEY (`boat_id`) REFERENCES `boats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boat_by_fishing_options_fishing_option_id_foreign` FOREIGN KEY (`fishing_option_id`) REFERENCES `fishing_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `boat_by_operations`
--
ALTER TABLE `boat_by_operations`
  ADD CONSTRAINT `boat_by_operations_boat_id_foreign` FOREIGN KEY (`boat_id`) REFERENCES `boats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boat_by_operations_operation_id_foreign` FOREIGN KEY (`operation_id`) REFERENCES `operations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `boat_by_targets`
--
ALTER TABLE `boat_by_targets`
  ADD CONSTRAINT `boat_by_targets_boat_id_foreign` FOREIGN KEY (`boat_id`) REFERENCES `boats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `boat_by_targets_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `cities_prefecture_id_foreign` FOREIGN KEY (`prefecture_id`) REFERENCES `prefectures` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `cities_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `facilities_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `facilities_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `fishing_options`
--
ALTER TABLE `fishing_options`
  ADD CONSTRAINT `fishing_options_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fishing_options_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `lenders`
--
ALTER TABLE `lenders`
  ADD CONSTRAINT `lenders_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lenders_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lenders_member_type_id_foreign` FOREIGN KEY (`member_type_id`) REFERENCES `member_types` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lenders_port_id_foreign` FOREIGN KEY (`port_id`) REFERENCES `ports` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lenders_prefecture_id_foreign` FOREIGN KEY (`prefecture_id`) REFERENCES `prefectures` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lenders_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lenders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lender_by_payment_options`
--
ALTER TABLE `lender_by_payment_options`
  ADD CONSTRAINT `lender_by_payment_options_lender_id_foreign` FOREIGN KEY (`lender_id`) REFERENCES `lenders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lender_by_payment_options_payment_option_id_foreign` FOREIGN KEY (`payment_option_id`) REFERENCES `payment_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lender_posts`
--
ALTER TABLE `lender_posts`
  ADD CONSTRAINT `lender_posts_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `lender_posts_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `lender_post_by_fishing_options`
--
ALTER TABLE `lender_post_by_fishing_options`
  ADD CONSTRAINT `lender_post_by_fishing_options_fishing_option_id_foreign` FOREIGN KEY (`fishing_option_id`) REFERENCES `fishing_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lender_post_by_fishing_options_lender_post_id_foreign` FOREIGN KEY (`lender_post_id`) REFERENCES `lender_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lender_post_by_targets`
--
ALTER TABLE `lender_post_by_targets`
  ADD CONSTRAINT `lender_post_by_targets_lender_post_id_foreign` FOREIGN KEY (`lender_post_id`) REFERENCES `lender_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lender_post_by_targets_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `targets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `operations_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `operations_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `ports`
--
ALTER TABLE `ports`
  ADD CONSTRAINT `ports_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ports_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ports_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `prefectures`
--
ALTER TABLE `prefectures`
  ADD CONSTRAINT `prefectures_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `prefectures_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `prefectures_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `regions_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `targets`
--
ALTER TABLE `targets`
  ADD CONSTRAINT `targets_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `targets_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_user_id_foreign` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `users_updated_user_id_foreign` FOREIGN KEY (`updated_user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
