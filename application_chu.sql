-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 mars 2025 à 12:10
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `application_chu`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `batiments`
--

CREATE TABLE `batiments` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `taille` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `batiments`
--

INSERT INTO `batiments` (`id`, `type`, `taille`, `description`) VALUES
(44, 'radiologie', '222 m²', 'pour les radios');

-- --------------------------------------------------------

--
-- Structure de la table `chefs_service`
--

CREATE TABLE `chefs_service` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motpasse` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `groupe_id` int(11) DEFAULT NULL,
  `date_nomination` date NOT NULL,
  `status` enum('chef_service','chef_groupe') NOT NULL,
  `last_logout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chefs_service`
--

INSERT INTO `chefs_service` (`id`, `nom`, `prenom`, `email`, `motpasse`, `telephone`, `service_id`, `groupe_id`, `date_nomination`, `status`, `last_logout`) VALUES
(15, 'sersif', 'abdeljalil', 'aa123@gmail.com', '123456', '0635829859', NULL, 1, '2025-02-22', 'chef_groupe', '2025-03-10 10:56:46'),
(17, 'sersif', 'anas', 'as@gmail.com', '123456', '0695489581', NULL, 3, '2025-02-22', 'chef_groupe', '2025-03-09 12:31:51'),
(18, 'dahmoni ', 'abdellatif', 'aa12354@gmail.com', '123456', '0654287528', NULL, 2, '2025-03-06', 'chef_groupe', NULL),
(19, 'chahmi', 'nouhail', 'cn123@gmail.com', '123456', '0582458', NULL, NULL, '2025-02-14', 'chef_groupe', NULL),
(20, 'zinb', 'z', 'zz123@gmail.com', '123456', '055596', 1, NULL, '2025-02-16', 'chef_service', NULL),
(21, 'nouhaila ', 'chahmi', 'chahminouhaila4@gmail.com', '123456', '0587485', 15, NULL, '2025-02-07', 'chef_service', NULL),
(22, 'nouha', 'chahmi', 'taharifi9@gmail.com', '123456', '02588448', 2, NULL, '2025-02-22', 'chef_service', '2025-03-10 10:58:10'),
(23, 'zinb', 'z', 'zz22@gmail.com', '123456', '655256562', NULL, 13, '2025-02-21', 'chef_groupe', '2025-02-24 11:23:49');

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

CREATE TABLE `medecins` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `specialite` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_section` int(11) DEFAULT NULL,
  `personnel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`id`, `nom`, `specialite`, `telephone`, `password`, `id_section`, `personnel_id`) VALUES
(1, 'Ahmed Amrani', 'Cardiologue', '0612345678', 'chu', 1, NULL),
(2, 'Fatima Zahra El Youssfi', 'Neurologue', '0623456789', 'chu', NULL, NULL),
(3, 'Mohammed Bouzidi', 'Pédiatre', '0634567890', 'chu', NULL, NULL),
(4, 'Samira El Alaoui', 'Chirurgienne', '0645678901', 'chu', NULL, NULL),
(5, 'Khalid Benjelloun', 'Gynécologue', '0656789012', 'chu', NULL, NULL),
(6, 'Hanane Lahlou', 'Dermatologue', '0667890123', 'chu', NULL, NULL),
(7, 'Rachid El Fassi', 'Orthopédiste', '0678901234', 'chu', NULL, NULL),
(8, 'Salma Idrissi', 'Psychiatre', '0689012345', 'chu', NULL, NULL),
(9, 'Youssef Kabbaj', 'Oncologue', '0690123456', 'chu', NULL, NULL),
(10, 'Hind Moulay', 'Anesthésiste', '0613456789', 'chu', NULL, NULL),
(11, 'Anas Sebti', 'Radiologue', '0624567890', 'chu', NULL, NULL),
(12, 'Meriem Talbi', 'Urgentiste', '0635678901', 'chu', NULL, NULL),
(13, 'Omar Berrada', 'Ophtalmologue', '0646789012', 'chu', NULL, NULL),
(14, 'Sara Chraibi', 'ORL', '0657890123', 'chu', NULL, NULL),
(15, 'Abderrahim Tazi', 'Endocrinologue', '0668901234', 'chu', NULL, NULL),
(16, 'Soukaina El Hachimi', 'Rhumatologue', '0679012345', 'chu', NULL, NULL),
(17, 'Amine Belghiti', 'Urologue', '0680123456', 'chu', NULL, NULL),
(18, 'Laila Outaleb', 'Hématologue', '0691234567', 'chu', NULL, NULL),
(19, 'Nabil Bensalem', 'Pneumologue', '0612345678', 'chu', NULL, NULL),
(20, 'Malika Hamdouch', 'Allergologue', '0623456789', 'chu', NULL, NULL),
(35, 'medecin', 'specialite', '00000000', 'chu', NULL, NULL),
(39, 'a', 'a', 'a', 'chu', 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `send_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `content`, `send_date`) VALUES
(1, 15, 20, 'salam', '2025-02-24 09:26:52'),
(2, 20, 15, 'alikom salam labs elik ', '2025-02-24 09:29:46'),
(3, 22, 23, 'salam zinb wach rak jaya lyum', '2025-02-24 11:22:32'),
(4, 23, 22, 'hhhh la', '2025-02-24 11:23:45'),
(5, 15, 22, 'salam', '2025-03-10 10:56:29');

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_heure` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `medecin_id` int(11) DEFAULT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT 0,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id`, `nom`, `prenom`, `telephone`, `date_heure`, `medecin_id`, `statut`, `section_id`) VALUES
(1, 'aaa', 'qq', '023265965', '2025-03-09 00:57:01', 12, 0, 1),
(2, 'Ahmed', 'Ahmed', '0987654321', '2025-03-09 00:57:01', 2, 0, 1),
(3, 'Zineb', 'Berkaoui', '0745368290', '2025-03-09 00:57:01', 1, 1, NULL),
(4, 'Ali', 'Ali', '0654321098', '2025-03-10 10:43:54', 1, 1, NULL),
(5, 'Mouna', 'Amarcha', '06 33 07 08 09', '2025-03-09 00:57:01', 35, 0, NULL),
(6, 'ch', 'nouha', '1235647891', '2025-03-18 14:00:00', 13, 0, NULL),
(7, 'ch', 'nouha', '1235647891', '2025-03-18 14:00:00', 13, 0, NULL),
(8, 'hah', 'NNN', '0987654323', '2025-03-26 15:30:00', 1, 0, NULL),
(9, 'kk', 'jjj', '1234567890', '2025-03-26 15:30:00', 1, 0, NULL),
(11, 'kk', 'AJ', '09876543211', '2025-03-18 09:00:00', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE `personnels` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `fonction` varchar(100) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personnels`
--

INSERT INTO `personnels` (`id`, `nom`, `prenom`, `fonction`, `telephone`, `email`, `section_id`) VALUES
(1, 'Dupont', 'Jean', 'Médecin', '0612345678', 'jean.dupont@chu.com', 1),
(2, 'Martin', 'Sophie', 'Médecin', '0698765432', 'sophie.martin@chu.com', 2),
(3, 'Durand', 'Paul', 'Infirmier', '0777888999', 'paul.durand@chu.com', 1),
(4, 'Bernard', 'Emma', 'Infirmier', '0655443322', 'emma.bernard@chu.com', 2),
(5, 'Morel', 'Lucas', 'Technicien', '0677554433', 'lucas.morel@chu.com', 1),
(6, 'Lemoine', 'Julie', 'Médecin', '0622334455', 'julie.lemoine@chu.com', 1),
(7, 'Robert', 'Nicolas', 'Infirmier', '0611223344', 'nicolas.robert@chu.com', 1),
(8, 'Petit', 'Laura', 'Secrétaire Médicale', '0688997766', 'laura.petit@chu.com', 2);

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `medecin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sections`
--

INSERT INTO `sections` (`id`, `nom`, `medecin_id`) VALUES
(1, 'section1', 15),
(2, 'section2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `chef_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `nom`, `description`, `type`, `parent_id`, `created_at`, `updated_at`, `chef_id`) VALUES
(1, 'Chirurgie Générale', '                                                                        Service de chirurgie générale et digestive\r\n                                \r\n                                ', 'CHIRURGIE', NULL, '2025-02-14 11:46:52', '2025-02-23 18:00:26', 20),
(2, 'Orthopédie', '                                                                        Service de chirurgie orthopédique\r\n                                \r\n                                ', 'CHIRURGIE', NULL, '2025-02-14 11:46:52', '2025-02-24 11:18:18', 22),
(3, 'Cardiologie', '                                    Service de cardiologie et maladies cardiovasculaires\r\n                                ', 'MEDICAL', NULL, '2025-02-14 11:46:52', '2025-02-23 17:27:36', NULL),
(4, 'Pédiatrie', '                                    Service de médecine pédiatrique\r\n                                ', 'MEDICAL', NULL, '2025-02-14 11:46:52', '2025-02-23 17:31:33', NULL),
(5, 'Urgences Adultes', 'Service d\'accueil des urgences adultes', 'URGENCE', 3, '2025-02-14 11:46:52', '2025-02-14 11:46:52', NULL),
(6, 'SAMU', 'Service d\'aide médicale urgente', 'URGENCE', 3, '2025-02-14 11:46:52', '2025-02-14 11:46:52', NULL),
(7, 'hjhgjjhg', 'yuftdrfyguhjhiuyg', 'ugytyrdfyguhjkhgu', NULL, '2025-02-14 11:47:03', '2025-02-14 11:47:03', NULL),
(9, 'uytrfygu', '87t65rt6fgyuhi', 'hu876f54ert6yg', NULL, '2025-02-14 12:20:46', '2025-02-14 14:45:57', NULL),
(10, 'dcfvgbhn', '                                    \r\n                                cfvf', 'fvgbh', NULL, '2025-02-14 13:51:30', '2025-02-14 13:51:30', NULL),
(11, 'urgence', 'jkhekhghlhkghjhgk', 'batiment ', NULL, '2025-02-14 14:00:40', '2025-02-23 12:54:49', NULL),
(12, 'wertgyh', '                                    \r\n            rgthyjuolp                    ', 'edfrgthyju', NULL, '2025-02-14 14:01:21', '2025-02-14 14:45:48', NULL),
(14, 'uhu', '                                                                        \r\n                  jhgfttfghjk              \r\n                                ', 'juyt', 1, '2025-02-23 18:06:08', '2025-02-23 18:07:18', NULL),
(15, 'S1', '        jsbhjhdku3je                            \r\n                                ', 'S1-type', 3, '2025-02-24 11:17:52', '2025-02-24 11:17:52', 21);

