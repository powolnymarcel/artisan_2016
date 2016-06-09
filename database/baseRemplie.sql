-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 09 Juin 2016 à 02:08
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `artisan`
--

-- --------------------------------------------------------

--
-- Structure de la table `accueil`
--

CREATE TABLE IF NOT EXISTS `accueil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description_nl` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `description_fr` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `entete_fr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entete_nl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_header_nl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_header_fr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sous_titre_nl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sous_titre_fr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `accueil`
--

INSERT INTO `accueil` (`id`, `description_nl`, `description_fr`, `updated_at`, `created_at`, `entete_fr`, `entete_nl`, `image_header_nl`, `image_header_fr`, `sous_titre_nl`, `sous_titre_fr`) VALUES
(1, 'je suis description en NL', 'je suis description en FR', '2016-06-07 16:01:51', '2016-06-07 08:38:37', 'Participez à notre concours pour tenter de gagner un bon de 50€ !\r\n', 'Doe mee aan onze wedstrijd om te proberen een 50 € te winnen!', 'artisan_nl.jpg', 'artisan_fr.jpg', 'Stem op de artisanale 2016 kiezen:', 'Votez pour élire l''artisan 2016:');

-- --------------------------------------------------------

--
-- Structure de la table `concours`
--

CREATE TABLE IF NOT EXISTS `concours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Contenu de la table `concours`
--

INSERT INTO `concours` (`id`, `email`, `updated_at`, `created_at`) VALUES
(1, 'jean@fred.fr', '2016-06-04 15:56:14', '2016-06-04 15:56:14'),
(2, 'michel.dedale@gmail.com', '2016-06-04 16:01:46', '2016-06-04 16:01:46'),
(3, 'benfarris40@gmail.com', '2016-06-04 16:02:34', '2016-06-04 16:02:34'),
(4, 'cicciofarris@hotmail.com', '2016-06-04 16:09:07', '2016-06-04 16:09:07'),
(6, 'jean@fred.com', '2016-06-04 17:19:01', '2016-06-04 17:19:01'),
(7, 'jean2@fred.fr', '2016-06-06 05:48:36', '2016-06-06 05:48:36'),
(8, 'benoitduplain@yahoo.com', '2016-06-06 08:54:38', '2016-06-06 08:54:38'),
(9, 'melaniegrete@gmail.com', '2016-06-07 09:16:56', '2016-06-07 09:16:56'),
(10, 'bill@bill.com', '2016-06-07 09:16:56', '2016-06-07 09:16:56'),
(11, 'marcel@marcel.com', '2016-06-07 13:42:47', '2016-06-07 13:42:47');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_06_02_225613_users', 1),
('2016_06_02_225620_videos', 1),
('2016_06_03_072207_user_video', 2),
('2016_06_03_174521_create_user_video_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `totalVoteDuJour` int(11) NOT NULL,
  `adresseIp` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_adresseip_unique` (`adresseIp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `totalVoteDuJour`, `adresseIp`, `created_at`, `updated_at`, `email`) VALUES
(1, 3, '::1', '2016-06-03 05:09:52', '2016-06-08 10:40:42', ''),
(2, 0, '95.182.237.84', '2016-06-03 18:49:02', '2016-06-06 20:54:10', ''),
(3, 0, '109.89.113.208', '2016-06-03 18:58:48', '2016-06-03 19:55:42', ''),
(4, 0, '173.252.88.94', '2016-06-03 19:09:24', '2016-06-03 19:09:24', ''),
(5, 0, '91.180.197.53', '2016-06-04 05:17:58', '2016-06-04 08:11:09', ''),
(6, 0, '91.180.19.205', '2016-06-04 15:52:15', '2016-06-04 15:54:10', ''),
(7, 0, '62.197.67.103', '2016-06-06 05:40:37', '2016-06-07 09:03:40', ''),
(8, 0, '31.13.102.107', '2016-06-06 17:20:37', '2016-06-06 17:20:37', ''),
(9, 0, '213.246.242.26', '2016-06-07 05:37:15', '2016-06-07 05:37:15', ''),
(10, 0, '150.70.173.48', '2016-06-07 05:38:40', '2016-06-07 05:38:40', ''),
(11, 0, '91.179.14.71', '2016-06-07 07:50:46', '2016-06-07 07:50:46', ''),
(17, 0, '109.88.56.207', '2016-06-07 13:48:26', '2016-06-07 13:50:31', '');

-- --------------------------------------------------------

--
-- Structure de la table `users_membre`
--

CREATE TABLE IF NOT EXISTS `users_membre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_membre_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users_membre`
--

INSERT INTO `users_membre` (`id`, `name`, `email`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$ADUGtbSrC41znIEfW6ahiuariBio6/JSvxQ6NTQQ18pn/bxokBUti', 1, 'TQsDP6d09Tt0PNx9pQZqOt4dpntCwREchYWvwYcFm2W8XGzFyr2pPsWeuWKY', '2016-06-08 11:18:05', '2016-06-08 21:26:18');

-- --------------------------------------------------------

--
-- Structure de la table `users_videos`
--

CREATE TABLE IF NOT EXISTS `users_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `videos_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_video_users_id_foreign` (`users_id`),
  KEY `user_video_videos_id_foreign` (`videos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aime` int(11) NOT NULL,
  `titre_fr` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description_fr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titre_nl` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `description_nl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `videos`
--

INSERT INTO `videos` (`id`, `aime`, `titre_fr`, `description_fr`, `url`, `created_at`, `updated_at`, `titre_nl`, `description_nl`) VALUES
(1, 11, 'Titre video 1', 'Description video 1', 'https://www.youtube.com/embed/8B_7AFYmkYo', NULL, '2016-06-08 21:17:27', 'Title video 1', 'Beschrijving video 1'),
(2, 27, 'Titre video 2', 'Description video 2 ', 'https://www.youtube.com/embed/rOR_-S3yYnQ', NULL, '2016-06-08 10:40:38', 'Title video 2', 'Beschrijving video 2'),
(3, 49, 'Titre video 3', 'Description video 3', 'https://www.youtube.com/embed/v0aGVzcaFgw', NULL, '2016-06-08 10:40:42', 'Title video 3', 'Beschrijving video 3'),
(4, 9, 'Titre video 4', 'Description video 4', 'https://www.youtube.com/embed/kGtWBw7IkMM', NULL, '2016-06-08 10:37:00', 'Title video 4', 'Beschrijving video 4');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `users_videos`
--
ALTER TABLE `users_videos`
  ADD CONSTRAINT `user_video_videos_id_foreign` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`),
  ADD CONSTRAINT `user_video_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
