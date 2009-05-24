-- phpMyAdmin SQL Dump
-- version 2.9.1.1-Debian-10
-- http://www.phpmyadmin.net
-- 
-- Serveur: localhost
-- Généré le : Jeudi 14 Mai 2009 à 13:36
-- Version du serveur: 5.0.32
-- Version de PHP: 5.2.6-3
-- 
-- Base de données: `japac_development`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `contacts`
-- 

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL auto_increment,
  `team_left` text,
  `team_center` text,
  `team_right` text,
  `hardware_left` text,
  `hardware_center` text,
  `hardware_right` text,
  `contact` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Contenu de la table `contacts`
-- 

INSERT INTO `contacts` (`id`, `team_left`, `team_center`, `team_right`, `hardware_left`, `hardware_center`, `hardware_right`, `contact`, `created_at`, `updated_at`) VALUES 
(1, '', '', '', '', '', '', 'Japac Architecture\r\nParc de la Vatine\r\n6 rue AndreÃ¯ Sakharov B.P. 54\r\n76131 Mont Saint Aignan Cedex\r\nFrance\r\nTel : +33(0)2 35 59 64 40\r\nFax : +33(0)2 35 60 50 20\r\nCourriel : japac@japac.fr\r\nSite Web : http://www.japac.fr', NULL, '2009-04-27 09:45:48');

-- --------------------------------------------------------

-- 
-- Structure de la table `events`
-- 

CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `date` date default NULL,
  `kind` text,
  `column_left` text,
  `column_center` text,
  `column_right` text,
  `reference_id` int(11) default NULL,
  `location_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- Contenu de la table `events`
-- 

INSERT INTO `events` (`id`, `name`, `date`, `kind`, `column_left`, `column_center`, `column_right`, `reference_id`, `location_name`) VALUES 
(1, 'Premiere actu', '2009-07-01', 'inauguration', '+_*Test*_+', ' * Toto\n * Tata\n * Titi', ' # Riri\n # Fifi\n # Loulou', 3, 'Rouen'),
(5, 'Centre aquatique', '2009-04-01', 'inauguration', NULL, NULL, NULL, 7, 'Strasbourg'),
(6, 'Le minisre est lÃ ', '2002-04-01', 'inauguration', NULL, NULL, NULL, NULL, 'Toulouse');

-- --------------------------------------------------------

-- 
-- Structure de la table `locations`
-- 

CREATE TABLE `locations` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `lat` float default NULL,
  `lng` float default NULL,
  `full_address` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- Contenu de la table `locations`
-- 

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`, `lat`, `lng`, `full_address`) VALUES 
(8, 'Lorient', '2009-04-28 20:53:17', '2009-05-11 16:42:50', 49.4424, 1.09849, 'Rouen, France'),
(9, 'Strasbourg', '2009-04-30 20:48:40', '2009-04-30 20:48:40', 48.5829, 7.74375, 'Strasbourg, France');

-- --------------------------------------------------------

-- 
-- Structure de la table `news`
-- 

CREATE TABLE `news` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `date` date default NULL,
  `city_id` int(11) default NULL,
  `photo_id` int(11) default NULL,
  `column_left` text,
  `column_center` text,
  `column_right` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Contenu de la table `news`
-- 


-- --------------------------------------------------------

-- 
-- Structure de la table `photos`
-- 

CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `attachable_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `attachable_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

-- 
-- Contenu de la table `photos`
-- 