-- --------------------------------------------------------

--
-- Structure de la table `service_groupes`
--

CREATE TABLE `service_groupes` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `chef_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `service_groupes`
--

INSERT INTO `service_groupes` (`id`, `nom`, `description`, `type`, `created_at`, `updated_at`, `chef_id`) VALUES
(1, 'Services Chirurgicaux', '                                                                        Ensemble des services liés à la chirurgie\r\n                                \r\n                                ', 'CHIRURGIE', '2025-02-14 11:46:52', '2025-02-23 17:57:39', 15),
(2, 'Services Médicaux', '                                                                        Services de médecine générale et spécialisée\r\n                                \r\n                                ', 'MEDICAL', '2025-02-14 11:46:52', '2025-02-23 17:57:45', 18),
(3, 'Services d\'Urgence', '                                                                        Services de prise en charge urgente\r\n                                \r\n                                ', 'URGENCE', '2025-02-14 11:46:52', '2025-02-23 17:57:53', 17),
(13, 'Z-group', '              Zinb Group                  \r\n                                ', 'batiment ', '2025-02-24 11:20:46', '2025-02-24 11:20:46', 23);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `batiments`
--
ALTER TABLE `batiments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chefs_service`
--
ALTER TABLE `chefs_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `groupe_id` (`groupe_id`);

