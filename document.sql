-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 07 Juin 2016 à 10:58
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `accueil`
--

INSERT INTO `accueil` (`id`, `description_nl`, `description_fr`, `updated_at`, `created_at`, `entete_fr`, `entete_nl`) VALUES
(1, 'je suis description en NL', 'je suis description en FR', '2016-06-07 08:38:37', '0000-00-00 00:00:00', 'Participez à notre concours pour tenter de gagner un bon de 50€ !\r\n', 'Doe mee aan onze wedstrijd om te proberen een 50 € te winnen!');

-- --------------------------------------------------------

--
-- Structure de la table `concours`
--

CREATE TABLE IF NOT EXISTS `concours` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `concours_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `concours`
--

INSERT INTO `concours` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'jean@fred.fr', '2016-06-04 07:29:15', '2016-06-04 07:29:15'),
(2, 'ge@frg.ju', '2016-06-06 21:06:25', '2016-06-06 21:06:25');

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
('2016_06_03_174521_create_user_video_table', 3),
('2016_06_03_232705_concours', 4);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_adresseip_unique` (`adresseIp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `totalVoteDuJour`, `adresseIp`, `created_at`, `updated_at`) VALUES
(1, 0, '::1', '2016-06-03 05:09:52', '2016-06-07 06:57:31');

-- --------------------------------------------------------

--
-- Structure de la table `users_membre`
--

CREATE TABLE IF NOT EXISTS `users_membre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_membre_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aime` int(11) NOT NULL,
  `titre_fr` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `titre_nl` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `description_fr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_nl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `videos`
--

INSERT INTO `videos` (`id`, `aime`, `titre_fr`, `titre_nl`, `description_fr`, `description_nl`, `url`, `created_at`, `updated_at`) VALUES
(1, 0, 'Titre video 1', 'Titel video 1', 'Description video 1', 'Beschrijving video 1', 'https://www.youtube.com/embed/8B_7AFYmkYo', NULL, '2016-06-07 06:57:28'),
(2, 0, 'Titre video 2', 'titel video 2', 'Description video 2 ', 'Beschrijving video 2', 'https://www.youtube.com/embed/rOR_-S3yYnQ', NULL, '2016-06-07 06:57:31');

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
