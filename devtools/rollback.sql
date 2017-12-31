-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.2.3-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for laraforbeginnerbecomemaster
CREATE DATABASE IF NOT EXISTS `laraforbeginnerbecomemaster` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `laraforbeginnerbecomemaster`;

-- Dumping structure for table laraforbeginnerbecomemaster.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.countries: ~0 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'INDONESIA', '2017-12-31 02:25:25', '2017-12-31 02:25:25'),
	(2, 'USA', '2017-12-31 02:25:25', '2017-12-31 02:25:25'),
	(3, 'INDIA', NULL, NULL),
	(4, 'RUSIA', NULL, NULL),
	(5, 'BRUNEE DARUSALAM', NULL, NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.migrations: ~13 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(25, '2014_10_12_000000_create_users_table', 1),
	(26, '2014_10_12_100000_create_password_resets_table', 1),
	(27, '2017_12_30_105935_create_posts_table', 1),
	(28, '2017_12_30_110510_add_is_admin_column_to_posts_tables', 1),
	(29, '2017_12_30_131841_add_deleted_at_column_to_posts_tables', 1),
	(30, '2017_12_30_150503_create_roles_table', 1),
	(31, '2017_12_30_150645_create_users_roles_table', 1),
	(32, '2017_12_30_172843_create_countries_table', 1),
	(33, '2017_12_30_173038_add_country_id_column_to_users', 1),
	(34, '2017_12_30_181540_create_photos_table', 1),
	(35, '2017_12_30_190421_create_videos_table', 1),
	(36, '2017_12_30_190524_create_taggables_table', 1),
	(37, '2017_12_30_191046_create_tags_table', 1),
	(38, '2014_10_12_000000_create_users_table', 1),
	(39, '2014_10_12_100000_create_password_resets_table', 1),
	(40, '2017_12_30_105935_create_posts_table', 1),
	(41, '2017_12_30_110510_add_is_admin_column_to_posts_tables', 1),
	(42, '2017_12_30_131841_add_deleted_at_column_to_posts_tables', 1),
	(43, '2017_12_30_150503_create_roles_table', 1),
	(44, '2017_12_30_150645_create_users_roles_table', 1),
	(45, '2017_12_30_172843_create_countries_table', 1),
	(46, '2017_12_30_173038_add_country_id_column_to_users', 1),
	(47, '2017_12_30_181540_create_photos_table', 1),
	(48, '2017_12_30_190421_create_videos_table', 1),
	(49, '2017_12_30_190524_create_taggables_table', 1),
	(50, '2017_12_30_191046_create_tags_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.photos
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.photos: ~0 rows (approximately)
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` (`id`, `path`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
	(1, 'laravel.jpg', 1, 'App\\User', '2017-12-31 02:26:15', '2017-12-31 02:26:15'),
	(2, 'post.jpg', 2, 'App\\Post', '2017-12-31 02:26:15', '2017-12-31 02:26:15');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.posts: ~0 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`, `is_admin`, `deleted_at`) VALUES
	(1, 1, 'asdas', 'sadas', '2017-12-31 02:27:18', '2017-12-31 02:27:19', 0, NULL),
	(2, 2, 'dada', 'dada', '2017-12-31 02:27:18', '2017-12-31 02:27:19', 0, NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'administrator', '2017-12-31 02:27:42', '2017-12-31 02:27:42'),
	(2, 'subscriber', '2017-12-31 02:27:44', '2017-12-31 02:27:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.role_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2017-12-31 02:27:51', '2017-12-31 02:27:51'),
	(2, 2, 2, '2017-12-31 02:27:51', '2017-12-31 02:27:51');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.taggables
CREATE TABLE IF NOT EXISTS `taggables` (
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.taggables: ~0 rows (approximately)
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;
INSERT INTO `taggables` (`tag_id`, `taggable_id`, `taggable_type`) VALUES
	(1, 1, 'App\\Video'),
	(2, 1, 'App\\Post');
/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'JS', '2017-12-31 02:33:50', '2017-12-31 02:33:50'),
	(2, 'PHP', '2017-12-31 02:33:50', '2017-12-31 02:33:50');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `country_id`) VALUES
	(1, 'dani', 'dhanexlab@gmail.com', '123', NULL, '2017-12-31 02:26:54', '2017-12-31 02:26:54', 1),
	(2, 'evin', 'evin@gmail.com', '123', NULL, '2017-12-31 02:26:54', '2017-12-31 02:26:54', 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table laraforbeginnerbecomemaster.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laraforbeginnerbecomemaster.videos: ~0 rows (approximately)
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'indo.mov', '2017-12-31 02:28:34', '2017-12-31 02:28:34'),
	(2, 'indo2.mov', '2017-12-31 02:28:34', '2017-12-31 02:28:34');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