--
-- Index pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_medecins_section` (`id_section`),
  ADD KEY `personnel_id` (`personnel_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medecin_id` (`medecin_id`),
  ADD KEY `fk_section` (`section_id`);

--
-- Index pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `section_id` (`section_id`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD KEY `medecin_id` (`medecin_id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_service_parent` (`parent_id`),
  ADD KEY `idx_service_nom` (`nom`),
  ADD KEY `fk_service_chef` (`chef_id`);

--
-- Index pour la table `service_groupes`
--
ALTER TABLE `service_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupe_nom` (`nom`),
  ADD KEY `fk_groupe_chef` (`chef_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `batiments`
--
ALTER TABLE `batiments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `chefs_service`
--
ALTER TABLE `chefs_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `personnels`
--
ALTER TABLE `personnels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `service_groupes`
--
ALTER TABLE `service_groupes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chefs_service`
--
ALTER TABLE `chefs_service`
  ADD CONSTRAINT `chefs_service_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `chefs_service_ibfk_2` FOREIGN KEY (`groupe_id`) REFERENCES `service_groupes` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD CONSTRAINT `fk_medecins_section` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `medecins_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnels` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `chefs_service` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `chefs_service` (`id`);

--
-- Contraintes pour la table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_service_chef` FOREIGN KEY (`chef_id`) REFERENCES `chefs_service` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `service_groupes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `service_groupes`
--
ALTER TABLE `service_groupes`
  ADD CONSTRAINT `fk_groupe_chef` FOREIGN KEY (`chef_id`) REFERENCES `chefs_service` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