INSERT INTO `photos` (`id`, `attachable_id`, `parent_id`, `content_type`, `filename`, `thumbnail`, `size`, `width`, `height`, `created_at`, `updated_at`, `attachable_type`) VALUES 
(42, 1, NULL, 'image/jpeg', 'Angouleme1.jpg', NULL, 324359, 800, 414, '2009-04-28 15:41:16', '2009-04-28 15:41:16', 'Event'),
(43, NULL, 42, 'image/jpeg', 'Angouleme1_small.jpg', 'small', 16649, 150, 78, '2009-04-28 15:41:16', '2009-04-28 15:41:16', NULL),
(44, NULL, 42, 'image/jpeg', 'Angouleme1_thumb.jpg', 'thumb', 21580, 174, 90, '2009-04-28 15:41:17', '2009-04-28 15:41:17', NULL),
(45, NULL, 42, 'image/jpeg', 'Angouleme1_medium.jpg', 'medium', 41272, 250, 129, '2009-04-28 15:41:17', '2009-04-28 15:41:17', NULL),
(46, 1, NULL, 'image/jpeg', 'Angouleme1.jpg', NULL, 324359, 800, 414, '2009-04-28 15:41:43', '2009-04-28 15:41:43', 'Event'),
(47, NULL, 46, 'image/jpeg', 'Angouleme1_small.jpg', 'small', 16649, 150, 78, '2009-04-28 15:41:44', '2009-04-28 15:41:44', NULL),
(48, NULL, 46, 'image/jpeg', 'Angouleme1_thumb.jpg', 'thumb', 21580, 174, 90, '2009-04-28 15:41:44', '2009-04-28 15:41:44', NULL),
(49, NULL, 46, 'image/jpeg', 'Angouleme1_medium.jpg', 'medium', 41272, 250, 129, '2009-04-28 15:41:44', '2009-04-28 15:41:44', NULL),
(86, 7, NULL, 'image/jpeg', 'neon1.jpg', NULL, 350731, 800, 534, '2009-04-28 20:54:08', '2009-04-28 20:54:08', 'Reference'),
(87, NULL, 86, 'image/jpeg', 'neon1_small.jpg', 'small', 21190, 150, 100, '2009-04-28 20:54:08', '2009-04-28 20:54:08', NULL),
(88, NULL, 86, 'image/jpeg', 'neon1_thumb.jpg', 'thumb', 18204, 135, 90, '2009-04-28 20:54:09', '2009-04-28 20:54:09', NULL),
(89, NULL, 86, 'image/jpeg', 'neon1_medium.jpg', 'medium', 38754, 225, 150, '2009-04-28 20:54:09', '2009-04-28 20:54:09', NULL),
(102, 5, NULL, 'image/jpeg', 'Angouleme1.jpg', NULL, 324359, 800, 414, '2009-04-28 21:17:34', '2009-04-28 21:17:34', 'Event'),
(103, NULL, 102, 'image/jpeg', 'Angouleme1_small.jpg', 'small', 16649, 150, 78, '2009-04-28 21:17:34', '2009-04-28 21:17:34', NULL),
(104, NULL, 102, 'image/jpeg', 'Angouleme1_thumb.jpg', 'thumb', 21580, 174, 90, '2009-04-28 21:17:35', '2009-04-28 21:17:35', NULL),
(105, NULL, 102, 'image/jpeg', 'Angouleme1_medium.jpg', 'medium', 41272, 250, 129, '2009-04-28 21:17:35', '2009-04-28 21:17:35', NULL),
(106, 6, NULL, 'image/jpeg', 'neon1.jpg', NULL, 350731, 800, 534, '2009-04-28 21:18:10', '2009-04-28 21:18:10', 'Event'),
(107, NULL, 106, 'image/jpeg', 'neon1_small.jpg', 'small', 21190, 150, 100, '2009-04-28 21:18:10', '2009-04-28 21:18:10', NULL),
(108, NULL, 106, 'image/jpeg', 'neon1_thumb.jpg', 'thumb', 18204, 135, 90, '2009-04-28 21:18:10', '2009-04-28 21:18:10', NULL),
(109, NULL, 106, 'image/jpeg', 'neon1_medium.jpg', 'medium', 38754, 225, 150, '2009-04-28 21:18:10', '2009-04-28 21:18:10', NULL),
(110, 8, NULL, 'image/jpeg', '03_07_juillet__05_Angouleme028.jpg', NULL, 443196, 800, 600, '2009-04-30 20:48:55', '2009-04-30 20:48:55', 'Reference'),
(111, NULL, 110, 'image/jpeg', '03_07_juillet__05_Angouleme028_small.jpg', 'small', 24118, 150, 113, '2009-04-30 20:48:55', '2009-04-30 20:48:55', NULL),
(112, NULL, 110, 'image/jpeg', '03_07_juillet__05_Angouleme028_thumb.jpg', 'thumb', 17593, 120, 90, '2009-04-30 20:48:55', '2009-04-30 20:48:55', NULL),
(113, NULL, 110, 'image/jpeg', '03_07_juillet__05_Angouleme028_medium.jpg', 'medium', 38328, 200, 150, '2009-04-30 20:48:55', '2009-04-30 20:48:55', NULL);

