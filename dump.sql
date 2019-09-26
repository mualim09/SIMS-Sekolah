-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 27, 2019 at 06:26 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `schoolhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_data`
--

CREATE TABLE `attendance_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_students` bigint(20) UNSIGNED NOT NULL,
  `id_attendance` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Hadir','Tidak Hadir','Dispensasi','Izin','Sakit','Absen') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_categories` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `has_meta` tinyint(1) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_comments`
--

CREATE TABLE `blog_post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_likes`
--

CREATE TABLE `blog_post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_metas`
--

CREATE TABLE `blog_post_metas` (
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_tags`
--

CREATE TABLE `blog_post_tags` (
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `id_tag` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kantin_inventories`
--

CREATE TABLE `kantin_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_shop` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kantin_payments`
--

CREATE TABLE `kantin_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_seller` bigint(20) UNSIGNED NOT NULL,
  `id_buyer` bigint(20) UNSIGNED NOT NULL,
  `id_inventory` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kantin_shops`
--

CREATE TABLE `kantin_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_owner` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kesiswaan_events`
--

CREATE TABLE `kesiswaan_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kesiswaan_reports`
--

CREATE TABLE `kesiswaan_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `id_student` bigint(20) UNSIGNED NOT NULL,
  `id_violation` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Tervalidasi','Belum Tervalidasi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kesiswaan_violation`
--

CREATE TABLE `kesiswaan_violation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_07_25_01_create_roles_table', 1),
(3, '2019_07_25_02_create_users_table', 1),
(4, '2019_07_25_03_create_users_data_table', 1),
(5, '2019_07_25_04_create_users_session_table', 1),
(6, '2019_07_25_05_create_rooms_table', 1),
(7, '2019_07_25_06_create_subjects_table', 1),
(8, '2019_07_25_07_create_teachers_table', 1),
(9, '2019_07_25_08_create_class_table', 1),
(10, '2019_07_25_09_create_notes_table', 1),
(11, '2019_07_25_10_create_students_table', 1),
(12, '2019_07_25_11_create_attendance_table', 1),
(13, '2019_07_25_12_create_attendance_data_table', 1),
(14, '2019_07_25_13_create_teaching_data_table', 1),
(15, '2019_07_25_14_create_teaching_attendance_table', 1),
(16, '2019_07_25_15_create_student_grade_table', 1),
(17, '2019_07_25_16_create_blog_categories_table', 1),
(18, '2019_07_25_17_create_blog_tags_table', 1),
(19, '2019_07_25_18_create_blog_posts_table', 1),
(20, '2019_07_25_19_create_blog_post_metas_table', 1),
(21, '2019_07_25_20_create_blog_post_tags_table', 1),
(22, '2019_07_25_21_create_blog_post_likes_table', 1),
(23, '2019_07_25_22_create_blog_post_comments_table', 1),
(24, '2019_07_25_23_create_sarpras_inventories_table', 1),
(25, '2019_07_25_24_create_sarpras_borrower_table', 1),
(26, '2019_07_25_25_create_kesiswaan_events_table', 1),
(27, '2019_07_25_26_create_kesiswaan_violation_table', 1),
(28, '2019_07_25_27_create_kesiswaan_reports_table', 1),
(29, '2019_07_25_28_create_kantin_shops_table', 1),
(30, '2019_07_25_29_create_kantin_inventories_table', 1),
(31, '2019_07_25_30_create_kantin_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `id_class` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(2, 'Admin Kesiswaan', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(3, 'Admin Kurikulum', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(4, 'Admin Sarpras', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(5, 'Admin Kantin', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(6, 'Guru', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(7, 'Siswa', '2019-07-26 23:24:54', '2019-07-26 23:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sarpras_borrower`
--

CREATE TABLE `sarpras_borrower` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_inventory` bigint(20) UNSIGNED NOT NULL,
  `id_room` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Belum Dikembalikan','Dikembalikan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sarpras_inventories`
--

CREATE TABLE `sarpras_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Dipinjam','Tersedia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nipd` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_class` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_grade`
--

CREATE TABLE `student_grade` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teaching` bigint(20) UNSIGNED NOT NULL,
  `id_students` bigint(20) UNSIGNED NOT NULL,
  `section` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('C1','C2','C3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_attendance`
--

CREATE TABLE `teaching_attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teaching` bigint(20) UNSIGNED NOT NULL,
  `section` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Hadir','Tidak Hadir','Dispensasi','Izin','Sakit','Absen') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_data`
--

CREATE TABLE `teaching_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `id_class` bigint(20) UNSIGNED NOT NULL,
  `id_subject` bigint(20) UNSIGNED NOT NULL,
  `id_room` bigint(20) UNSIGNED NOT NULL,
  `time_in` timestamp NULL DEFAULT NULL,
  `time_out` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int(11) NOT NULL,
  `role` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `email`, `username`, `password`, `balance`, `role`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'administrator.png', 'admin@starbhak.com', 'administrator', '$2y$10$9fAs/3iPccx4ywhijs41peR6tmtoUbMNdOv0EIVEuA5ReV3iBKtNe', 0, 1, NULL, NULL, '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(2, 'admin-kesiswaan.png', 'admin-kesiswaan@starbhak.com', 'adminkesiswaan', '$2y$10$vTRQ6ltfvBBDY7HtC/BwsOugmhEIB4RZgEe1vmnFXD7Tp6rVB6eRS', 0, 2, NULL, NULL, '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(3, 'admin-kurikulum.png', 'admin-kurikulum@starbhak.com', 'adminkurikulum', '$2y$10$za2aionjhOJq7IsOrfU7Ae7Ku1zaZxp7fwXRu5CK5l0cj3DNwonh2', 0, 3, NULL, NULL, '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(4, 'admin-sarpras.png', 'admin-sarpras@starbhak.com', 'adminsarpras', '$2y$10$JPIJj5n68zY2clUOAF2zrevPacwYstdy3IquTnyEBHRzoiamD5Fom', 0, 4, NULL, NULL, '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(5, 'admin-kantin.png', 'admin-kantin@starbhak.com', 'adminkantin', '$2y$10$YqN8of.7GmYgSLgnpFIpMuNID6AZ2IbKGglOUBUE9lhzl4vDeIp6S', 0, 5, NULL, NULL, '2019-07-26 23:24:54', '2019-07-26 23:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `users_data`
--

CREATE TABLE `users_data` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Laki-laki','Perempuan','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `religion` enum('Islam','Kristen Prostan','Katolik','Buddha','Hindu','Kong Hu Chu','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthplace` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_data`
--

INSERT INTO `users_data` (`id_user`, `name`, `gender`, `religion`, `birthplace`, `dob`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '0', '0', '0', '1970-01-01', '0', '0', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(2, 'Admin Kesiswaan', '0', '0', '0', '1970-01-01', '0', '0', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(3, 'Admin Kurikulum', '0', '0', '0', '1970-01-01', '0', '0', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(4, 'Admin Sarpras', '0', '0', '0', '1970-01-01', '0', '0', '2019-07-26 23:24:54', '2019-07-26 23:24:54'),
(5, 'Admin Kantin', '0', '0', '0', '1970-01-01', '0', '0', '2019-07-26 23:24:54', '2019-07-26 23:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imei` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_blog_posts`
-- (See below for the actual view)
--
CREATE TABLE `v_blog_posts` (
`id` bigint(20) unsigned
,`categories` mediumtext
,`user` varchar(100)
,`has_meta` tinyint(1)
,`title` text
,`headline` text
,`content` text
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_blog_post_comment`
-- (See below for the actual view)
--
CREATE TABLE `v_blog_post_comment` (
`id` bigint(20) unsigned
,`users` varchar(100)
,`posts` mediumtext
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_blog_post_tags`
-- (See below for the actual view)
--
CREATE TABLE `v_blog_post_tags` (
`id_post` bigint(20) unsigned
,`tag` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_class`
-- (See below for the actual view)
--
CREATE TABLE `v_class` (
`id` bigint(20) unsigned
,`teacher` varchar(100)
,`name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kantin_payments`
-- (See below for the actual view)
--
CREATE TABLE `v_kantin_payments` (
`id` bigint(20) unsigned
,`shop` varchar(100)
,`customer` varchar(100)
,`item` varchar(100)
,`qty` int(11)
,`total` int(11)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kantin_shops`
-- (See below for the actual view)
--
CREATE TABLE `v_kantin_shops` (
`id` bigint(20) unsigned
,`owner` varchar(100)
,`name` varchar(100)
,`image` text
,`description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kesiswaan_reports`
-- (See below for the actual view)
--
CREATE TABLE `v_kesiswaan_reports` (
`id` bigint(20) unsigned
,`teacher` varchar(100)
,`student` varchar(100)
,`violation` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_notes`
-- (See below for the actual view)
--
CREATE TABLE `v_notes` (
`teacher` varchar(100)
,`class` varchar(50)
,`text` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sarpras_borrower`
-- (See below for the actual view)
--
CREATE TABLE `v_sarpras_borrower` (
`id` bigint(20) unsigned
,`user` varchar(100)
,`item` mediumtext
,`room` varchar(100)
,`status` enum('Belum Dikembalikan','Dikembalikan')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_students`
-- (See below for the actual view)
--
CREATE TABLE `v_students` (
`id_user` bigint(20) unsigned
,`name` varchar(100)
,`nipd` varchar(20)
,`nisn` varchar(20)
,`class` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_student_grade`
-- (See below for the actual view)
--
CREATE TABLE `v_student_grade` (
`id` bigint(20) unsigned
,`students` varchar(100)
,`section` text
,`section_name` text
,`score` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teachers`
-- (See below for the actual view)
--
CREATE TABLE `v_teachers` (
`id_user` bigint(20) unsigned
,`name` varchar(100)
,`nip` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teaching_data`
-- (See below for the actual view)
--
CREATE TABLE `v_teaching_data` (
`id` bigint(20) unsigned
,`teacher` varchar(100)
,`day` int(11)
,`class` varchar(50)
,`subject` varchar(100)
,`time_in` timestamp
,`time_out` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `v_blog_posts`
--
DROP TABLE IF EXISTS `v_blog_posts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_blog_posts`  AS  (select `blog_posts`.`id` AS `id`,(select `blog_categories`.`name` from `blog_categories` where (`blog_categories`.`id` = `blog_posts`.`id_categories`)) AS `categories`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `blog_posts`.`id_user`)) AS `user`,`blog_posts`.`has_meta` AS `has_meta`,`blog_posts`.`title` AS `title`,`blog_posts`.`headline` AS `headline`,`blog_posts`.`content` AS `content`,`blog_posts`.`created_at` AS `created_at`,`blog_posts`.`updated_at` AS `updated_at` from `blog_posts`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_blog_post_comment`
--
DROP TABLE IF EXISTS `v_blog_post_comment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_blog_post_comment`  AS  (select `blog_post_comments`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `blog_post_comments`.`id_user`)) AS `users`,(select `blog_posts`.`title` from `blog_posts` where (`blog_posts`.`id` = `blog_post_comments`.`id_post`)) AS `posts`,`blog_post_comments`.`created_at` AS `created_at`,`blog_post_comments`.`updated_at` AS `updated_at` from `blog_post_comments`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_blog_post_tags`
--
DROP TABLE IF EXISTS `v_blog_post_tags`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_blog_post_tags`  AS  (select `blog_post_tags`.`id_post` AS `id_post`,(select `blog_tags`.`name` from `blog_tags` where (`blog_tags`.`id` = `blog_post_tags`.`id_tag`)) AS `tag` from `blog_post_tags`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_class`
--
DROP TABLE IF EXISTS `v_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_class`  AS  (select `class`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `class`.`id_teacher`)) AS `teacher`,`class`.`name` AS `name` from `class`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kantin_payments`
--
DROP TABLE IF EXISTS `v_kantin_payments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kantin_payments`  AS  (select `kantin_payments`.`id` AS `id`,(select `kantin_shops`.`name` from `kantin_shops` where (`kantin_shops`.`id_owner` = `kantin_payments`.`id_seller`)) AS `shop`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kantin_payments`.`id_buyer`)) AS `customer`,(select `kantin_inventories`.`name` from `kantin_inventories` where (`kantin_inventories`.`id` = `kantin_payments`.`id_inventory`)) AS `item`,`kantin_payments`.`qty` AS `qty`,`kantin_payments`.`total` AS `total`,`kantin_payments`.`created_at` AS `created_at`,`kantin_payments`.`updated_at` AS `updated_at` from `kantin_payments`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kantin_shops`
--
DROP TABLE IF EXISTS `v_kantin_shops`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kantin_shops`  AS  (select `kantin_shops`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kantin_shops`.`id_owner`)) AS `owner`,`kantin_shops`.`name` AS `name`,`kantin_shops`.`image` AS `image`,`kantin_shops`.`description` AS `description` from `kantin_shops`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kesiswaan_reports`
--
DROP TABLE IF EXISTS `v_kesiswaan_reports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kesiswaan_reports`  AS  (select `kesiswaan_reports`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kesiswaan_reports`.`id_teacher`)) AS `teacher`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kesiswaan_reports`.`id_student`)) AS `student`,(select `kesiswaan_violation`.`name` from `kesiswaan_violation` where (`kesiswaan_violation`.`id` = `kesiswaan_reports`.`id_violation`)) AS `violation` from `kesiswaan_reports`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_notes`
--
DROP TABLE IF EXISTS `v_notes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_notes`  AS  (select (select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `notes`.`id_teacher`)) AS `teacher`,(select `class`.`name` from `class` where (`class`.`id` = `notes`.`id_class`)) AS `class`,`notes`.`text` AS `text` from `notes`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_sarpras_borrower`
--
DROP TABLE IF EXISTS `v_sarpras_borrower`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sarpras_borrower`  AS  (select `sarpras_borrower`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `sarpras_borrower`.`id_user`)) AS `user`,(select `sarpras_inventories`.`name` from `sarpras_inventories` where (`sarpras_inventories`.`id` = `sarpras_borrower`.`id_inventory`)) AS `item`,(select `rooms`.`alias` from `rooms` where (`rooms`.`id` = `sarpras_borrower`.`id_room`)) AS `room`,`sarpras_borrower`.`status` AS `status` from `sarpras_borrower`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_students`
--
DROP TABLE IF EXISTS `v_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_students`  AS  (select `students`.`id_user` AS `id_user`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `students`.`id_user`)) AS `name`,`students`.`nipd` AS `nipd`,`students`.`nisn` AS `nisn`,(select `class`.`name` from `class` where (`class`.`id` = `students`.`id_class`)) AS `class` from `students`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_student_grade`
--
DROP TABLE IF EXISTS `v_student_grade`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_student_grade`  AS  (select `student_grade`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `student_grade`.`id_students`)) AS `students`,`student_grade`.`section` AS `section`,`student_grade`.`section_name` AS `section_name`,`student_grade`.`score` AS `score` from `student_grade`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_teachers`
--
DROP TABLE IF EXISTS `v_teachers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teachers`  AS  (select `teachers`.`id_user` AS `id_user`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `teachers`.`id_user`)) AS `name`,`teachers`.`nip` AS `nip` from `teachers`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_teaching_data`
--
DROP TABLE IF EXISTS `v_teaching_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teaching_data`  AS  (select `teaching_data`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `teaching_data`.`id_teacher`)) AS `teacher`,`teaching_data`.`day` AS `day`,(select `class`.`name` from `class` where (`class`.`id` = `teaching_data`.`id_class`)) AS `class`,(select `subjects`.`name` from `subjects` where (`subjects`.`id` = `teaching_data`.`id_subject`)) AS `subject`,`teaching_data`.`time_in` AS `time_in`,`teaching_data`.`time_out` AS `time_out` from `teaching_data`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_data`
--
ALTER TABLE `attendance_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_data_id_students_foreign` (`id_students`),
  ADD KEY `attendance_data_id_attendance_foreign` (`id_attendance`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_id_user_foreign` (`id_user`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_id_categories_foreign` (`id_categories`),
  ADD KEY `blog_posts_id_user_foreign` (`id_user`);

--
-- Indexes for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_comments_id_user_foreign` (`id_user`),
  ADD KEY `blog_post_comments_id_post_foreign` (`id_post`);

--
-- Indexes for table `blog_post_likes`
--
ALTER TABLE `blog_post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_likes_id_user_foreign` (`id_user`),
  ADD KEY `blog_post_likes_id_post_foreign` (`id_post`);

--
-- Indexes for table `blog_post_metas`
--
ALTER TABLE `blog_post_metas`
  ADD KEY `blog_post_metas_id_post_foreign` (`id_post`);

--
-- Indexes for table `blog_post_tags`
--
ALTER TABLE `blog_post_tags`
  ADD KEY `blog_post_tags_id_post_foreign` (`id_post`),
  ADD KEY `blog_post_tags_id_tag_foreign` (`id_tag`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_id_user_foreign` (`id_user`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id_teacher_foreign` (`id_teacher`);

--
-- Indexes for table `kantin_inventories`
--
ALTER TABLE `kantin_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kantin_inventories_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `kantin_payments`
--
ALTER TABLE `kantin_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kantin_payments_id_seller_foreign` (`id_seller`),
  ADD KEY `kantin_payments_id_buyer_foreign` (`id_buyer`),
  ADD KEY `kantin_payments_id_inventory_foreign` (`id_inventory`);

--
-- Indexes for table `kantin_shops`
--
ALTER TABLE `kantin_shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kantin_shops_id_owner_foreign` (`id_owner`);

--
-- Indexes for table `kesiswaan_events`
--
ALTER TABLE `kesiswaan_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kesiswaan_reports`
--
ALTER TABLE `kesiswaan_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kesiswaan_reports_id_teacher_foreign` (`id_teacher`),
  ADD KEY `kesiswaan_reports_id_student_foreign` (`id_student`),
  ADD KEY `kesiswaan_reports_id_violation_foreign` (`id_violation`);

--
-- Indexes for table `kesiswaan_violation`
--
ALTER TABLE `kesiswaan_violation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_id_teacher_foreign` (`id_teacher`),
  ADD KEY `notes_id_class_foreign` (`id_class`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sarpras_borrower`
--
ALTER TABLE `sarpras_borrower`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sarpras_borrower_id_user_foreign` (`id_user`),
  ADD KEY `sarpras_borrower_id_inventory_foreign` (`id_inventory`),
  ADD KEY `sarpras_borrower_id_room_foreign` (`id_room`);

--
-- Indexes for table `sarpras_inventories`
--
ALTER TABLE `sarpras_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD KEY `students_id_user_foreign` (`id_user`),
  ADD KEY `students_id_class_foreign` (`id_class`);

--
-- Indexes for table `student_grade`
--
ALTER TABLE `student_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_grade_id_teaching_foreign` (`id_teaching`),
  ADD KEY `student_grade_id_students_foreign` (`id_students`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD KEY `teachers_id_user_foreign` (`id_user`);

--
-- Indexes for table `teaching_attendance`
--
ALTER TABLE `teaching_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_attendance_id_teaching_foreign` (`id_teaching`);

--
-- Indexes for table `teaching_data`
--
ALTER TABLE `teaching_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_data_id_teacher_foreign` (`id_teacher`),
  ADD KEY `teaching_data_id_class_foreign` (`id_class`),
  ADD KEY `teaching_data_id_subject_foreign` (`id_subject`),
  ADD KEY `teaching_data_id_room_foreign` (`id_room`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_foreign` (`role`);

--
-- Indexes for table `users_data`
--
ALTER TABLE `users_data`
  ADD UNIQUE KEY `users_data_id_user_unique` (`id_user`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_session_id_user_foreign` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_data`
--
ALTER TABLE `attendance_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_likes`
--
ALTER TABLE `blog_post_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kantin_inventories`
--
ALTER TABLE `kantin_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kantin_payments`
--
ALTER TABLE `kantin_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kantin_shops`
--
ALTER TABLE `kantin_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesiswaan_events`
--
ALTER TABLE `kesiswaan_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesiswaan_reports`
--
ALTER TABLE `kesiswaan_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesiswaan_violation`
--
ALTER TABLE `kesiswaan_violation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sarpras_borrower`
--
ALTER TABLE `sarpras_borrower`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sarpras_inventories`
--
ALTER TABLE `sarpras_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_grade`
--
ALTER TABLE `student_grade`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teaching_attendance`
--
ALTER TABLE `teaching_attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teaching_data`
--
ALTER TABLE `teaching_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_data`
--
ALTER TABLE `attendance_data`
  ADD CONSTRAINT `attendance_data_id_attendance_foreign` FOREIGN KEY (`id_attendance`) REFERENCES `attendance` (`id`),
  ADD CONSTRAINT `attendance_data_id_students_foreign` FOREIGN KEY (`id_students`) REFERENCES `students` (`id_user`);

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_id_categories_foreign` FOREIGN KEY (`id_categories`) REFERENCES `blog_categories` (`id`),
  ADD CONSTRAINT `blog_posts_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD CONSTRAINT `blog_post_comments_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`),
  ADD CONSTRAINT `blog_post_comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_post_likes`
--
ALTER TABLE `blog_post_likes`
  ADD CONSTRAINT `blog_post_likes_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`),
  ADD CONSTRAINT `blog_post_likes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `blog_post_metas`
--
ALTER TABLE `blog_post_metas`
  ADD CONSTRAINT `blog_post_metas_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`);

--
-- Constraints for table `blog_post_tags`
--
ALTER TABLE `blog_post_tags`
  ADD CONSTRAINT `blog_post_tags_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`),
  ADD CONSTRAINT `blog_post_tags_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `blog_tags` (`id`);

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`);

--
-- Constraints for table `kantin_inventories`
--
ALTER TABLE `kantin_inventories`
  ADD CONSTRAINT `kantin_inventories_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `kantin_shops` (`id`);

--
-- Constraints for table `kantin_payments`
--
ALTER TABLE `kantin_payments`
  ADD CONSTRAINT `kantin_payments_id_buyer_foreign` FOREIGN KEY (`id_buyer`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `kantin_payments_id_inventory_foreign` FOREIGN KEY (`id_inventory`) REFERENCES `kantin_inventories` (`id`),
  ADD CONSTRAINT `kantin_payments_id_seller_foreign` FOREIGN KEY (`id_seller`) REFERENCES `users` (`id`);

--
-- Constraints for table `kantin_shops`
--
ALTER TABLE `kantin_shops`
  ADD CONSTRAINT `kantin_shops_id_owner_foreign` FOREIGN KEY (`id_owner`) REFERENCES `users` (`id`);

--
-- Constraints for table `kesiswaan_reports`
--
ALTER TABLE `kesiswaan_reports`
  ADD CONSTRAINT `kesiswaan_reports_id_student_foreign` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`),
  ADD CONSTRAINT `kesiswaan_reports_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`),
  ADD CONSTRAINT `kesiswaan_reports_id_violation_foreign` FOREIGN KEY (`id_violation`) REFERENCES `kesiswaan_violation` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_id_class_foreign` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `notes_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`);

--
-- Constraints for table `sarpras_borrower`
--
ALTER TABLE `sarpras_borrower`
  ADD CONSTRAINT `sarpras_borrower_id_inventory_foreign` FOREIGN KEY (`id_inventory`) REFERENCES `sarpras_inventories` (`id`),
  ADD CONSTRAINT `sarpras_borrower_id_room_foreign` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `sarpras_borrower_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_id_class_foreign` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `students_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_grade`
--
ALTER TABLE `student_grade`
  ADD CONSTRAINT `student_grade_id_students_foreign` FOREIGN KEY (`id_students`) REFERENCES `students` (`id_user`),
  ADD CONSTRAINT `student_grade_id_teaching_foreign` FOREIGN KEY (`id_teaching`) REFERENCES `teaching_data` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `teaching_attendance`
--
ALTER TABLE `teaching_attendance`
  ADD CONSTRAINT `teaching_attendance_id_teaching_foreign` FOREIGN KEY (`id_teaching`) REFERENCES `teaching_data` (`id`);

--
-- Constraints for table `teaching_data`
--
ALTER TABLE `teaching_data`
  ADD CONSTRAINT `teaching_data_id_class_foreign` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `teaching_data_id_room_foreign` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `teaching_data_id_subject_foreign` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `teaching_data_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Constraints for table `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_session`
--
ALTER TABLE `users_session`
  ADD CONSTRAINT `users_session_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