-- --------------------------------------------------------

-- 
-- Structure de la table `publications`
-- 

CREATE TABLE `publications` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `date` date default NULL,
  `parent_id` int(11) default NULL,
  `content_type` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `size` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Contenu de la table `publications`
-- 

INSERT INTO `publications` (`id`, `name`, `description`, `date`, `parent_id`, `content_type`, `filename`, `thumbnail`, `size`, `width`, `height`) VALUES 
(1, 'Toto', 'Zazaza', '2003-04-01', NULL, 'image/jpeg', 'Angouleme1.jpg', NULL, 337800, 800, 414),
(2, 'Publication 2', 'Une belle description', '2005-08-01', NULL, 'image/jpeg', 'neon1.jpg', NULL, 366337, 800, 534);

-- --------------------------------------------------------

-- 
-- Structure de la table `references`
-- 

CREATE TABLE `references` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `column_left` text,
  `column_center` text,
  `column_right` text,
  `location_id` int(11) default NULL,
  `size` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- Contenu de la table `references`
-- 

INSERT INTO `references` (`id`, `name`, `column_left`, `column_center`, `column_right`, `location_id`, `size`) VALUES 
(7, 'Centre aquatique', '_Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna. Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet._', '_Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna. Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet._', '_Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna. Aliquam convallis sollicitudin purus. Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis, lorem vel rhoncus faucibus, felis magna fermentum augue, et ultricies lacus lorem varius purus. Curabitur eu amet._', 8, 5700),
(8, 'Belle piscine', '', '', '', 9, 3400);

-- --------------------------------------------------------

-- 
-- Structure de la table `schema_migrations`
-- 

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Contenu de la table `schema_migrations`
-- 

INSERT INTO `schema_migrations` (`version`) VALUES 
('20080919134243'),
('20080919134812'),
('20080919161509'),
('20080919162533'),
('20080919193930'),
('20080921145544'),
('20080925171702'),
('20080925171855'),
('20080928151148'),
('20081001193747'),
('20081001203123'),
('20081001205232'),
('20081001211741'),
('20081022194440'),
('20081108210040'),
('20081109205005'),
('20081110135855'),
('20081110160522'),
('20081111132154'),
('20081111140625'),
('20081111140833'),
('20081111140954'),
('20081111225949'),
('20081112115339'),
('20081112183719'),
('20081112200919'),
('20081218181925'),
('20081229193449'),
('20081229201601'),
('20090327200902'),
('20090328102921'),
('20090328104200'),
('20090328105246'),
('20090328130048'),
('20090328153736'),
('20090328155824'),
('20090423161609'),
('20090423162115'),
('20090423163704'),
('20090423164730');

-- --------------------------------------------------------

-- 
-- Structure de la table `users`
-- 

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Contenu de la table `users`
-- 

INSERT INTO `users` (`id`, `login`, `email`, `crypted_password`, `salt`, `created_at`, `updated_at`, `remember_token`, `remember_token_expires_at`) VALUES 
(1, 'rvork', 'olivier.sarrouy@gmail.com', '4560899f662b091bd0adc33a237e0d2dd0eee39b', 'a2d53badae20cb9adf5749eeb2831d81765212ee', '2009-04-21 11:13:13', '2009-04-23 16:20:11', '3aef549fe9cc14336cddaa6671cce7fc7e094141', '2009-05-07 16:20:11');
