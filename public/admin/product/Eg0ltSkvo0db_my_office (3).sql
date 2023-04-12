-- Adminer 4.8.1 MySQL 10.9.2-MariaDB-log dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `comment_threads`;
CREATE TABLE `comment_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `thread_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_threads_user_id_foreign` (`user_id`),
  CONSTRAINT `comment_threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `doc_acl_rules`;
CREATE TABLE `doc_acl_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sys_struct_id` bigint(20) unsigned NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(11) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `favorite_threads`;
CREATE TABLE `favorite_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `thread_id` int(11) NOT NULL,
  `like` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_threads_user_id_foreign` (`user_id`),
  CONSTRAINT `favorite_threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `forum_categories`;
CREATE TABLE `forum_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `indikator_mutu_unit`;
CREATE TABLE `indikator_mutu_unit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|waiting.approval|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indikator_mutu_unit_unit_kerja_id_year_unique` (`unit_kerja_id`,`year`),
  CONSTRAINT `indikator_mutu_unit_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `indikator_mutu_unit_details`;
CREATE TABLE `indikator_mutu_unit_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `indikator_mutu_unit_id` bigint(20) unsigned NOT NULL,
  `month` int(11) NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capaian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indikator_mutu_unit_details_indikator_mutu_unit_id_foreign` (`indikator_mutu_unit_id`),
  CONSTRAINT `indikator_mutu_unit_details_indikator_mutu_unit_id_foreign` FOREIGN KEY (`indikator_mutu_unit_id`) REFERENCES `indikator_mutu_unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `kontrak_kinerja_unit`;
CREATE TABLE `kontrak_kinerja_unit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_kerja` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|waiting.approval|rejected|completed|upgraded',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `kontrak_kinerja_unit_detail`;
CREATE TABLE `kontrak_kinerja_unit_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kontrak_kinerja_unit_id` bigint(20) unsigned DEFAULT NULL,
  `indikator_kinerja_id` bigint(20) unsigned DEFAULT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capaian_tw_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capaian_tw_2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capaian_tw_3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capaian_tw_4` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kontrak_kinerja_unit_detail_kontrak_kinerja_unit_id_foreign` (`kontrak_kinerja_unit_id`),
  KEY `kontrak_kinerja_unit_detail_indikator_kinerja_id_foreign` (`indikator_kinerja_id`),
  CONSTRAINT `kontrak_kinerja_unit_detail_indikator_kinerja_id_foreign` FOREIGN KEY (`indikator_kinerja_id`) REFERENCES `ref_indikator_kinerja` (`id`),
  CONSTRAINT `kontrak_kinerja_unit_detail_kontrak_kinerja_unit_id_foreign` FOREIGN KEY (`kontrak_kinerja_unit_id`) REFERENCES `kontrak_kinerja_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `latbang`;
CREATE TABLE `latbang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `employee_id` bigint(20) unsigned NOT NULL,
  `filling_date` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `latbang_employee_id_foreign` (`employee_id`),
  CONSTRAINT `latbang_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `ref_pegawai` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `latbang_cc`;
CREATE TABLE `latbang_cc` (
  `latbang_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`latbang_id`,`user_id`),
  KEY `latbang_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `latbang_cc_latbang_id_foreign` FOREIGN KEY (`latbang_id`) REFERENCES `latbang` (`id`),
  CONSTRAINT `latbang_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `latbang_detail`;
CREATE TABLE `latbang_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `latbang_id` bigint(20) unsigned NOT NULL,
  `training_id` bigint(20) unsigned NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cost` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `latbang_detail_latbang_id_foreign` (`latbang_id`),
  KEY `latbang_detail_training_id_foreign` (`training_id`),
  CONSTRAINT `latbang_detail_latbang_id_foreign` FOREIGN KEY (`latbang_id`) REFERENCES `latbang` (`id`),
  CONSTRAINT `latbang_detail_training_id_foreign` FOREIGN KEY (`training_id`) REFERENCES `ref_pelatihan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `latbang_pelaksanaan`;
CREATE TABLE `latbang_pelaksanaan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `latbang_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned NOT NULL,
  `filling_date` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `latbang_pelaksanaan_latbang_id_foreign` (`latbang_id`),
  KEY `latbang_pelaksanaan_employee_id_foreign` (`employee_id`),
  CONSTRAINT `latbang_pelaksanaan_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `ref_pegawai` (`id`),
  CONSTRAINT `latbang_pelaksanaan_latbang_id_foreign` FOREIGN KEY (`latbang_id`) REFERENCES `latbang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `latbang_pelaksanaan_cc`;
CREATE TABLE `latbang_pelaksanaan_cc` (
  `latbang_pelaksanaan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`latbang_pelaksanaan_id`,`user_id`),
  KEY `latbang_pelaksanaan_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `latbang_pelaksanaan_cc_latbang_pelaksanaan_id_foreign` FOREIGN KEY (`latbang_pelaksanaan_id`) REFERENCES `latbang_pelaksanaan` (`id`),
  CONSTRAINT `latbang_pelaksanaan_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `latbang_pelaksanaan_detail`;
CREATE TABLE `latbang_pelaksanaan_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `latbang_pelaksanaan_id` bigint(20) unsigned NOT NULL,
  `training_id` bigint(20) unsigned NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `laporan_pelaksanaan` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `latbang_pelaksanaan_detail_latbang_pelaksanaan_id_foreign` (`latbang_pelaksanaan_id`),
  KEY `latbang_pelaksanaan_detail_training_id_foreign` (`training_id`),
  CONSTRAINT `latbang_pelaksanaan_detail_latbang_pelaksanaan_id_foreign` FOREIGN KEY (`latbang_pelaksanaan_id`) REFERENCES `latbang_pelaksanaan` (`id`),
  CONSTRAINT `latbang_pelaksanaan_detail_training_id_foreign` FOREIGN KEY (`training_id`) REFERENCES `ref_pelatihan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pengendalian_resikos`;
CREATE TABLE `pengendalian_resikos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `struktur_id` bigint(20) unsigned NOT NULL,
  `periode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kegiatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_resiko` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kegiatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_resiko_id` bigint(20) unsigned NOT NULL,
  `pernyataan_resiko` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioritas_resiko` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternative_penanganan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengendalian_yg_ada` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `efektifitas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengendalian_yg_harus_ada` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `penanggung_jawab_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pengendalian_resikos_struktur_id_foreign` (`struktur_id`),
  KEY `pengendalian_resikos_kode_resiko_id_foreign` (`kode_resiko_id`),
  KEY `pengendalian_resikos_penanggung_jawab_id_foreign` (`penanggung_jawab_id`),
  CONSTRAINT `pengendalian_resikos_kode_resiko_id_foreign` FOREIGN KEY (`kode_resiko_id`) REFERENCES `ref_kode_resiko` (`id`),
  CONSTRAINT `pengendalian_resikos_penanggung_jawab_id_foreign` FOREIGN KEY (`penanggung_jawab_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `pengendalian_resikos_struktur_id_foreign` FOREIGN KEY (`struktur_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pengendalian_resiko_details`;
CREATE TABLE `pengendalian_resiko_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pengendalian_resiko_id` bigint(20) unsigned NOT NULL,
  `kegiatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` time NOT NULL,
  `jenis_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pengendalian_resiko_details_pengendalian_resiko_id_foreign` (`pengendalian_resiko_id`),
  KEY `pengendalian_resiko_details_jenis_id_foreign` (`jenis_id`),
  CONSTRAINT `pengendalian_resiko_details_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `ref_jenis_pengendalian` (`id`),
  CONSTRAINT `pengendalian_resiko_details_pengendalian_resiko_id_foreign` FOREIGN KEY (`pengendalian_resiko_id`) REFERENCES `pengendalian_resikos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `profil_resikos`;
CREATE TABLE `profil_resikos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `periode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `struktur_id` bigint(20) unsigned NOT NULL,
  `kategori_resiko_id` bigint(20) unsigned NOT NULL,
  `jumlah_pernyataan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_resikos_struktur_id_foreign` (`struktur_id`),
  KEY `profil_resikos_kategori_resiko_id_foreign` (`kategori_resiko_id`),
  CONSTRAINT `profil_resikos_kategori_resiko_id_foreign` FOREIGN KEY (`kategori_resiko_id`) REFERENCES `ref_kategori_resiko` (`id`),
  CONSTRAINT `profil_resikos_struktur_id_foreign` FOREIGN KEY (`struktur_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `profil_resiko_details`;
CREATE TABLE `profil_resiko_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profil_resiko_id` bigint(20) unsigned NOT NULL,
  `pernyataan_resiko` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `akar_masalah` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dampak_id` bigint(20) unsigned NOT NULL,
  `probabilitas_id` bigint(20) unsigned NOT NULL,
  `controllability_id` bigint(20) unsigned NOT NULL,
  `skoring` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ranking` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_resiko_details_profil_resiko_id_foreign` (`profil_resiko_id`),
  KEY `profil_resiko_details_dampak_id_foreign` (`dampak_id`),
  KEY `profil_resiko_details_probabilitas_id_foreign` (`probabilitas_id`),
  KEY `profil_resiko_details_controllability_id_foreign` (`controllability_id`),
  CONSTRAINT `profil_resiko_details_controllability_id_foreign` FOREIGN KEY (`controllability_id`) REFERENCES `ref_tingkat_controllability` (`id`),
  CONSTRAINT `profil_resiko_details_dampak_id_foreign` FOREIGN KEY (`dampak_id`) REFERENCES `ref_tingkat_dampak` (`id`),
  CONSTRAINT `profil_resiko_details_probabilitas_id_foreign` FOREIGN KEY (`probabilitas_id`) REFERENCES `ref_tingkat_probabilitas` (`id`),
  CONSTRAINT `profil_resiko_details_profil_resiko_id_foreign` FOREIGN KEY (`profil_resiko_id`) REFERENCES `profil_resikos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_aspects`;
CREATE TABLE `ref_aspects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint(20) unsigned DEFAULT NULL,
  `ict_object_id` bigint(20) unsigned DEFAULT NULL,
  `ext_object_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_aspects_object_id_foreign` (`object_id`),
  KEY `ref_aspects_ict_object_id_foreign` (`ict_object_id`),
  KEY `ref_aspects_ext_object_id_foreign` (`ext_object_id`),
  CONSTRAINT `ref_aspects_ext_object_id_foreign` FOREIGN KEY (`ext_object_id`) REFERENCES `ref_ext_objects` (`id`),
  CONSTRAINT `ref_aspects_ict_object_id_foreign` FOREIGN KEY (`ict_object_id`) REFERENCES `ref_ict_objects` (`id`),
  CONSTRAINT `ref_aspects_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `ref_org_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_city`;
CREATE TABLE `ref_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_city_province_id_foreign` (`province_id`),
  CONSTRAINT `ref_city_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `ref_province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_city` (`id`, `province_id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	1,	'KAB. ACEH SELATAN',	'1101',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(2,	1,	'KAB. ACEH TENGGARA',	'1102',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(3,	1,	'KAB. ACEH TIMUR',	'1103',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(4,	1,	'KAB. ACEH TENGAH',	'1104',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(5,	1,	'KAB. ACEH BARAT',	'1105',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(6,	1,	'KAB. ACEH BESAR',	'1106',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(7,	1,	'KAB. PIDIE',	'1107',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(8,	1,	'KAB. ACEH UTARA',	'1108',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(9,	1,	'KAB. SIMEULUE',	'1109',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(10,	1,	'KAB. ACEH SINGKIL',	'1110',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(11,	1,	'KAB. BIREUEN',	'1111',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(12,	1,	'KAB. ACEH BARAT DAYA',	'1112',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(13,	1,	'KAB. GAYO LUES',	'1113',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(14,	1,	'KAB. ACEH JAYA',	'1114',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(15,	1,	'KAB. NAGAN RAYA',	'1115',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(16,	1,	'KAB. ACEH TAMIANG',	'1116',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(17,	1,	'KAB. BENER MERIAH',	'1117',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(18,	1,	'KAB. PIDIE JAYA',	'1118',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(19,	1,	'KOTA BANDA ACEH',	'1171',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(20,	1,	'KOTA SABANG',	'1172',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(21,	1,	'KOTA LHOKSEUMAWE',	'1173',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(22,	1,	'KOTA LANGSA',	'1174',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(23,	1,	'KOTA SUBULUSSALAM',	'1175',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(24,	2,	'KAB. TAPANULI TENGAH',	'1201',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(25,	2,	'KAB. TAPANULI UTARA',	'1202',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(26,	2,	'KAB. TAPANULI SELATAN',	'1203',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(27,	2,	'KAB. NIAS',	'1204',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(28,	2,	'KAB. LANGKAT',	'1205',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(29,	2,	'KAB. KARO',	'1206',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(30,	2,	'KAB. DELI SERDANG',	'1207',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(31,	2,	'KAB. SIMALUNGUN',	'1208',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(32,	2,	'KAB. ASAHAN',	'1209',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(33,	2,	'KAB. LABUHANBATU',	'1210',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(34,	2,	'KAB. DAIRI',	'1211',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(35,	2,	'KAB. TOBA SAMOSIR',	'1212',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(36,	2,	'KAB. MANDAILING NATAL',	'1213',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(37,	2,	'KAB. NIAS SELATAN',	'1214',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(38,	2,	'KAB. PAKPAK BHARAT',	'1215',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(39,	2,	'KAB. HUMBANG HASUNDUTAN',	'1216',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(40,	2,	'KAB. SAMOSIR',	'1217',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(41,	2,	'KAB. SERDANG BEDAGAI',	'1218',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(42,	2,	'KAB. BATU BARA',	'1219',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(43,	2,	'KAB. PADANG LAWAS UTARA',	'1220',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(44,	2,	'KAB. PADANG LAWAS',	'1221',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(45,	2,	'KAB. LABUHANBATU SELATAN',	'1222',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(46,	2,	'KAB. LABUHANBATU UTARA',	'1223',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(47,	2,	'KAB. NIAS UTARA',	'1224',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(48,	2,	'KAB. NIAS BARAT',	'1225',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(49,	2,	'KOTA MEDAN',	'1271',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(50,	2,	'KOTA PEMATANGSIANTAR',	'1272',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(51,	2,	'KOTA SIBOLGA',	'1273',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(52,	2,	'KOTA TANJUNG BALAI',	'1274',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(53,	2,	'KOTA BINJAI',	'1275',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(54,	2,	'KOTA TEBING TINGGI',	'1276',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(55,	2,	'KOTA PADANGSIDIMPUAN',	'1277',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(56,	2,	'KOTA GUNUNGSITOLI',	'1278',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(57,	3,	'KAB. PESISIR SELATAN',	'1301',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(58,	3,	'KAB. SOLOK',	'1302',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(59,	3,	'KAB. SIJUNJUNG',	'1303',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(60,	3,	'KAB. TANAH DATAR',	'1304',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(61,	3,	'KAB. PADANG PARIAMAN',	'1305',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(62,	3,	'KAB. AGAM',	'1306',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(63,	3,	'KAB. LIMA PULUH KOTA',	'1307',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(64,	3,	'KAB. PASAMAN',	'1308',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(65,	3,	'KAB. KEPULAUAN MENTAWAI',	'1309',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(66,	3,	'KAB. DHARMASRAYA',	'1310',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(67,	3,	'KAB. SOLOK SELATAN',	'1311',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(68,	3,	'KAB. PASAMAN BARAT',	'1312',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(69,	3,	'KOTA PADANG',	'1371',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(70,	3,	'KOTA SOLOK',	'1372',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(71,	3,	'KOTA SAWAHLUNTO',	'1373',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(72,	3,	'KOTA PADANG PANJANG',	'1374',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(73,	3,	'KOTA BUKITTINGGI',	'1375',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(74,	3,	'KOTA PAYAKUMBUH',	'1376',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(75,	3,	'KOTA PARIAMAN',	'1377',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(76,	4,	'KAB. KAMPAR',	'1401',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(77,	4,	'KAB. INDRAGIRI HULU',	'1402',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(78,	4,	'KAB. BENGKALIS',	'1403',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(79,	4,	'KAB. INDRAGIRI HILIR',	'1404',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(80,	4,	'KAB. PELALAWAN',	'1405',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(81,	4,	'KAB. ROKAN HULU',	'1406',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(82,	4,	'KAB. ROKAN HILIR',	'1407',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(83,	4,	'KAB. SIAK',	'1408',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(84,	4,	'KAB. KUANTAN SINGINGI',	'1409',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(85,	4,	'KAB. KEPULAUAN MERANTI',	'1410',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(86,	4,	'KOTA PEKANBARU',	'1471',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(87,	4,	'KOTA DUMAI',	'1472',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(88,	5,	'KAB. KERINCI',	'1501',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(89,	5,	'KAB. MERANGIN',	'1502',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(90,	5,	'KAB. SAROLANGUN',	'1503',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(91,	5,	'KAB. BATANGHARI',	'1504',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(92,	5,	'KAB. MUARO JAMBI',	'1505',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(93,	5,	'KAB. TANJUNG JABUNG BARAT',	'1506',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(94,	5,	'KAB. TANJUNG JABUNG TIMUR',	'1507',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(95,	5,	'KAB. BUNGO',	'1508',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(96,	5,	'KAB. TEBO',	'1509',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(97,	5,	'KOTA JAMBI',	'1571',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(98,	5,	'KOTA SUNGAI PENUH',	'1572',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(99,	6,	'KAB. OGAN KOMERING ULU',	'1601',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(100,	6,	'KAB. OGAN KOMERING ILIR',	'1602',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(101,	6,	'KAB. MUARA ENIM',	'1603',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(102,	6,	'KAB. LAHAT',	'1604',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(103,	6,	'KAB. MUSI RAWAS',	'1605',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(104,	6,	'KAB. MUSI BANYUASIN',	'1606',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(105,	6,	'KAB. BANYUASIN',	'1607',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(106,	6,	'KAB. OGAN KOMERING ULU TIMUR',	'1608',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(107,	6,	'KAB. OGAN KOMERING ULU SELATAN',	'1609',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(108,	6,	'KAB. OGAN ILIR',	'1610',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(109,	6,	'KAB. EMPAT LAWANG',	'1611',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(110,	6,	'KAB. PENUKAL ABAB LEMATANG ILIR',	'1612',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(111,	6,	'KAB. MUSI RAWAS UTARA',	'1613',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(112,	6,	'KOTA PALEMBANG',	'1671',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(113,	6,	'KOTA PAGAR ALAM',	'1672',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(114,	6,	'KOTA LUBUK LINGGAU',	'1673',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(115,	6,	'KOTA PRABUMULIH',	'1674',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(116,	7,	'KAB. BENGKULU SELATAN',	'1701',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(117,	7,	'KAB. REJANG LEBONG',	'1702',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(118,	7,	'KAB. BENGKULU UTARA',	'1703',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(119,	7,	'KAB. KAUR',	'1704',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(120,	7,	'KAB. SELUMA',	'1705',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(121,	7,	'KAB. MUKO MUKO',	'1706',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(122,	7,	'KAB. LEBONG',	'1707',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(123,	7,	'KAB. KEPAHIANG',	'1708',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(124,	7,	'KAB. BENGKULU TENGAH',	'1709',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(125,	7,	'KOTA BENGKULU',	'1771',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(126,	8,	'KAB. LAMPUNG SELATAN',	'1801',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(127,	8,	'KAB. LAMPUNG TENGAH',	'1802',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(128,	8,	'KAB. LAMPUNG UTARA',	'1803',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(129,	8,	'KAB. LAMPUNG BARAT',	'1804',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(130,	8,	'KAB. TULANG BAWANG',	'1805',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(131,	8,	'KAB. TANGGAMUS',	'1806',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(132,	8,	'KAB. LAMPUNG TIMUR',	'1807',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(133,	8,	'KAB. WAY KANAN',	'1808',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(134,	8,	'KAB. PESAWARAN',	'1809',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(135,	8,	'KAB. PRINGSEWU',	'1810',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(136,	8,	'KAB. MESUJI',	'1811',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(137,	8,	'KAB. TULANG BAWANG BARAT',	'1812',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(138,	8,	'KAB. PESISIR BARAT',	'1813',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(139,	8,	'KOTA BANDAR LAMPUNG',	'1871',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(140,	8,	'KOTA METRO',	'1872',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(141,	9,	'KAB. BANGKA',	'1901',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(142,	9,	'KAB. BELITUNG',	'1902',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(143,	9,	'KAB. BANGKA SELATAN',	'1903',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(144,	9,	'KAB. BANGKA TENGAH',	'1904',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(145,	9,	'KAB. BANGKA BARAT',	'1905',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(146,	9,	'KAB. BELITUNG TIMUR',	'1906',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(147,	9,	'KOTA PANGKAL PINANG',	'1971',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(148,	10,	'KAB. BINTAN',	'2101',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(149,	10,	'KAB. KARIMUN',	'2102',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(150,	10,	'KAB. NATUNA',	'2103',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(151,	10,	'KAB. LINGGA',	'2104',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(152,	10,	'KAB. KEPULAUAN ANAMBAS',	'2105',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(153,	10,	'KOTA BATAM',	'2171',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(154,	10,	'KOTA TANJUNG PINANG',	'2172',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(155,	11,	'KAB. ADM. KEP. SERIBU',	'3101',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(156,	11,	'KOTA ADM. JAKARTA PUSAT',	'3171',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(157,	11,	'KOTA ADM. JAKARTA UTARA',	'3172',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(158,	11,	'KOTA ADM. JAKARTA BARAT',	'3173',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(159,	11,	'KOTA ADM. JAKARTA SELATAN',	'3174',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(160,	11,	'KOTA ADM. JAKARTA TIMUR',	'3175',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(161,	12,	'KAB. BOGOR',	'3201',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(162,	12,	'KAB. SUKABUMI',	'3202',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(163,	12,	'KAB. CIANJUR',	'3203',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(164,	12,	'KAB. BANDUNG',	'3204',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(165,	12,	'KAB. GARUT',	'3205',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(166,	12,	'KAB. TASIKMALAYA',	'3206',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(167,	12,	'KAB. CIAMIS',	'3207',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(168,	12,	'KAB. KUNINGAN',	'3208',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(169,	12,	'KAB. CIREBON',	'3209',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(170,	12,	'KAB. MAJALENGKA',	'3210',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(171,	12,	'KAB. SUMEDANG',	'3211',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(172,	12,	'KAB. INDRAMAYU',	'3212',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(173,	12,	'KAB. SUBANG',	'3213',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(174,	12,	'KAB. PURWAKARTA',	'3214',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(175,	12,	'KAB. KARAWANG',	'3215',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(176,	12,	'KAB. BEKASI',	'3216',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(177,	12,	'KAB. BANDUNG BARAT',	'3217',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(178,	12,	'KAB. PANGANDARAN',	'3218',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(179,	12,	'KOTA BOGOR',	'3271',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(180,	12,	'KOTA SUKABUMI',	'3272',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(181,	12,	'KOTA BANDUNG',	'3273',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(182,	12,	'KOTA CIREBON',	'3274',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(183,	12,	'KOTA BEKASI',	'3275',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(184,	12,	'KOTA DEPOK',	'3276',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(185,	12,	'KOTA CIMAHI',	'3277',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(186,	12,	'KOTA TASIKMALAYA',	'3278',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(187,	12,	'KOTA BANJAR',	'3279',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(188,	13,	'KAB. CILACAP',	'3301',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(189,	13,	'KAB. BANYUMAS',	'3302',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(190,	13,	'KAB. PURBALINGGA',	'3303',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(191,	13,	'KAB. BANJARNEGARA',	'3304',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(192,	13,	'KAB. KEBUMEN',	'3305',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(193,	13,	'KAB. PURWOREJO',	'3306',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(194,	13,	'KAB. WONOSOBO',	'3307',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(195,	13,	'KAB. MAGELANG',	'3308',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(196,	13,	'KAB. BOYOLALI',	'3309',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(197,	13,	'KAB. KLATEN',	'3310',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(198,	13,	'KAB. SUKOHARJO',	'3311',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(199,	13,	'KAB. WONOGIRI',	'3312',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(200,	13,	'KAB. KARANGANYAR',	'3313',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(201,	13,	'KAB. SRAGEN',	'3314',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(202,	13,	'KAB. GROBOGAN',	'3315',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(203,	13,	'KAB. BLORA',	'3316',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(204,	13,	'KAB. REMBANG',	'3317',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(205,	13,	'KAB. PATI',	'3318',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(206,	13,	'KAB. KUDUS',	'3319',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(207,	13,	'KAB. JEPARA',	'3320',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(208,	13,	'KAB. DEMAK',	'3321',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(209,	13,	'KAB. SEMARANG',	'3322',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(210,	13,	'KAB. TEMANGGUNG',	'3323',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(211,	13,	'KAB. KENDAL',	'3324',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(212,	13,	'KAB. BATANG',	'3325',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(213,	13,	'KAB. PEKALONGAN',	'3326',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(214,	13,	'KAB. PEMALANG',	'3327',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(215,	13,	'KAB. TEGAL',	'3328',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(216,	13,	'KAB. BREBES',	'3329',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(217,	13,	'KOTA MAGELANG',	'3371',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(218,	13,	'KOTA SURAKARTA',	'3372',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(219,	13,	'KOTA SALATIGA',	'3373',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(220,	13,	'KOTA SEMARANG',	'3374',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(221,	13,	'KOTA PEKALONGAN',	'3375',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(222,	13,	'KOTA TEGAL',	'3376',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(223,	14,	'KAB. KULON PROGO',	'3401',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(224,	14,	'KAB. BANTUL',	'3402',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(225,	14,	'KAB. GUNUNGKIDUL',	'3403',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(226,	14,	'KAB. SLEMAN',	'3404',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(227,	14,	'KOTA YOGYAKARTA',	'3471',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(228,	15,	'KAB. PACITAN',	'3501',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(229,	15,	'KAB. PONOROGO',	'3502',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(230,	15,	'KAB. TRENGGALEK',	'3503',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(231,	15,	'KAB. TULUNGAGUNG',	'3504',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(232,	15,	'KAB. BLITAR',	'3505',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(233,	15,	'KAB. KEDIRI',	'3506',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(234,	15,	'KAB. MALANG',	'3507',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(235,	15,	'KAB. LUMAJANG',	'3508',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(236,	15,	'KAB. JEMBER',	'3509',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(237,	15,	'KAB. BANYUWANGI',	'3510',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(238,	15,	'KAB. BONDOWOSO',	'3511',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(239,	15,	'KAB. SITUBONDO',	'3512',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(240,	15,	'KAB. PROBOLINGGO',	'3513',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(241,	15,	'KAB. PASURUAN',	'3514',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(242,	15,	'KAB. SIDOARJO',	'3515',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(243,	15,	'KAB. MOJOKERTO',	'3516',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(244,	15,	'KAB. JOMBANG',	'3517',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(245,	15,	'KAB. NGANJUK',	'3518',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(246,	15,	'KAB. MADIUN',	'3519',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(247,	15,	'KAB. MAGETAN',	'3520',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(248,	15,	'KAB. NGAWI',	'3521',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(249,	15,	'KAB. BOJONEGORO',	'3522',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(250,	15,	'KAB. TUBAN',	'3523',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(251,	15,	'KAB. LAMONGAN',	'3524',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(252,	15,	'KAB. GRESIK',	'3525',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(253,	15,	'KAB. BANGKALAN',	'3526',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(254,	15,	'KAB. SAMPANG',	'3527',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(255,	15,	'KAB. PAMEKASAN',	'3528',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(256,	15,	'KAB. SUMENEP',	'3529',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(257,	15,	'KOTA KEDIRI',	'3571',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(258,	15,	'KOTA BLITAR',	'3572',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(259,	15,	'KOTA MALANG',	'3573',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(260,	15,	'KOTA PROBOLINGGO',	'3574',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(261,	15,	'KOTA PASURUAN',	'3575',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(262,	15,	'KOTA MOJOKERTO',	'3576',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(263,	15,	'KOTA MADIUN',	'3577',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(264,	15,	'KOTA SURABAYA',	'3578',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(265,	15,	'KOTA BATU',	'3579',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(266,	16,	'KAB. PANDEGLANG',	'3601',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(267,	16,	'KAB. LEBAK',	'3602',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(268,	16,	'KAB. TANGERANG',	'3603',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(269,	16,	'KAB. SERANG',	'3604',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(270,	16,	'KOTA TANGERANG',	'3671',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(271,	16,	'KOTA CILEGON',	'3672',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(272,	16,	'KOTA SERANG',	'3673',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(273,	16,	'KOTA TANGERANG SELATAN',	'3674',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(274,	17,	'KAB. JEMBRANA',	'5101',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(275,	17,	'KAB. TABANAN',	'5102',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(276,	17,	'KAB. BADUNG',	'5103',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(277,	17,	'KAB. GIANYAR',	'5104',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(278,	17,	'KAB. KLUNGKUNG',	'5105',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(279,	17,	'KAB. BANGLI',	'5106',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(280,	17,	'KAB. KARANGASEM',	'5107',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(281,	17,	'KAB. BULELENG',	'5108',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(282,	17,	'KOTA DENPASAR',	'5171',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(283,	18,	'KAB. LOMBOK BARAT',	'5201',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(284,	18,	'KAB. LOMBOK TENGAH',	'5202',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(285,	18,	'KAB. LOMBOK TIMUR',	'5203',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(286,	18,	'KAB. SUMBAWA',	'5204',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(287,	18,	'KAB. DOMPU',	'5205',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(288,	18,	'KAB. BIMA',	'5206',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(289,	18,	'KAB. SUMBAWA BARAT',	'5207',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(290,	18,	'KAB. LOMBOK UTARA',	'5208',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(291,	18,	'KOTA MATARAM',	'5271',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(292,	18,	'KOTA BIMA',	'5272',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(293,	19,	'KAB. KUPANG',	'5301',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(294,	19,	'KAB TIMOR TENGAH SELATAN',	'5302',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(295,	19,	'KAB. TIMOR TENGAH UTARA',	'5303',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(296,	19,	'KAB. BELU',	'5304',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(297,	19,	'KAB. ALOR',	'5305',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(298,	19,	'KAB. FLORES TIMUR',	'5306',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(299,	19,	'KAB. SIKKA',	'5307',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(300,	19,	'KAB. ENDE',	'5308',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(301,	19,	'KAB. NGADA',	'5309',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(302,	19,	'KAB. MANGGARAI',	'5310',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(303,	19,	'KAB. SUMBA TIMUR',	'5311',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(304,	19,	'KAB. SUMBA BARAT',	'5312',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(305,	19,	'KAB. LEMBATA',	'5313',	1,	NULL,	'2023-02-05 04:46:20',	'2023-02-05 04:46:20'),
(306,	19,	'KAB. ROTE NDAO',	'5314',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(307,	19,	'KAB. MANGGARAI BARAT',	'5315',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(308,	19,	'KAB. NAGEKEO',	'5316',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(309,	19,	'KAB. SUMBA TENGAH',	'5317',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(310,	19,	'KAB. SUMBA BARAT DAYA',	'5318',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(311,	19,	'KAB. MANGGARAI TIMUR',	'5319',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(312,	19,	'KAB. SABU RAIJUA',	'5320',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(313,	19,	'KAB. MALAKA',	'5321',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(314,	19,	'KOTA KUPANG',	'5371',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(315,	20,	'KAB. SAMBAS',	'6101',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(316,	20,	'KAB. MEMPAWAH',	'6102',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(317,	20,	'KAB. SANGGAU',	'6103',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(318,	20,	'KAB. KETAPANG',	'6104',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(319,	20,	'KAB. SINTANG',	'6105',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(320,	20,	'KAB. KAPUAS HULU',	'6106',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(321,	20,	'KAB. BENGKAYANG',	'6107',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(322,	20,	'KAB. LANDAK',	'6108',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(323,	20,	'KAB. SEKADAU',	'6109',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(324,	20,	'KAB. MELAWI',	'6110',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(325,	20,	'KAB. KAYONG UTARA',	'6111',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(326,	20,	'KAB. KUBU RAYA',	'6112',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(327,	20,	'KOTA PONTIANAK',	'6171',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(328,	20,	'KOTA SINGKAWANG',	'6172',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(329,	21,	'KAB. KOTAWARINGIN BARAT',	'6201',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(330,	21,	'KAB. KOTAWARINGIN TIMUR',	'6202',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(331,	21,	'KAB. KAPUAS',	'6203',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(332,	21,	'KAB. BARITO SELATAN',	'6204',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(333,	21,	'KAB. BARITO UTARA',	'6205',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(334,	21,	'KAB. KATINGAN',	'6206',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(335,	21,	'KAB. SERUYAN',	'6207',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(336,	21,	'KAB. SUKAMARA',	'6208',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(337,	21,	'KAB. LAMANDAU',	'6209',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(338,	21,	'KAB. GUNUNG MAS',	'6210',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(339,	21,	'KAB. PULANG PISAU',	'6211',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(340,	21,	'KAB. MURUNG RAYA',	'6212',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(341,	21,	'KAB. BARITO TIMUR',	'6213',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(342,	21,	'KOTA PALANGKARAYA',	'6271',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(343,	22,	'KAB. TANAH LAUT',	'6301',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(344,	22,	'KAB. KOTABARU',	'6302',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(345,	22,	'KAB. BANJAR',	'6303',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(346,	22,	'KAB. BARITO KUALA',	'6304',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(347,	22,	'KAB. TAPIN',	'6305',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(348,	22,	'KAB. HULU SUNGAI SELATAN',	'6306',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(349,	22,	'KAB. HULU SUNGAI TENGAH',	'6307',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(350,	22,	'KAB. HULU SUNGAI UTARA',	'6308',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(351,	22,	'KAB. TABALONG',	'6309',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(352,	22,	'KAB. TANAH BUMBU',	'6310',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(353,	22,	'KAB. BALANGAN',	'6311',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(354,	22,	'KOTA BANJARMASIN',	'6371',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(355,	22,	'KOTA BANJARBARU',	'6372',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(356,	23,	'KAB. PASER',	'6401',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(357,	23,	'KAB. KUTAI KARTANEGARA',	'6402',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(358,	23,	'KAB. BERAU',	'6403',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(359,	23,	'KAB. KUTAI BARAT',	'6407',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(360,	23,	'KAB. KUTAI TIMUR',	'6408',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(361,	23,	'KAB. PENAJAM PASER UTARA',	'6409',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(362,	23,	'KAB. MAHAKAM ULU',	'6411',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(363,	23,	'KOTA BALIKPAPAN',	'6471',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(364,	23,	'KOTA SAMARINDA',	'6472',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(365,	23,	'KOTA BONTANG',	'6474',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(366,	24,	'KAB. BULUNGAN',	'6501',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(367,	24,	'KAB. MALINAU',	'6502',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(368,	24,	'KAB. NUNUKAN',	'6503',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(369,	24,	'KAB. TANA TIDUNG',	'6504',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(370,	24,	'KOTA TARAKAN',	'6571',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(371,	25,	'KAB. BOLAANG MONGONDOW',	'7101',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(372,	25,	'KAB. MINAHASA',	'7102',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(373,	25,	'KAB. KEPULAUAN SANGIHE',	'7103',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(374,	25,	'KAB. KEPULAUAN TALAUD',	'7104',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(375,	25,	'KAB. MINAHASA SELATAN',	'7105',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(376,	25,	'KAB. MINAHASA UTARA',	'7106',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(377,	25,	'KAB. MINAHASA TENGGARA',	'7107',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(378,	25,	'KAB. BOLAANG MONGONDOW UTARA',	'7108',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(379,	25,	'KAB. KEP. SIAU TAGULANDANG BIARO',	'7109',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(380,	25,	'KAB. BOLAANG MONGONDOW TIMUR',	'7110',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(381,	25,	'KAB. BOLAANG MONGONDOW SELATAN',	'7111',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(382,	25,	'KOTA MANADO',	'7171',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(383,	25,	'KOTA BITUNG',	'7172',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(384,	25,	'KOTA TOMOHON',	'7173',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(385,	25,	'KOTA KOTAMOBAGU',	'7174',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(386,	26,	'KAB. BANGGAI',	'7201',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(387,	26,	'KAB. POSO',	'7202',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(388,	26,	'KAB. DONGGALA',	'7203',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(389,	26,	'KAB. TOLI TOLI',	'7204',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(390,	26,	'KAB. BUOL',	'7205',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(391,	26,	'KAB. MOROWALI',	'7206',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(392,	26,	'KAB. BANGGAI KEPULAUAN',	'7207',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(393,	26,	'KAB. PARIGI MOUTONG',	'7208',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(394,	26,	'KAB. TOJO UNA UNA',	'7209',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(395,	26,	'KAB. SIGI',	'7210',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(396,	26,	'KAB. BANGGAI LAUT',	'7211',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(397,	26,	'KAB. MOROWALI UTARA',	'7212',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(398,	26,	'KOTA PALU',	'7271',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(399,	27,	'KAB. KEPULAUAN SELAYAR',	'7301',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(400,	27,	'KAB. BULUKUMBA',	'7302',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(401,	27,	'KAB. BANTAENG',	'7303',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(402,	27,	'KAB. JENEPONTO',	'7304',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(403,	27,	'KAB. TAKALAR',	'7305',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(404,	27,	'KAB. GOWA',	'7306',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(405,	27,	'KAB. SINJAI',	'7307',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(406,	27,	'KAB. BONE',	'7308',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(407,	27,	'KAB. MAROS',	'7309',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(408,	27,	'KAB. PANGKAJENE KEPULAUAN',	'7310',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(409,	27,	'KAB. BARRU',	'7311',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(410,	27,	'KAB. SOPPENG',	'7312',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(411,	27,	'KAB. WAJO',	'7313',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(412,	27,	'KAB. SIDENRENG RAPPANG',	'7314',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(413,	27,	'KAB. PINRANG',	'7315',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(414,	27,	'KAB. ENREKANG',	'7316',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(415,	27,	'KAB. LUWU',	'7317',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(416,	27,	'KAB. TANA TORAJA',	'7318',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(417,	27,	'KAB. LUWU UTARA',	'7322',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(418,	27,	'KAB. LUWU TIMUR',	'7324',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(419,	27,	'KAB. TORAJA UTARA',	'7326',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(420,	27,	'KOTA MAKASSAR',	'7371',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(421,	27,	'KOTA PARE PARE',	'7372',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(422,	27,	'KOTA PALOPO',	'7373',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(423,	28,	'KAB. KOLAKA',	'7401',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(424,	28,	'KAB. KONAWE',	'7402',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(425,	28,	'KAB. MUNA',	'7403',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(426,	28,	'KAB. BUTON',	'7404',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(427,	28,	'KAB. KONAWE SELATAN',	'7405',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(428,	28,	'KAB. BOMBANA',	'7406',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(429,	28,	'KAB. WAKATOBI',	'7407',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(430,	28,	'KAB. KOLAKA UTARA',	'7408',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(431,	28,	'KAB. KONAWE UTARA',	'7409',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(432,	28,	'KAB. BUTON UTARA',	'7410',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(433,	28,	'KAB. KOLAKA TIMUR',	'7411',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(434,	28,	'KAB. KONAWE KEPULAUAN',	'7412',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(435,	28,	'KAB. MUNA BARAT',	'7413',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(436,	28,	'KAB. BUTON TENGAH',	'7414',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(437,	28,	'KAB. BUTON SELATAN',	'7415',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(438,	28,	'KOTA KENDARI',	'7471',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(439,	28,	'KOTA BAU BAU',	'7472',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(440,	29,	'KAB. GORONTALO',	'7501',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(441,	29,	'KAB. BOALEMO',	'7502',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(442,	29,	'KAB. BONE BOLANGO',	'7503',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(443,	29,	'KAB. PAHUWATO',	'7504',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(444,	29,	'KAB. GORONTALO UTARA',	'7505',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(445,	29,	'KOTA GORONTALO',	'7571',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(446,	30,	'KAB. MAMUJU UTARA',	'7601',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(447,	30,	'KAB. MAMUJU',	'7602',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(448,	30,	'KAB. MAMASA',	'7603',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(449,	30,	'KAB. POLEWALI MANDAR',	'7604',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(450,	30,	'KAB. MAJENE',	'7605',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(451,	30,	'KAB. MAMUJU TENGAH',	'7606',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(452,	31,	'KAB. MALUKU TENGAH',	'8101',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(453,	31,	'KAB. MALUKU TENGGARA',	'8102',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(454,	31,	'KAB. MALUKU TENGGARA BARAT',	'8103',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(455,	31,	'KAB. BURU',	'8104',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(456,	31,	'KAB. SERAM BAGIAN TIMUR',	'8105',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(457,	31,	'KAB. SERAM BAGIAN BARAT',	'8106',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(458,	31,	'KAB. KEPULAUAN ARU',	'8107',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(459,	31,	'KAB. MALUKU BARAT DAYA',	'8108',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(460,	31,	'KAB. BURU SELATAN',	'8109',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(461,	31,	'KOTA AMBON',	'8171',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(462,	31,	'KOTA TUAL',	'8172',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(463,	32,	'KAB. HALMAHERA BARAT',	'8201',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(464,	32,	'KAB. HALMAHERA TENGAH',	'8202',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(465,	32,	'KAB. HALMAHERA UTARA',	'8203',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(466,	32,	'KAB. HALMAHERA SELATAN',	'8204',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(467,	32,	'KAB. KEPULAUAN SULA',	'8205',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(468,	32,	'KAB. HALMAHERA TIMUR',	'8206',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(469,	32,	'KAB. PULAU MOROTAI',	'8207',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(470,	32,	'KAB. PULAU TALIABU',	'8208',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(471,	32,	'KOTA TERNATE',	'8271',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(472,	32,	'KOTA TIDORE KEPULAUAN',	'8272',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(473,	33,	'KAB. MERAUKE',	'9101',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(474,	33,	'KAB. JAYAWIJAYA',	'9102',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(475,	33,	'KAB. JAYAPURA',	'9103',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(476,	33,	'KAB. NABIRE',	'9104',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(477,	33,	'KAB. KEPULAUAN YAPEN',	'9105',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(478,	33,	'KAB. BIAK NUMFOR',	'9106',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(479,	33,	'KAB. PUNCAK JAYA',	'9107',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(480,	33,	'KAB. PANIAI',	'9108',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(481,	33,	'KAB. MIMIKA',	'9109',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(482,	33,	'KAB. SARMI',	'9110',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(483,	33,	'KAB. KEEROM',	'9111',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(484,	33,	'KAB. PEGUNUNGAN BINTANG',	'9112',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(485,	33,	'KAB. YAHUKIMO',	'9113',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(486,	33,	'KAB. TOLIKARA',	'9114',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(487,	33,	'KAB. WAROPEN',	'9115',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(488,	33,	'KAB. BOVEN DIGOEL',	'9116',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(489,	33,	'KAB. MAPPI',	'9117',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(490,	33,	'KAB. ASMAT',	'9118',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(491,	33,	'KAB. SUPIORI',	'9119',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(492,	33,	'KAB. MAMBERAMO RAYA',	'9120',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(493,	33,	'KAB. MAMBERAMO TENGAH',	'9121',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(494,	33,	'KAB. YALIMO',	'9122',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(495,	33,	'KAB. LANNY JAYA',	'9123',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(496,	33,	'KAB. NDUGA',	'9124',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(497,	33,	'KAB. PUNCAK',	'9125',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(498,	33,	'KAB. DOGIYAI',	'9126',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(499,	33,	'KAB. INTAN JAYA',	'9127',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(500,	33,	'KAB. DEIYAI',	'9128',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(501,	33,	'KOTA JAYAPURA',	'9171',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(502,	34,	'KAB. SORONG',	'9201',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(503,	34,	'KAB. MANOKWARI',	'9202',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(504,	34,	'KAB. FAK FAK',	'9203',	1,	NULL,	'2023-02-05 04:46:21',	'2023-02-05 04:46:21'),
(505,	34,	'KAB. SORONG SELATAN',	'9204',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(506,	34,	'KAB. RAJA AMPAT',	'9205',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(507,	34,	'KAB. TELUK BINTUNI',	'9206',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(508,	34,	'KAB. TELUK WONDAMA',	'9207',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(509,	34,	'KAB. KAIMANA',	'9208',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(510,	34,	'KAB. TAMBRAUW',	'9209',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(511,	34,	'KAB. MAYBRAT',	'9210',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(512,	34,	'KAB. MANOKWARI SELATAN',	'9211',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(513,	34,	'KAB. PEGUNUNGAN ARFAK',	'9212',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(514,	34,	'KOTA SORONG',	'9271',	1,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22');

DROP TABLE IF EXISTS `ref_disposisi`;
CREATE TABLE `ref_disposisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `instruksi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_district`;
CREATE TABLE `ref_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_district_city_id_foreign` (`city_id`),
  CONSTRAINT `ref_district_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `ref_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_examples`;
CREATE TABLE `ref_examples` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_ext_objects`;
CREATE TABLE `ref_ext_objects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ext_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_ext_objects_ext_type_id_foreign` (`ext_type_id`),
  CONSTRAINT `ref_ext_objects_ext_type_id_foreign` FOREIGN KEY (`ext_type_id`) REFERENCES `ref_ext_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_ext_types`;
CREATE TABLE `ref_ext_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_grup_indikator_kinerja`;
CREATE TABLE `ref_grup_indikator_kinerja` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `grup_indikator_kinerja` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_grup_indikator_kinerja_unit_kerja_id_foreign` (`unit_kerja_id`),
  CONSTRAINT `ref_grup_indikator_kinerja_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_grup_indikator_kinerja` (`id`, `unit_kerja_id`, `grup_indikator_kinerja`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	10,	'Sarana dan Prasarana',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	10,	'Kepuasan Masyarakat',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	10,	'Standarisasi Pelayanan',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_grup_indikator_mutu`;
CREATE TABLE `ref_grup_indikator_mutu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `indikator_mutu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_grup_indikator_mutu` (`id`, `indikator_mutu`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Indikator Mutu Keselamatan Pasien',	'',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Indikator Mutu Area Manajemen',	'',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Indikator Mutu Area Klinis',	'',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_ict_objects`;
CREATE TABLE `ref_ict_objects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ict_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_ict_objects_ict_type_id_foreign` (`ict_type_id`),
  CONSTRAINT `ref_ict_objects_ict_type_id_foreign` FOREIGN KEY (`ict_type_id`) REFERENCES `ref_ict_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_ict_types`;
CREATE TABLE `ref_ict_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_indikator_kinerja`;
CREATE TABLE `ref_indikator_kinerja` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `indikator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_unit_kerja` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `grup_kinerja_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_indikator_kinerja_id_unit_kerja_foreign` (`id_unit_kerja`),
  KEY `ref_indikator_kinerja_grup_kinerja_id_foreign` (`grup_kinerja_id`),
  CONSTRAINT `ref_indikator_kinerja_grup_kinerja_id_foreign` FOREIGN KEY (`grup_kinerja_id`) REFERENCES `ref_grup_indikator_kinerja` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ref_indikator_kinerja_id_unit_kerja_foreign` FOREIGN KEY (`id_unit_kerja`) REFERENCES `sys_structs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_indikator_kinerja` (`id`, `indikator`, `id_unit_kerja`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `grup_kinerja_id`) VALUES
(1,	'Indikator Kepuasan Masyarakat 1',	10,	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	2),
(2,	'Indikator Kepuasan Masyarakat 2',	10,	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	2),
(3,	'Indikator Sarana dan Prasarana 1',	10,	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	1),
(4,	'Indikator Sarana dan Prasarana 2',	10,	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	1),
(5,	'Indikator Standarisasi Pelayanan 1',	10,	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	3),
(6,	'Indikator Standarisasi Pelayanan 2',	10,	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	3);

DROP TABLE IF EXISTS `ref_indikator_kontrak`;
CREATE TABLE `ref_indikator_kontrak` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `sasaran_strategis_id` bigint(20) unsigned NOT NULL,
  `sasaran_program_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_indikator_kontrak_unit_kerja_id_foreign` (`unit_kerja_id`),
  KEY `ref_indikator_kontrak_sasaran_strategis_id_foreign` (`sasaran_strategis_id`),
  KEY `ref_indikator_kontrak_sasaran_program_id_foreign` (`sasaran_program_id`),
  CONSTRAINT `ref_indikator_kontrak_sasaran_program_id_foreign` FOREIGN KEY (`sasaran_program_id`) REFERENCES `ref_indikator_sasaran_program` (`id`),
  CONSTRAINT `ref_indikator_kontrak_sasaran_strategis_id_foreign` FOREIGN KEY (`sasaran_strategis_id`) REFERENCES `ref_indikator_sasaran_strategis` (`id`),
  CONSTRAINT `ref_indikator_kontrak_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_indikator_kontrak` (`id`, `unit_kerja_id`, `sasaran_strategis_id`, `sasaran_program_id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	10,	1,	9,	'Indikator Kontrak Pelayanan Medik 1',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(2,	10,	1,	9,	'Indikator Kontrak Pelayanan Medik 2',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(3,	10,	1,	10,	'Indikator Kontrak Pelayanan Medik 3',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(4,	10,	1,	10,	'Indikator Kontrak Pelayanan Medik 4',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(5,	10,	2,	11,	'Indikator Kontrak Pelayanan Medik 5',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(6,	10,	2,	11,	'Indikator Kontrak Pelayanan Medik 6',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(7,	10,	2,	12,	'Indikator Kontrak Pelayanan Medik 7',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(8,	10,	2,	12,	'Indikator Kontrak Pelayanan Medik 8',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(9,	28,	5,	1,	'Indikator Kontrak SIMRS 1',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(10,	28,	5,	1,	'Indikator Kontrak SIMRS 2',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(11,	28,	5,	2,	'Indikator Kontrak SIMRS 3',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(12,	28,	5,	2,	'Indikator Kontrak SIMRS 4',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29');

DROP TABLE IF EXISTS `ref_indikator_mutu`;
CREATE TABLE `ref_indikator_mutu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `indikator_mutu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_indikator_mutu_grup` int(11) DEFAULT NULL,
  `id_unit_kerja` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_indikator_mutu_id_unit_kerja_foreign` (`id_unit_kerja`),
  CONSTRAINT `ref_indikator_mutu_id_unit_kerja_foreign` FOREIGN KEY (`id_unit_kerja`) REFERENCES `sys_structs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_indikator_mutu` (`id`, `indikator_mutu`, `id_indikator_mutu_grup`, `id_unit_kerja`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1,	'Indikator Mutu Area Klinis 1',	3,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL),
(2,	'Indikator Mutu Area Klinis 2',	3,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL),
(3,	'Indikator Mutu Area Manajemen 1',	2,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL),
(4,	'Indikator Mutu Area Manajemen 2',	2,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL),
(5,	'Indikator Mutu Area Manajemen 3',	2,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL),
(6,	'Indikator Mutu Keselamatan Pasien 1',	1,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL),
(7,	'Indikator Mutu Keselamatan Pasien 2',	1,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28',	9,	NULL);

DROP TABLE IF EXISTS `ref_indikator_sasaran_program`;
CREATE TABLE `ref_indikator_sasaran_program` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `sasaran_strategis_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_indikator_sasaran_program_unit_kerja_id_foreign` (`unit_kerja_id`),
  KEY `ref_indikator_sasaran_program_sasaran_strategis_id_foreign` (`sasaran_strategis_id`),
  CONSTRAINT `ref_indikator_sasaran_program_sasaran_strategis_id_foreign` FOREIGN KEY (`sasaran_strategis_id`) REFERENCES `ref_indikator_sasaran_strategis` (`id`),
  CONSTRAINT `ref_indikator_sasaran_program_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_indikator_sasaran_program` (`id`, `unit_kerja_id`, `sasaran_strategis_id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	28,	5,	'Sasaran Program SIMRS 1',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(2,	28,	5,	'Sasaran Program SIMRS 2',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(3,	28,	6,	'Sasaran Program SIMRS 3',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(4,	28,	6,	'Sasaran Program SIMRS 4',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(5,	17,	3,	'Sasaran Program Tata Usaha 1',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(6,	17,	3,	'Sasaran Program Tata Usaha 2',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(7,	17,	4,	'Sasaran Program Tata Usaha 3',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(8,	17,	4,	'Sasaran Program Tata Usaha 4',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(9,	10,	1,	'Sasaran Program Pelayanan Medik 1',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(10,	10,	1,	'Sasaran Program Pelayanan Medik 2',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(11,	10,	2,	'Sasaran Program Pelayanan Medik 3',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29'),
(12,	10,	2,	'Sasaran Program Pelayanan Medik 4',	1,	NULL,	'2023-02-05 04:46:29',	'2023-02-05 04:46:29');

DROP TABLE IF EXISTS `ref_indikator_sasaran_strategis`;
CREATE TABLE `ref_indikator_sasaran_strategis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_indikator_sasaran_strategis_unit_kerja_id_foreign` (`unit_kerja_id`),
  CONSTRAINT `ref_indikator_sasaran_strategis_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_indikator_sasaran_strategis` (`id`, `unit_kerja_id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	10,	'Sasaran Strategis Pelayanan Medik 1',	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	10,	'Sasaran Strategis Pelayanan Medik 2',	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	17,	'Sasaran Strategis Tata Usaha 1',	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	17,	'Sasaran Strategis Tata Usaha 2',	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(5,	28,	'Sasaran Strategis SIMRS 1',	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(6,	28,	'Sasaran Strategis SIMRS 2',	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_jenis`;
CREATE TABLE `ref_jenis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_jenis` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Naskah Dinas',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Undangan',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_jenis_cuti`;
CREATE TABLE `ref_jenis_cuti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_cuti` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuota_pertahun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_jenis_cuti` (`id`, `jenis_cuti`, `kuota_pertahun`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Jenis Cuti 1',	'10',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Jenis Cuti 2',	'12',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Jenis Cuti 3',	'8',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_jenis_kompetensi`;
CREATE TABLE `ref_jenis_kompetensi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_kompetensi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_jenis_kompetensi` (`id`, `jenis_kompetensi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Cloud Computing',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Sistem Operasi',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Bahasa Pemprograman',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_jenis_pengendalian`;
CREATE TABLE `ref_jenis_pengendalian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_jenis_pengendalian` (`id`, `name`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Jenis Pengendalian 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Jenis Pengendalian 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Jenis Pengendalian 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_jenis_surat_keterangan`;
CREATE TABLE `ref_jenis_surat_keterangan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_surat_keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_jenis_surat_keterangan` (`id`, `jenis_surat_keterangan`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Jenis Surat Keterangan 1',	NULL,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Jenis Surat Keterangan 2',	NULL,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Jenis Surat Keterangan 3',	NULL,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_kategori_berita`;
CREATE TABLE `ref_kategori_berita` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_kategori_berita` (`id`, `name`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Kesehatan',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Olahraga',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Pandemi Covid-19',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	'Peraturan Pemerintah',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_kategori_pengumuman`;
CREATE TABLE `ref_kategori_pengumuman` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_kategori_pengumuman` (`id`, `name`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Seminar dan Forum Diskusi',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Kedinasan',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Hari Besar nasional',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	'Surat Keputusan',	NULL,	1,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_kategori_resiko`;
CREATE TABLE `ref_kategori_resiko` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_kategori_resiko` (`id`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Kategori Resiko 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Kategori Resiko 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Kategori Resiko 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_kategori_survey`;
CREATE TABLE `ref_kategori_survey` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kategori_survey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_kategori_survey` (`id`, `kategori_survey`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Peran Konsultasi',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	NULL,	'Manajemen Risiko',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	NULL,	'Kemampuan',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	NULL,	'Komunikasi',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(5,	NULL,	'Kesopanan',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(6,	NULL,	'Penguasaan Materi',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(7,	NULL,	'Kerapihan',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(8,	NULL,	'Kesimpulan',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(9,	NULL,	'Perilaku Auditor',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_klasifikasi`;
CREATE TABLE `ref_klasifikasi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_klasifikasi` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Biasa',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Terbatas',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Rahasi',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(4,	'Sangat Rahasi',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_kode_resiko`;
CREATE TABLE `ref_kode_resiko` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kode_resiko` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_kode_resiko` (`id`, `kode_resiko`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'KR3',	'Pernyataan Resiko 3',	'',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'KR2',	'Pernyataan Resiko 2',	'',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'KR1',	'Pernyataan Resiko 1',	'',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_lembaga_pelatihan`;
CREATE TABLE `ref_lembaga_pelatihan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` int(11) NOT NULL,
  `kotakab` int(11) NOT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_lembaga_pelatihan_telepon_unique` (`telepon`),
  UNIQUE KEY `ref_lembaga_pelatihan_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_lembaga_pelatihan` (`id`, `nama`, `alamat`, `provinsi`, `kotakab`, `telepon`, `email`, `pic`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'LPKIA',	'Komplek Bumi Panyawangan Jl Garcinia I No. 34 Desa Cimekar Kec. Cileunyi Kab Bandung 40623',	12,	164,	'9988774455',	'lpkia@email.com',	'Iskandar Zulkarnain',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Inixindo',	'Komplek Bumi Panyawangan Jl Garcinia I No. 34 Desa Cimekar Kec. Cileunyi Kab Bandung 40623',	12,	164,	'998877445566',	'inixindo@email.com',	'Tatang Suryana',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Moonsoon Academy',	'Komplek Bumi Panyawangan Jl Garcinia I No. 34 Desa Cimekar Kec. Cileunyi Kab Bandung 40623',	12,	164,	'2587413665',	'moonsoon@email.com',	'Irsyad Anam',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_letters`;
CREATE TABLE `ref_letters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'assignment,report',
  `format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_letters` (`id`, `type`, `format`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'assignment',	'[NO]/ST/IA/[MONTH]/[YEAR]',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'report',	'[NO]/LHA/IA/[MONTH]/[YEAR]',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'meeting',	'[NO]/RAPAT/[MONTH]/[YEAR]',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_level_resiko`;
CREATE TABLE `ref_level_resiko` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_level_resiko` (`id`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Level Resiko 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Level Resiko 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Level Resiko 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_org_structs`;
CREATE TABLE `ref_org_structs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'root, bod, division, branch',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1:presdir, 2:direktur, 3:ia division, 4:it division',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_org_structs_parent_id_foreign` (`parent_id`),
  CONSTRAINT `ref_org_structs_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `ref_org_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_org_structs_groups`;
CREATE TABLE `ref_org_structs_groups` (
  `group_id` bigint(20) unsigned NOT NULL,
  `struct_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `ref_org_structs_groups_group_id_struct_id_unique` (`group_id`,`struct_id`),
  KEY `ref_org_structs_groups_struct_id_foreign` (`struct_id`),
  CONSTRAINT `ref_org_structs_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ref_org_structs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ref_org_structs_groups_struct_id_foreign` FOREIGN KEY (`struct_id`) REFERENCES `ref_org_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_pegawai`;
CREATE TABLE `ref_pegawai` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `kodepos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_pegawai_city_id_foreign` (`city_id`),
  KEY `ref_pegawai_user_id_foreign` (`user_id`),
  CONSTRAINT `ref_pegawai_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `ref_city` (`id`),
  CONSTRAINT `ref_pegawai_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_pegawai` (`id`, `alamat`, `city_id`, `kodepos`, `telepon`, `created_by`, `updated_by`, `created_at`, `updated_at`, `user_id`) VALUES
(1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	1),
(2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	2),
(3,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	3),
(4,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	4),
(5,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	5),
(6,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	6),
(7,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	7),
(8,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	8),
(9,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	9),
(10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	10),
(11,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	11),
(12,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	12);

DROP TABLE IF EXISTS `ref_pelatihan`;
CREATE TABLE `ref_pelatihan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jenis_kompetensi_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_lembaga` bigint(20) unsigned DEFAULT NULL,
  `biaya` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_pelatihan_id_lembaga_foreign` (`id_lembaga`),
  KEY `ref_pelatihan_jenis_kompetensi_id_foreign` (`jenis_kompetensi_id`),
  CONSTRAINT `ref_pelatihan_id_lembaga_foreign` FOREIGN KEY (`id_lembaga`) REFERENCES `ref_lembaga_pelatihan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ref_pelatihan_jenis_kompetensi_id_foreign` FOREIGN KEY (`jenis_kompetensi_id`) REFERENCES `ref_jenis_kompetensi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_pelatihan` (`id`, `jenis_kompetensi_id`, `name`, `id_lembaga`, `biaya`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	2,	'Linux Ubuntu',	3,	'600000',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	1,	'Google Cloud',	2,	'5000000',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	1,	'AWS Lambda',	3,	'2000000',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	3,	'Visual Basic',	2,	'1000000',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(5,	3,	'PHP Laravel',	2,	'2000000',	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_positions`;
CREATE TABLE `ref_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_positions_location_id_foreign` (`location_id`),
  CONSTRAINT `ref_positions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `ref_org_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_prioritas_resiko`;
CREATE TABLE `ref_prioritas_resiko` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_prioritas_resiko` (`id`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Prioritas Resiko 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Prioritas Resiko 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Prioritas Resiko 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_province`;
CREATE TABLE `ref_province` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref_province_name_unique` (`name`),
  UNIQUE KEY `ref_province_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_province` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'ACEH',	'11',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(2,	'SUMATERA UTARA',	'12',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(3,	'SUMATERA BARAT',	'13',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(4,	'RIAU',	'14',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(5,	'JAMBI',	'15',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(6,	'SUMATERA SELATAN',	'16',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(7,	'BENGKULU',	'17',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(8,	'LAMPUNG',	'18',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(9,	'KEPULAUAN BANGKA BELITUNG',	'19',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(10,	'KEPULAUAN RIAU',	'21',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(11,	'DKI JAKARTA',	'31',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(12,	'JAWA BARAT',	'32',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(13,	'JAWA TENGAH',	'33',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(14,	'DAERAH ISTIMEWA YOGYAKARTA',	'34',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(15,	'JAWA TIMUR',	'35',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(16,	'BANTEN',	'36',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(17,	'BALI',	'51',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(18,	'NUSA TENGGARA BARAT',	'52',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(19,	'NUSA TENGGARA TIMUR',	'53',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(20,	'KALIMANTAN BARAT',	'61',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(21,	'KALIMANTAN TENGAH',	'62',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(22,	'KALIMANTAN SELATAN',	'63',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(23,	'KALIMANTAN TIMUR',	'64',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(24,	'KALIMANTAN UTARA',	'65',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(25,	'SULAWESI UTARA',	'71',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(26,	'SULAWESI TENGAH',	'72',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(27,	'SULAWESI SELATAN',	'73',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(28,	'SULAWESI TENGGARA',	'74',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(29,	'GORONTALO',	'75',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(30,	'SULAWESI BARAT',	'76',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(31,	'MALUKU',	'81',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(32,	'MALUKU UTARA',	'82',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(33,	'PAPUA',	'91',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19'),
(34,	'PAPUA BARAT',	'92',	1,	NULL,	'2023-02-05 04:46:19',	'2023-02-05 04:46:19');

DROP TABLE IF EXISTS `ref_sifat`;
CREATE TABLE `ref_sifat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_sifat` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Biasa',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Segera',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Sangat Segera',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_status_berkas`;
CREATE TABLE `ref_status_berkas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_status_berkas` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Amplop Tertutup',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Asli',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Copy',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(4,	'Tembusan',	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_surveys`;
CREATE TABLE `ref_surveys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_surveys` (`id`, `version`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'0',	'PAS Pemeriksaan Cabang Balikpapan',	'nonactive',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'1',	'Mohon  beri peringkat tingkat persetujuan Bapak/Ibu pada penyataan berikut mengenai kinerja kegiatan Tim Audit. Pilihlah 1,2,3 atau 4 (1 = tidak setuju, 2 = kurang setuju, 3 = setuju, dan 4 =',	'active',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'1',	'Lorem Ipsum',	'active',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_surveys_statements`;
CREATE TABLE `ref_surveys_statements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `statement` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_surveys_statements_survey_id_foreign` (`survey_id`),
  KEY `ref_surveys_statements_category_id_foreign` (`category_id`),
  CONSTRAINT `ref_surveys_statements_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `ref_kategori_survey` (`id`),
  CONSTRAINT `ref_surveys_statements_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `ref_surveys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_surveys_statements` (`id`, `survey_id`, `category_id`, `statement`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	1,	4,	'<p>Komunikasi yang dilakukan auditor kepada auditee lugas<br></p>',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	1,	1,	'<p>Kesopanan cukup baik<br></p>',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	2,	1,	'Pelaksanaan audit memberi nilai tambah atau mendatangkan manfaat di unit kerja Bapak/Ibu',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	2,	1,	'Tim Audit dapat menjadi mitra Bapak/Ibu untuk berkonsultasi',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(5,	2,	4,	'Bapak/Ibu mendapatkan penjelasan dari Tim Audit mengenai tujuan dan cakupan pemeriksaan',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(6,	2,	4,	'Isu yang penting dari hasil audit telah dikomunikasikan kepada Bapak/Ibu',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(7,	2,	4,	'Rekomendasi audit bersifat konstruktif dan apat diimplementasikan',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(8,	2,	4,	'Tim Audit telah memperhatikan/mempertimbangkan tanggapan Bapak/Ibu',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(9,	2,	4,	'Laporan hasil audit obyektif dan tidak bias',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(10,	2,	4,	'Laporan hasil audit jelas dan ringkas',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(11,	2,	2,	'Tim Audit telah menindaklanjuti risiko-risiko yang menjadi perhatian Bapak/Ibu',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(12,	2,	2,	'Ruang lingkup pemeriksaan Tim Audit telah mencakup tugas pokok dan kegiatan utama pada unit kerja Bapak/Ibu yang berisiko tinggi',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(13,	2,	3,	'Tim Audit menguasai permasalahan',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(14,	2,	9,	'Tim Audit bersikap sopan dan profesional',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(15,	2,	9,	'Tim Audit terampil dalam berkomunikasi',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(16,	2,	9,	'Tim Audit memelihara sikap obyektif',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(17,	2,	9,	'Tim Audit menjaga integritas',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(18,	2,	8,	'Secara Keseluruhan, Bapak/Ibu puas dengan proses dan hasil audit',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(19,	2,	2,	'<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Nunc urna eros, porttitor nec rutrum et, laoreet non metus. Mauris porta tempus purus vel scelerisque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas</span><br></p>',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(20,	2,	2,	'<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Proin nec nisl turpis. Quisque dapibus nec justo quis malesuada</span><br></p>',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(21,	2,	2,	'<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Mauris congue euismod rutrum. Cras quis quam ac turpis dictum vulputate ut sit amet diam. Quisque ullamcorper sed velit vitae luctus</span><br></p>',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(22,	2,	1,	'<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Quisque elementum semper nibh. Nam aliquet arcu in nibh volutpat pharetra</span><br></p>',	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_tindak_lanjut_disposisi`;
CREATE TABLE `ref_tindak_lanjut_disposisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tindak_lanjut_id` bigint(20) unsigned NOT NULL,
  `penerima` bigint(20) unsigned NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_tindak_lanjut_disposisi_tindak_lanjut_id_foreign` (`tindak_lanjut_id`),
  KEY `ref_tindak_lanjut_disposisi_penerima_foreign` (`penerima`),
  CONSTRAINT `ref_tindak_lanjut_disposisi_penerima_foreign` FOREIGN KEY (`penerima`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `ref_tindak_lanjut_disposisi_tindak_lanjut_id_foreign` FOREIGN KEY (`tindak_lanjut_id`) REFERENCES `trans_tindak_lanjut` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ref_tingkat_controllability`;
CREATE TABLE `ref_tingkat_controllability` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_tingkat_controllability` (`id`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Tingkat Kontrol 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	'Tingkat Kontrol 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	'Tingkat Kontrol 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `ref_tingkat_dampak`;
CREATE TABLE `ref_tingkat_dampak` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_tingkat_dampak` (`id`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Tingkat Dampak 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Tingkat Dampak 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Tingkat Dampak 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `ref_tingkat_probabilitas`;
CREATE TABLE `ref_tingkat_probabilitas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ref_tingkat_probabilitas` (`id`, `name`, `deskripsi`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Tingkat Probabilitas 3',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Tingkat Probabilitas 2',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Tingkat Probabilitas 1',	NULL,	NULL,	NULL,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `reply_threads`;
CREATE TABLE `reply_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `thread_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_threads_user_id_foreign` (`user_id`),
  CONSTRAINT `reply_threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__analysis`;
CREATE TABLE `risk_management__analysis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__analysis_identification_id_foreign` (`identification_id`),
  CONSTRAINT `risk_management__analysis_identification_id_foreign` FOREIGN KEY (`identification_id`) REFERENCES `risk_management__identification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__analysis_activity`;
CREATE TABLE `risk_management__analysis_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `analysis_id` bigint(20) unsigned DEFAULT NULL,
  `activity_id` bigint(20) unsigned DEFAULT NULL,
  `control_description_current` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `design` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `effectiveness` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `probability_id` bigint(20) unsigned DEFAULT NULL,
  `impact_id` bigint(20) unsigned DEFAULT NULL,
  `risk_level_id` bigint(20) unsigned DEFAULT NULL,
  `priority_id` bigint(20) unsigned DEFAULT NULL,
  `control_description_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `control_schedule_plan` date DEFAULT NULL,
  `struct_id` bigint(20) unsigned DEFAULT NULL,
  `pic_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__analysis_activity_analysis_id_foreign` (`analysis_id`),
  KEY `risk_management__analysis_activity_activity_id_foreign` (`activity_id`),
  KEY `risk_management__analysis_activity_probability_id_foreign` (`probability_id`),
  KEY `risk_management__analysis_activity_impact_id_foreign` (`impact_id`),
  KEY `risk_management__analysis_activity_risk_level_id_foreign` (`risk_level_id`),
  KEY `risk_management__analysis_activity_priority_id_foreign` (`priority_id`),
  KEY `risk_management__analysis_activity_struct_id_foreign` (`struct_id`),
  KEY `risk_management__analysis_activity_pic_id_foreign` (`pic_id`),
  CONSTRAINT `risk_management__analysis_activity_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `risk_management__identification_activity` (`id`),
  CONSTRAINT `risk_management__analysis_activity_analysis_id_foreign` FOREIGN KEY (`analysis_id`) REFERENCES `risk_management__analysis` (`id`),
  CONSTRAINT `risk_management__analysis_activity_impact_id_foreign` FOREIGN KEY (`impact_id`) REFERENCES `ref_tingkat_dampak` (`id`),
  CONSTRAINT `risk_management__analysis_activity_pic_id_foreign` FOREIGN KEY (`pic_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `risk_management__analysis_activity_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ref_prioritas_resiko` (`id`),
  CONSTRAINT `risk_management__analysis_activity_probability_id_foreign` FOREIGN KEY (`probability_id`) REFERENCES `ref_tingkat_probabilitas` (`id`),
  CONSTRAINT `risk_management__analysis_activity_risk_level_id_foreign` FOREIGN KEY (`risk_level_id`) REFERENCES `ref_level_resiko` (`id`),
  CONSTRAINT `risk_management__analysis_activity_struct_id_foreign` FOREIGN KEY (`struct_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__control`;
CREATE TABLE `risk_management__control` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__control_activity_id_foreign` (`activity_id`),
  CONSTRAINT `risk_management__control_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `risk_management__identification_activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__control_detail`;
CREATE TABLE `risk_management__control_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `control_id` bigint(20) unsigned NOT NULL,
  `priority_id` bigint(20) unsigned DEFAULT NULL,
  `control_alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `control_current` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `effectiveness` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `control_mandatory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `type_id` bigint(20) unsigned DEFAULT NULL,
  `pic_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__control_detail_control_id_foreign` (`control_id`),
  KEY `risk_management__control_detail_priority_id_foreign` (`priority_id`),
  KEY `risk_management__control_detail_type_id_foreign` (`type_id`),
  KEY `risk_management__control_detail_pic_id_foreign` (`pic_id`),
  CONSTRAINT `risk_management__control_detail_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `risk_management__control` (`id`),
  CONSTRAINT `risk_management__control_detail_pic_id_foreign` FOREIGN KEY (`pic_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `risk_management__control_detail_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ref_prioritas_resiko` (`id`),
  CONSTRAINT `risk_management__control_detail_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `ref_jenis_pengendalian` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__identification`;
CREATE TABLE `risk_management__identification` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `struct_id` bigint(20) unsigned NOT NULL,
  `period` year(4) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__identification_struct_id_foreign` (`struct_id`),
  CONSTRAINT `risk_management__identification_struct_id_foreign` FOREIGN KEY (`struct_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__identification_activity`;
CREATE TABLE `risk_management__identification_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `identification_id` bigint(20) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `risk_code_id` bigint(20) unsigned NOT NULL,
  `main_cause` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ucc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `impact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identification_id` (`identification_id`),
  KEY `risk_code_id` (`risk_code_id`),
  CONSTRAINT `identification_id` FOREIGN KEY (`identification_id`) REFERENCES `risk_management__identification` (`id`),
  CONSTRAINT `risk_code_id` FOREIGN KEY (`risk_code_id`) REFERENCES `ref_kode_resiko` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__monitoring`;
CREATE TABLE `risk_management__monitoring` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `analysis_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__monitoring_analysis_id_foreign` (`analysis_id`),
  CONSTRAINT `risk_management__monitoring_analysis_id_foreign` FOREIGN KEY (`analysis_id`) REFERENCES `risk_management__analysis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__monitoring_detail`;
CREATE TABLE `risk_management__monitoring_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `monitoring_id` bigint(20) unsigned NOT NULL,
  `priority_id` bigint(20) unsigned DEFAULT NULL,
  `control` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `output` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `pic_id` bigint(20) unsigned DEFAULT NULL,
  `trend` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `risk_level_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__monitoring_detail_monitoring_id_foreign` (`monitoring_id`),
  KEY `risk_management__monitoring_detail_priority_id_foreign` (`priority_id`),
  KEY `risk_management__monitoring_detail_pic_id_foreign` (`pic_id`),
  KEY `risk_management__monitoring_detail_risk_level_id_foreign` (`risk_level_id`),
  CONSTRAINT `risk_management__monitoring_detail_monitoring_id_foreign` FOREIGN KEY (`monitoring_id`) REFERENCES `risk_management__monitoring` (`id`),
  CONSTRAINT `risk_management__monitoring_detail_pic_id_foreign` FOREIGN KEY (`pic_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `risk_management__monitoring_detail_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `ref_prioritas_resiko` (`id`),
  CONSTRAINT `risk_management__monitoring_detail_risk_level_id_foreign` FOREIGN KEY (`risk_level_id`) REFERENCES `ref_level_resiko` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__profile`;
CREATE TABLE `risk_management__profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__profile_identification_id_foreign` (`identification_id`),
  CONSTRAINT `risk_management__profile_identification_id_foreign` FOREIGN KEY (`identification_id`) REFERENCES `risk_management__identification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `risk_management__profile_activity`;
CREATE TABLE `risk_management__profile_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `profile_id` bigint(20) unsigned NOT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `risk_category_id` bigint(20) unsigned DEFAULT NULL,
  `impact_id` bigint(20) unsigned DEFAULT NULL,
  `probability_id` bigint(20) unsigned DEFAULT NULL,
  `controllability_id` bigint(20) unsigned DEFAULT NULL,
  `score` tinyint(3) unsigned DEFAULT NULL,
  `rank` int(10) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `risk_management__profile_activity_profile_id_foreign` (`profile_id`),
  KEY `risk_management__profile_activity_activity_id_foreign` (`activity_id`),
  KEY `risk_management__profile_activity_risk_category_id_foreign` (`risk_category_id`),
  KEY `risk_management__profile_activity_impact_id_foreign` (`impact_id`),
  KEY `risk_management__profile_activity_probability_id_foreign` (`probability_id`),
  KEY `risk_management__profile_activity_controllability_id_foreign` (`controllability_id`),
  CONSTRAINT `risk_management__profile_activity_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `risk_management__identification_activity` (`id`),
  CONSTRAINT `risk_management__profile_activity_controllability_id_foreign` FOREIGN KEY (`controllability_id`) REFERENCES `ref_tingkat_controllability` (`id`),
  CONSTRAINT `risk_management__profile_activity_impact_id_foreign` FOREIGN KEY (`impact_id`) REFERENCES `ref_tingkat_dampak` (`id`),
  CONSTRAINT `risk_management__profile_activity_probability_id_foreign` FOREIGN KEY (`probability_id`) REFERENCES `ref_tingkat_probabilitas` (`id`),
  CONSTRAINT `risk_management__profile_activity_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `risk_management__profile` (`id`),
  CONSTRAINT `risk_management__profile_activity_risk_category_id_foreign` FOREIGN KEY (`risk_category_id`) REFERENCES `ref_kategori_resiko` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_activities`;
CREATE TABLE `sys_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_activities_target_type_target_id_index` (`target_type`,`target_id`),
  KEY `sys_activities_user_id_foreign` (`user_id`),
  KEY `sys_activities_position_id_foreign` (`position_id`),
  CONSTRAINT `sys_activities_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_activities` (`id`, `target_type`, `target_id`, `module`, `message`, `ip`, `user_id`, `position_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'App\\Models\\Setting\\Org\\Struct',	1,	'setting_org_root',	'Mengubah Data Rumah Sakit Jantung dan Pembuluh Darah Harapan Kita (RSJPDHK)',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:47:59',	NULL),
(2,	'App\\Models\\Setting\\Org\\Struct',	1,	'setting_org_root',	'Mengubah Data Rumah Sakit Jantung dan Pembuluh Darah Harapan Kita (RSJPDHK)',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:48:18',	NULL),
(3,	'App\\Models\\Setting\\Org\\Struct',	2,	'setting_org_boc',	'Mengubah Data Dewan Pengawas',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:09',	NULL),
(4,	'App\\Models\\Setting\\Org\\Struct',	3,	'setting_org_bod',	'Mengubah Data Direktur Utama',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:19',	NULL),
(5,	'App\\Models\\Setting\\Org\\Struct',	4,	'setting_org_bod',	'Mengubah Data Direktur Perencanaan Organisasi & Umum',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:24',	NULL),
(6,	'App\\Models\\Setting\\Org\\Struct',	5,	'setting_org_bod',	'Mengubah Data Direktur Pelayanan Medik, Keperawatan dan Penunjang',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:29',	NULL),
(7,	'App\\Models\\Setting\\Org\\Struct',	6,	'setting_org_bod',	'Mengubah Data Direktur Sumber Daya Manusia, Pendidikan dan Penelitian',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:39',	NULL),
(8,	'App\\Models\\Setting\\Org\\Struct',	7,	'setting_org_bod',	'Mengubah Data Direktur Keuangan dan Barang Milik Negara',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:51',	NULL),
(9,	'App\\Models\\Setting\\Org\\Struct',	8,	'setting_org_bod',	'Mengubah Data Satuan Pemeriksa Internal',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:54:57',	NULL),
(10,	'App\\Models\\Setting\\Org\\Struct',	10,	'setting_org_division',	'Mengubah Data Pelayanan Medik',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:57:23',	NULL),
(11,	'App\\Models\\Setting\\Org\\Struct',	9,	'setting_org_division',	'Mengubah Data Sumber Daya Manusia',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:57:39',	NULL),
(12,	'App\\Models\\Setting\\Org\\Struct',	11,	'setting_org_division',	'Mengubah Data Substansi Umum',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:57:54',	NULL),
(13,	'App\\Models\\Setting\\Org\\Struct',	12,	'setting_org_division',	'Mengubah Data Substansi Perencanaan & Evaluasi',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:58:12',	NULL),
(14,	'App\\Models\\Setting\\Org\\Struct',	13,	'setting_org_division',	'Mengubah Data Substansi Anggaran',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:58:22',	NULL),
(15,	'App\\Models\\Setting\\Org\\Struct',	14,	'setting_org_division',	'Mengubah Data Substansi Akuntansi dan BMN',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 04:58:38',	NULL),
(16,	'App\\Models\\Setting\\Org\\Struct',	15,	'setting_org_department',	'Mengubah Data Administrasi SDM',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:00:00',	NULL),
(17,	'App\\Models\\Setting\\Org\\Struct',	16,	'setting_org_department',	'Mengubah Data Pelayanan Medik Rawat Jalan',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:00:16',	NULL),
(18,	'App\\Models\\Setting\\Org\\Struct',	17,	'setting_org_department',	'Mengubah Data Tata Usaha',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:00:29',	NULL),
(19,	'App\\Models\\Setting\\Org\\Struct',	18,	'setting_org_department',	'Mengubah Data Perencanaan SDM',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:00:54',	NULL),
(20,	'App\\Models\\Setting\\Org\\Struct',	19,	'setting_org_department',	'Mengubah Data Rumah Tangga',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:01:10',	NULL),
(21,	'App\\Models\\Setting\\Org\\Struct',	20,	'setting_org_department',	'Mengubah Data Sub Substansi Perencanaan Program',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:01:28',	NULL),
(22,	'App\\Models\\Setting\\Org\\Struct',	21,	'setting_org_department',	'Mengubah Data Sub Substansi Evaluasi & Pelaporan',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:01:45',	NULL),
(23,	'App\\Models\\Setting\\Org\\Struct',	22,	'setting_org_department',	'Mengubah Data Sub Substansi Akuntansi',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:01:56',	NULL),
(24,	'App\\Models\\Setting\\Org\\Struct',	23,	'setting_org_department',	'Mengubah Data Sub Substansi Pengelolaan BMN',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:02:19',	NULL),
(25,	'App\\Models\\Setting\\Org\\Struct',	24,	'setting_org_department',	'Mengubah Data Sub Substansi Penyusunan dan Evaluasi Anggaran',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:02:35',	NULL),
(26,	'App\\Models\\Setting\\Org\\Struct',	25,	'setting_org_department',	'Mengubah Data Sub SUbstansi Perbendaharaan & Pelaksanaan Anggaran',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:02:50',	NULL),
(27,	'App\\Models\\Setting\\Org\\Struct',	26,	'setting_org_instalasi',	'Mengubah Data Instalasi Rawat Jalan',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:03:53',	NULL),
(28,	'App\\Models\\Setting\\Org\\Struct',	27,	'setting_org_instalasi',	'Mengubah Data Instalasi Bedah',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:03:59',	NULL),
(29,	'App\\Models\\Setting\\Org\\Struct',	28,	'setting_org_instalasi',	'Mengubah Data Instalasi SIMRS',	'127.0.0.1',	1,	NULL,	1,	NULL,	'2023-02-05 05:04:06',	NULL);

DROP TABLE IF EXISTS `sys_approvals`;
CREATE TABLE `sys_approvals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 1 COMMENT '1:sequence/berurutan, 2:pararel/berbarengan',
  `order` int(11) NOT NULL DEFAULT 1,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|rejected|approved',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_approvals_target_type_target_id_index` (`target_type`,`target_id`),
  KEY `sys_approvals_role_id_foreign` (`role_id`),
  KEY `sys_approvals_user_id_foreign` (`user_id`),
  KEY `sys_approvals_position_id_foreign` (`position_id`),
  CONSTRAINT `sys_approvals_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`),
  CONSTRAINT `sys_approvals_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`),
  CONSTRAINT `sys_approvals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_failed_jobs`;
CREATE TABLE `sys_failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_files_target_type_target_id_index` (`target_type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_instalasi`;
CREATE TABLE `sys_instalasi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_instalasi_parent_id_foreign` (`parent_id`),
  CONSTRAINT `sys_instalasi_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_jobs`;
CREATE TABLE `sys_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_komite`;
CREATE TABLE `sys_komite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_komite_parent_id_foreign` (`parent_id`),
  CONSTRAINT `sys_komite_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_menu_module_unique` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_menu` (`id`, `parent_id`, `module`, `order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'korespondensi',	1,	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(2,	1,	'korespondensi.nota-dinas',	2,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	1,	'korespondensi.tindak-lanjut',	3,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(4,	NULL,	'surat-keterangan',	4,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(5,	4,	'surat-keterangan.permintaan',	5,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(6,	4,	'surat-keterangan.penerbitan',	6,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(7,	NULL,	'administrasi-unit',	7,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(8,	7,	'administrasi-unit.kontrak-kerja-unit',	8,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(9,	7,	'administrasi-unit.indikator-mutu-unit',	9,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(10,	7,	'administrasi-unit.latbang',	10,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(11,	7,	'administrasi-unit.surat-keterangan',	11,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(12,	7,	'administrasi-unit.kontrak-kinerja-unit',	12,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(13,	7,	'administrasi-unit.penilaian-kinerja-unit',	13,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(14,	7,	'administrasi-unit.penilaian-kinerja-pimpinan',	14,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(15,	7,	'administrasi-unit.penilaian-kinerja-individu',	15,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(16,	7,	'administrasi-unit.cuti',	16,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(17,	NULL,	'meeting',	17,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(18,	17,	'meeting.meeting-invit',	18,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(19,	17,	'meeting.meeting-recap',	19,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(20,	NULL,	'risk-management',	20,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(21,	20,	'risk-management.identification',	21,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(22,	20,	'risk-management.profile',	22,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(23,	20,	'risk-management.analysis',	23,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(24,	20,	'risk-management.control',	24,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(25,	20,	'risk-management.monitoring',	25,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `sys_menu_flows`;
CREATE TABLE `sys_menu_flows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 1 COMMENT '1:sequence/berurutan, 2:pararel/berbarengan',
  `order` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_menu_flows_menu_id_foreign` (`menu_id`),
  KEY `sys_menu_flows_role_id_foreign` (`role_id`),
  CONSTRAINT `sys_menu_flows_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_menu_flows_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_menu_flows` (`id`, `menu_id`, `role_id`, `type`, `order`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	2,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(2,	3,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(3,	5,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(4,	6,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(5,	8,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(6,	9,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(7,	10,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(8,	11,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(9,	12,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(10,	13,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(11,	14,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(12,	15,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(13,	16,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(14,	18,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(15,	19,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(16,	21,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(17,	22,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(18,	23,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(19,	24,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27'),
(20,	25,	3,	1,	1,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27');

DROP TABLE IF EXISTS `sys_migrations`;
CREATE TABLE `sys_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_sys_users_table',	1),
(2,	'2014_10_12_100000_create_sys_password_resets_table',	1),
(3,	'2019_08_19_000000_create_sys_failed_jobs_table',	1),
(4,	'2022_02_14_102957_create_sys_jobs_table',	1),
(5,	'2022_02_14_113847_create_sys_permission_tables',	1),
(6,	'2022_02_14_123893_create_sys_structs_table',	1),
(7,	'2022_02_14_142015_create_sys_activities_table',	1),
(8,	'2022_02_14_142042_create_sys_notifications_table',	1),
(9,	'2022_02_14_142058_create_sys_files_table',	1),
(10,	'2022_02_14_142068_create_sys_menu_table',	1),
(11,	'2022_02_14_142078_create_sys_approvals_table',	1),
(12,	'2022_02_14_142111_create_ref_org_structs_table',	1),
(13,	'2022_02_23_152708_create_ref_org_structs_groups_table',	1),
(14,	'2022_02_23_152709_create_ref_ict_objects_table',	1),
(15,	'2022_02_23_152710_create_ref_ext_objects_table',	1),
(16,	'2022_02_24_042619_create_ref_letters_table',	1),
(17,	'2022_02_24_042620_create_ref_aspects_table',	1),
(18,	'2022_02_24_151558_create_trans_rkia_table',	1),
(19,	'2022_03_01_213154_create_trans_assignments_table',	1),
(20,	'2022_04_05_181713_create_trans_closing_table',	1),
(21,	'2022_04_26_274404_create_trans_surveys_regs_table',	1),
(22,	'2022_05_19_101102_create_trans_assignments_users_table',	1),
(23,	'2022_05_19_101902_create_trans_apm_table',	1),
(24,	'2022_05_27_103253_drop_aspect_on_trans_apm_details_table',	1),
(25,	'2022_05_30_155320_create_trans_kka_samples_table',	1),
(26,	'2022_05_31_103137_create_trans_kka_feedbacks_table',	1),
(27,	'2022_05_31_103706_create_trans_kka_worksheets_table',	1),
(28,	'2022_06_07_163311_update_latter_manual_trans_assignments',	1),
(29,	'2022_06_07_180504_add_coloum_apm_details_id_to_trans_kka_samples_details',	1),
(30,	'2022_06_13_180516_add_level_to_trans_kka_samples_details',	1),
(31,	'2022_06_29_234545_update_ref_org_structs_table',	1),
(32,	'2022_07_04_163734_create_ref_examples_table',	1),
(33,	'2022_07_04_170424_create_trans_cruds_table',	1),
(34,	'2022_07_05_051944_create_ref_grup_indikator_kinerja_table',	1),
(35,	'2022_07_05_171949_create_trans_meetings_table',	1),
(36,	'2022_07_05_172252_create_ref_surat',	1),
(37,	'2022_07_07_104058_create_trans_agenda_table',	1),
(38,	'2022_07_08_145201_create_ref_geo',	1),
(39,	'2022_07_12_095230_create_trans_meetings_recap_table',	1),
(40,	'2022_07_19_121620_create_trans_surat_masuk',	1),
(41,	'2022_07_19_163739_create_trans_nota_dinas_table',	1),
(42,	'2022_07_20_183634_create_master_pegawai_table',	1),
(43,	'2022_07_21_121620_create_trans_surat_keluar',	1),
(44,	'2022_07_21_190827_create_trans_disposisi_langsung_table',	1),
(45,	'2022_07_22_063433_create_tb_master_indikator_kinerja',	1),
(46,	'2022_07_22_075759_create_tb_master_indikator_mutu',	1),
(47,	'2022_07_22_094938_create_master_lembaga_pelatihan',	1),
(48,	'2022_07_22_102953_create_tb_master_pelatihan',	1),
(49,	'2022_07_23_091651_create_master_jenis_cuti',	1),
(50,	'2022_07_23_093829_create_master_jenis_kompetensi',	1),
(51,	'2022_07_23_101319_create_master_jenis_surat_keterangan',	1),
(52,	'2022_07_23_123751_create_kontrak_kinerja_unit',	1),
(53,	'2022_07_23_130649_create_kontrak_kinerja_unit_detail',	1),
(54,	'2022_07_23_143110_create_trans_surat_keterangan',	1),
(55,	'2022_07_27_135259_create_trans_surat_keterangan_cc',	1),
(56,	'2022_07_28_210839_create_indikator_mutu_unit',	1),
(57,	'2022_07_28_232836_create_trans_undangan_table',	1),
(58,	'2022_07_31_203653_create_trans_lha_table',	1),
(59,	'2022_08_01_034350_create_trans_lha_toc_table',	1),
(60,	'2022_08_01_063632_create_trans_lha_inspection_table',	1),
(61,	'2022_08_01_072659_create_trans_lha_resume_table',	1),
(62,	'2022_08_01_081645_create_trans_lha_result_table',	1),
(63,	'2022_08_01_134716_create_sys_komite_table',	1),
(64,	'2022_08_01_142634_create_sys_instalasi_table',	1),
(65,	'2022_08_02_013411_create_ref_staffmedik_table',	1),
(66,	'2022_08_10_144007_create_ref_status_berkas',	1),
(67,	'2022_08_25_152822_create_sys_unit_instalasi',	1),
(68,	'2022_08_30_143815_create_ref_kategori_survey',	1),
(69,	'2022_08_31_120254_create_trans_cuti',	1),
(70,	'2022_09_02_140557_create_ref_kategori_resiko',	1),
(71,	'2022_09_02_151026_create_ref_prioritas_resiko_table',	1),
(72,	'2022_09_02_231036_create_ref_kode_resiko',	1),
(73,	'2022_09_02_231959_create_ref_level_resiko',	1),
(74,	'2022_09_02_233815_create_ref_tingkat_probabilitias',	1),
(75,	'2022_09_07_105050_create_ref_tingkat_dampak_table',	1),
(76,	'2022_09_07_115408_create_ref_survey_table',	1),
(77,	'2022_09_07_115440_create_ref_survey_details_table',	1),
(78,	'2022_09_08_150507_create_trans_manrisk_identifikasi_table',	1),
(79,	'2022_09_08_151203_create_trans_manrisk_identifikasi_details_table',	1),
(80,	'2022_09_08_233733_create_trans_manrisk_analisis_table',	1),
(81,	'2022_09_29_093622_create_forum_categories_table',	1),
(82,	'2022_09_29_093634_create_threads_table',	1),
(83,	'2022_09_29_133319_create_ref_grup_indikator_mutu',	1),
(84,	'2022_09_30_132803_update_common_field_into_ref_indikator_mutu',	1),
(85,	'2022_10_01_233612_create_favorite_threads_table',	1),
(86,	'2022_10_02_010701_create_comment_threads_table',	1),
(87,	'2022_10_02_020642_create_reply_threads_table',	1),
(88,	'2022_10_04_181650_create_risiko_analisis_table',	1),
(89,	'2022_10_06_115058_create_ref_tingkat_controllability_table',	1),
(90,	'2022_10_06_214157_create_ref_jenis_pengendalian_table',	1),
(91,	'2022_10_06_221630_create_profil_resikos_table',	1),
(92,	'2022_10_06_221647_create_profil_resiko_details_table',	1),
(93,	'2022_10_10_143821_create_pengendalian_resikos_table',	1),
(94,	'2022_10_10_143832_create_pengendalian_resiko_details_table',	1),
(95,	'2022_10_24_144904_update_common_field_into_trans_surat_keterangan',	1),
(96,	'2022_10_24_170426_update_judul_rapat_into_trans_undangan',	1),
(97,	'2022_10_24_173109_create_trans_undangan_parts',	1),
(98,	'2022_10_25_134544_update_ref_kategori_survey_table',	1),
(99,	'2022_10_26_170806_update_hal_sifat_into_trans_undangan_table',	1),
(100,	'2022_10_27_135733_create_trans_notulen_rapat_table',	1),
(101,	'2022_10_27_154132_update_hal_masuk_kerja_into_trans_cuti_table',	1),
(102,	'2022_10_30_125701_sys_structs_add_new_column',	1),
(103,	'2022_10_31_151734_trans_nota_dinas_add_column_sifat_surat',	1),
(104,	'2022_11_01_141330_create_risk_management_identification',	1),
(105,	'2022_11_01_151602_sys_users_tipe_struktur',	1),
(106,	'2022_11_01_154606_trans_undangan_details_alter_table',	1),
(107,	'2022_11_02_133214_undangan_rapat_notulen',	1),
(108,	'2022_11_02_133236_undangan_rapat_pemimpin',	1),
(109,	'2022_11_02_193108_create_risk_management__profile',	1),
(110,	'2022_11_02_231835_create_risk_management__analysis',	1),
(111,	'2022_11_04_214420_create_risk_management__control',	1),
(112,	'2022_11_05_185053_notulen_rapat_add_column',	1),
(113,	'2022_11_07_113535_trans_notulen_rapat_drop_column',	1),
(114,	'2022_11_07_124921_create_risk_management__monitoring',	1),
(115,	'2022_11_16_015950_alter_trans_agenda_table',	1),
(116,	'2022_11_16_020132_alter_trans_agenda_details_table',	1),
(117,	'2022_11_18_194913_update_trans_apm_details_table',	1),
(118,	'2022_11_20_231804_alter_add_action_trans_agenda_table',	1),
(119,	'2022_11_25_073725_create_doc_acl_rules_table',	1),
(120,	'2022_11_25_100328_create_sys_quotes_table',	1),
(121,	'2022_11_26_093021_create_trans_pk_individu_table',	1),
(122,	'2022_11_26_131335_create_table_trans_tindak_lanjut',	1),
(123,	'2022_11_26_205207_update_table_trans_agenda',	1),
(124,	'2022_11_26_210712_create_table_trans_agenda_report',	1),
(125,	'2022_11_27_163644_create_trans_cuti_pegawai',	1),
(126,	'2022_11_28_091150_update_table_ref_surveys',	1),
(127,	'2022_11_28_130158_crate_trans_pk_pimpinan_table',	1),
(128,	'2022_11_29_140826_create_master_kategori_berita',	1),
(129,	'2022_11_29_141508_create_master_kategori_pengumuman',	1),
(130,	'2022_12_01_025922_alter_sys_structs_add_extension_column',	1),
(131,	'2022_12_01_102442_create_trans_berita_table',	1),
(132,	'2022_12_01_133556_create_trans_pengumuman_table',	1),
(133,	'2022_12_01_184048_update_table_ref_indikator_kinerja',	1),
(134,	'2022_12_02_005806_alter_ref_pelatihan_jenis_kompetensi_id_column',	1),
(135,	'2022_12_02_162224_alter_table_menu_penilaian_kinerja',	1),
(136,	'2022_12_04_130446_update_trans_pengumuman_table',	1),
(137,	'2022_12_05_023056_create_latbang',	1),
(138,	'2022_12_05_094220_update_trans_berita_table',	1),
(139,	'2022_12_05_094740_add_colomn_judul_pengumuman_table',	1),
(140,	'2022_12_05_204451_add_description_to_ref_jenis_pengendalian_table',	1),
(141,	'2022_12_05_220704_add_description_to_ref_jenis_surat_keterangan_table',	1),
(142,	'2022_12_05_224954_add_description_to_ref_indikator_mutu',	1),
(143,	'2022_12_05_231021_add_description_to_ref_grup_indikator_kinerja',	1),
(144,	'2022_12_05_233035_add_description_to_ref_indikator_kinerja',	1),
(145,	'2022_12_07_112908_update_table_trans_penilaian',	1),
(146,	'2022_12_07_153101_alter_trans_berita',	1),
(147,	'2022_12_07_160100_alter_trans_pengumuman',	1),
(148,	'2022_12_07_202321_alter_trans_surat_keterangan',	1),
(149,	'2022_12_07_203105_create_trans_surat_keterangan__penerbitan',	1),
(150,	'2022_12_09_080647_alter_table_ref_pegawai',	1),
(151,	'2022_12_09_091739_alter_sys_users',	1),
(152,	'2022_12_10_093555_alter_table_trans_detail_mutuindividupk',	1),
(153,	'2022_12_10_094108_add_status_to_indikator_mutu_unit',	1),
(154,	'2022_12_10_131056_add_tgl_surat_keterangan_to_trans_surat_keterangan__penerbitan',	1),
(155,	'2022_12_10_134038_add_indikator_kinerja_id_to_kontrak_kinerja_unit_detail',	1),
(156,	'2022_12_10_145611_alter_column_int_trans_pk_individu',	1),
(157,	'2022_12_10_151130_alter_risk_management__monitoring',	1),
(158,	'2022_12_12_090430_create_table_trans_imunit',	1),
(159,	'2022_12_17_085129_remove_indikator_mutu_id_from_trans_imunit_details_table',	1),
(160,	'2022_12_17_151630_add_colomn_sumber_trans_pengumuman_table',	1),
(161,	'2022_12_17_152624_add_colomn_sumber_trans_berita_table',	1),
(162,	'2022_12_19_132500_add_colomn_social_media_sys_structs_table',	1),
(163,	'2022_12_21_090821_create_ref_indikator_sasaran_strategis',	1),
(164,	'2022_12_21_104834_create_ref_indikator_sasaran_program',	1),
(165,	'2022_12_21_112140_create_ref_indikator_kontrak',	1),
(166,	'2022_12_22_204357_alter_table_trans_surat_keterangan_penerbitan',	1),
(167,	'2022_12_26_014250_alter_trans_nota_dinas_add_pembuka_column',	1),
(168,	'2022_12_26_194343_alter_table_trans_penilaian_add_bulan',	1),
(169,	'2023_01_03_094813_create_ref_tindak_lanjut_disposisi_table',	1),
(170,	'2023_01_10_094813_create_latbang_pelaksanaan_table',	1),
(171,	'2023_01_14_160302_add_status_to_ref_tindak_lanjut_disposisi',	1),
(172,	'2023_01_17_162058_alter_table_trans_imunit',	1),
(173,	'2023_01_17_163416_alter_table_indikator_mutu_unit',	1);

DROP TABLE IF EXISTS `sys_notifications`;
CREATE TABLE `sys_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_notifications_target_type_target_id_index` (`target_type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_notifications_users`;
CREATE TABLE `sys_notifications_users` (
  `notification_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `readed_at` timestamp NULL DEFAULT NULL,
  KEY `sys_notifications_users_notification_id_foreign` (`notification_id`),
  KEY `sys_notifications_users_user_id_foreign` (`user_id`),
  KEY `sys_notifications_users_position_id_foreign` (`position_id`),
  CONSTRAINT `sys_notifications_users_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `sys_notifications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_notifications_users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_notifications_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_password_resets`;
CREATE TABLE `sys_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `sys_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_permissions` (`id`, `name`, `guard_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'dashboard.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(2,	'korespondensi.nota-dinas.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(3,	'korespondensi.nota-dinas.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(4,	'korespondensi.nota-dinas.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(5,	'korespondensi.nota-dinas.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(6,	'korespondensi.nota-dinas.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(7,	'korespondensi.tindak-lanjut.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(8,	'korespondensi.tindak-lanjut.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(9,	'korespondensi.tindak-lanjut.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(10,	'korespondensi.tindak-lanjut.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(11,	'korespondensi.tindak-lanjut.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(12,	'surat-keterangan.permintaan.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(13,	'surat-keterangan.permintaan.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(14,	'surat-keterangan.permintaan.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(15,	'surat-keterangan.permintaan.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(16,	'surat-keterangan.permintaan.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(17,	'surat-keterangan.penerbitan.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(18,	'surat-keterangan.penerbitan.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(19,	'surat-keterangan.penerbitan.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(20,	'surat-keterangan.penerbitan.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(21,	'surat-keterangan.penerbitan.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(22,	'administrasi-unit.latbang.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(23,	'administrasi-unit.latbang.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(24,	'administrasi-unit.latbang.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(25,	'administrasi-unit.latbang.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(26,	'administrasi-unit.latbang.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(27,	'administrasi-unit.latbang.history',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(28,	'administrasi-unit.penilaian-kinerja-unit.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(29,	'administrasi-unit.penilaian-kinerja-unit.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(30,	'administrasi-unit.penilaian-kinerja-unit.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(31,	'administrasi-unit.penilaian-kinerja-unit.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(32,	'administrasi-unit.penilaian-kinerja-unit.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(33,	'administrasi-unit.penilaian-kinerja-unit.history',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(34,	'administrasi-unit.penilaian-kinerja-pimpinan.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(35,	'administrasi-unit.penilaian-kinerja-pimpinan.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(36,	'administrasi-unit.penilaian-kinerja-pimpinan.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(37,	'administrasi-unit.penilaian-kinerja-pimpinan.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(38,	'administrasi-unit.penilaian-kinerja-pimpinan.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(39,	'administrasi-unit.penilaian-kinerja-pimpinan.history',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(40,	'administrasi-unit.penilaian-kinerja-individu.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(41,	'administrasi-unit.penilaian-kinerja-individu.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(42,	'administrasi-unit.penilaian-kinerja-individu.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(43,	'administrasi-unit.penilaian-kinerja-individu.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(44,	'administrasi-unit.penilaian-kinerja-individu.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(45,	'administrasi-unit.penilaian-kinerja-individu.history',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(46,	'administrasi-unit.indikator-mutu-unit.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(47,	'administrasi-unit.indikator-mutu-unit.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(48,	'administrasi-unit.indikator-mutu-unit.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(49,	'administrasi-unit.indikator-mutu-unit.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(50,	'administrasi-unit.indikator-mutu-unit.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(51,	'administrasi-unit.personalia-unit.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(52,	'administrasi-unit.personalia-unit.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(53,	'administrasi-unit.personalia-unit.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(54,	'administrasi-unit.personalia-unit.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(55,	'administrasi-unit.personalia-unit.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(56,	'administrasi-unit.kontrak-kerja-unit.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(57,	'administrasi-unit.kontrak-kerja-unit.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(58,	'administrasi-unit.kontrak-kerja-unit.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(59,	'administrasi-unit.kontrak-kerja-unit.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(60,	'administrasi-unit.kontrak-kerja-unit.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(61,	'administrasi-unit.survey-kepuasan.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(62,	'administrasi-unit.survey-kepuasan.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(63,	'administrasi-unit.survey-kepuasan.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(64,	'administrasi-unit.survey-kepuasan.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(65,	'administrasi-unit.survey-kepuasan.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(66,	'administrasi-unit.survey-latbang.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(67,	'administrasi-unit.survey-latbang.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(68,	'administrasi-unit.survey-latbang.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(69,	'administrasi-unit.survey-latbang.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(70,	'administrasi-unit.survey-latbang.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(71,	'administrasi-unit.kontrak-kinerja-unit.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(72,	'administrasi-unit.kontrak-kinerja-unit.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:23',	'2023-02-05 04:46:23'),
(73,	'administrasi-unit.kontrak-kinerja-unit.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(74,	'administrasi-unit.kontrak-kinerja-unit.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(75,	'administrasi-unit.kontrak-kinerja-unit.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(76,	'administrasi-unit.cuti.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(77,	'administrasi-unit.cuti.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(78,	'administrasi-unit.cuti.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(79,	'administrasi-unit.cuti.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(80,	'administrasi-unit.cuti.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(81,	'example.crud.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(82,	'example.crud.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(83,	'example.crud.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(84,	'example.crud.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(85,	'example.crud.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(86,	'kolaborasi.forum.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(87,	'kolaborasi.forum.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(88,	'kolaborasi.forum.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(89,	'kolaborasi.forum.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(90,	'kolaborasi.forum.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(91,	'kolaborasi.dokumen-file.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(92,	'kolaborasi.dokumen-file.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(93,	'kolaborasi.dokumen-file.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(94,	'kolaborasi.dokumen-file.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(95,	'kolaborasi.dokumen-file.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(96,	'agenda-kegiatan.agenda.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(97,	'agenda-kegiatan.agenda.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(98,	'agenda-kegiatan.agenda.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(99,	'agenda-kegiatan.agenda.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(100,	'agenda-kegiatan.agenda.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(101,	'agenda-kegiatan.undangan-rapat.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(102,	'agenda-kegiatan.undangan-rapat.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(103,	'agenda-kegiatan.undangan-rapat.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(104,	'agenda-kegiatan.undangan-rapat.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(105,	'agenda-kegiatan.undangan-rapat.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(106,	'agenda-kegiatan.absensi.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(107,	'agenda-kegiatan.absensi.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(108,	'agenda-kegiatan.absensi.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(109,	'agenda-kegiatan.absensi.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(110,	'agenda-kegiatan.absensi.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(111,	'agenda-kegiatan.notulensi.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(112,	'agenda-kegiatan.notulensi.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(113,	'agenda-kegiatan.notulensi.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(114,	'agenda-kegiatan.notulensi.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(115,	'agenda-kegiatan.notulensi.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(116,	'agenda-kegiatan.laporan-pelaksanaan.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(117,	'agenda-kegiatan.laporan-pelaksanaan.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(118,	'agenda-kegiatan.laporan-pelaksanaan.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(119,	'agenda-kegiatan.laporan-pelaksanaan.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(120,	'agenda-kegiatan.laporan-pelaksanaan.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(121,	'meeting.meeting-invit.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(122,	'meeting.meeting-invit.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:24',	'2023-02-05 04:46:24'),
(123,	'meeting.meeting-invit.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(124,	'meeting.meeting-invit.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(125,	'meeting.meeting-invit.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(126,	'meeting.meeting-recap.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(127,	'meeting.meeting-recap.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(128,	'meeting.meeting-recap.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(129,	'meeting.meeting-recap.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(130,	'meeting.meeting-recap.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(131,	'survey.survey-reg.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(132,	'survey.survey-reg.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(133,	'survey.survey-reg.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(134,	'survey.survey-recap.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(135,	'publikasi.berita.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(136,	'publikasi.berita.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(137,	'publikasi.berita.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(138,	'publikasi.berita.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(139,	'publikasi.pengumuman.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(140,	'publikasi.pengumuman.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(141,	'publikasi.pengumuman.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(142,	'publikasi.pengumuman.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(143,	'risk-management.identification.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(144,	'risk-management.identification.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(145,	'risk-management.identification.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(146,	'risk-management.identification.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(147,	'risk-management.identification.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(148,	'risk-management.profile.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(149,	'risk-management.profile.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(150,	'risk-management.profile.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(151,	'risk-management.profile.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:25',	'2023-02-05 04:46:25'),
(152,	'risk-management.profile.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(153,	'risk-management.analysis.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(154,	'risk-management.analysis.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(155,	'risk-management.analysis.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(156,	'risk-management.analysis.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(157,	'risk-management.analysis.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(158,	'risk-management.control.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(159,	'risk-management.control.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(160,	'risk-management.control.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(161,	'risk-management.control.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(162,	'risk-management.control.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(163,	'risk-management.monitoring.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(164,	'risk-management.monitoring.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(165,	'risk-management.monitoring.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(166,	'risk-management.monitoring.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(167,	'risk-management.monitoring.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(168,	'master.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(169,	'master.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(170,	'master.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(171,	'master.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(172,	'setting.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(173,	'setting.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(174,	'setting.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(175,	'setting.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(176,	'rapat.undangan.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(177,	'rapat.undangan.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(178,	'rapat.undangan.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(179,	'rapat.undangan.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(180,	'rapat.undangan.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(181,	'rapat.notulen.view',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(182,	'rapat.notulen.create',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(183,	'rapat.notulen.edit',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(184,	'rapat.notulen.delete',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26'),
(185,	'rapat.notulen.approve',	'web',	NULL,	NULL,	'2023-02-05 04:46:26',	'2023-02-05 04:46:26');

DROP TABLE IF EXISTS `sys_permissions_models`;
CREATE TABLE `sys_permissions_models` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `sys_permissions_models_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `sys_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_positions`;
CREATE TABLE `sys_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_positions_location_id_foreign` (`location_id`),
  CONSTRAINT `sys_positions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_positions` (`id`, `location_id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	10,	'Kepala Substansi Pelayanan Medik',	1001,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(2,	12,	'Sub Koordinator Administrasi SDM',	1002,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(3,	14,	'Kepala Sub Substansi Tata Usaha',	1003,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(4,	11,	'Kepala Substansi Umum',	1004,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(5,	15,	'Sub Koordinator Perencanaan SDM',	1005,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(6,	19,	'Kepala Instalasi SIMRS',	1006,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(7,	20,	'Kepala Unit Pengembangan SI',	1007,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(8,	21,	'Kepala Unit Pemeliharaan SI',	1008,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(9,	22,	'Kepala Unit Operasional',	1009,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(10,	11,	'Sub Koordinator Rumah Tangga',	1010,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(11,	9,	'Kepala Substansi SDM',	1011,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(12,	3,	'Direktur Utama',	1012,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22');

DROP TABLE IF EXISTS `sys_quotes`;
CREATE TABLE `sys_quotes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quotes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_aktif` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_quotes` (`id`, `quotes`, `creator`, `is_aktif`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Mulailah dari mana kamu berada. Gunakan apa yang kamu miliki. Lakukan apa yang kamu bisa',	'NN',	1,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(2,	'Dunia ini penuh dengan orang-orang baik. Jika kamu tidak dapat menemukannya, jadilah salah satunya',	'NN',	0,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(3,	'Suatu pekerjaan yang paling tak kunjung bisa diselesaikan adalah pekerjaan yang tak kunjung pernah dimulai.',	'NN',	0,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(4,	'Kebanggaan kita yang terbesar adalah bukan tidak pernah gagal, tetapi bangkit kembali setiap kali kita jatuh',	'NN',	0,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(5,	'Bersyukur dapat menyadarkan kita akan pentingnya arti menikmati kehidupan, seburuk apapun keadaannya',	'NN',	0,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28'),
(6,	'Apa yang Allah berikan untuk kita pasti yang terbaik, meskipun yang terbaik itu bukan yang terindah',	'NN',	0,	1,	1,	'2023-02-05 04:46:28',	'2023-02-05 04:46:28');

DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_roles` (`id`, `name`, `guard_name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Administrator',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(2,	'Dewan Pengawas',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(3,	'Direktur Utama',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(4,	'Direktur',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(5,	'Kepala Substansi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(6,	'Staf Substansi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(7,	'Kepala Sub Substansi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(8,	'Staf Sub Substansi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(9,	'Kepala Instalasi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(10,	'Staf Instalasi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(11,	'Kepala Unit Instalasi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(12,	'Staf Unit Instalasi',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(13,	'Kepala Komite',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(14,	'Staf Komite',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(15,	'Kepala Staf Medik',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22'),
(16,	'Staf Staf Medik',	'web',	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22');

DROP TABLE IF EXISTS `sys_roles_models`;
CREATE TABLE `sys_roles_models` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `sys_roles_models_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_roles_models` (`role_id`, `model_type`, `model_id`) VALUES
(1,	'App\\Models\\Auth\\User',	1),
(3,	'App\\Models\\Auth\\User',	12),
(5,	'App\\Models\\Auth\\User',	2),
(5,	'App\\Models\\Auth\\User',	6),
(7,	'App\\Models\\Auth\\User',	3),
(7,	'App\\Models\\Auth\\User',	4),
(7,	'App\\Models\\Auth\\User',	5),
(7,	'App\\Models\\Auth\\User',	7),
(9,	'App\\Models\\Auth\\User',	9),
(10,	'App\\Models\\Auth\\User',	8),
(11,	'App\\Models\\Auth\\User',	10),
(12,	'App\\Models\\Auth\\User',	11);

DROP TABLE IF EXISTS `sys_roles_permissions`;
CREATE TABLE `sys_roles_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `sys_roles_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `sys_roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `sys_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `sys_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_roles_permissions` (`permission_id`, `role_id`) VALUES
(1,	1),
(51,	1),
(52,	1),
(53,	1),
(54,	1),
(55,	1),
(168,	1),
(169,	1),
(170,	1),
(171,	1),
(172,	1),
(173,	1),
(174,	1),
(175,	1);

DROP TABLE IF EXISTS `sys_staffmedik`;
CREATE TABLE `sys_staffmedik` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_staffmedik_parent_id_foreign` (`parent_id`),
  CONSTRAINT `sys_staffmedik_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_structs`;
CREATE TABLE `sys_structs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'root, bod, division, branch, dll',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'presdir, direktur, ia, it',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facsimile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_structs_parent_id_foreign` (`parent_id`),
  CONSTRAINT `sys_structs_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_structs` (`id`, `parent_id`, `level`, `type`, `name`, `code`, `phone`, `address`, `facsimile`, `email`, `website`, `facebook`, `instagram`, `linkedin`, `twitter`, `created_by`, `updated_by`, `created_at`, `updated_at`, `extension`) VALUES
(1,	NULL,	'root',	NULL,	'Rumah Sakit Jantung dan Pembuluh Darah Harapan Kita (RSJPDHK)',	1001,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	'https://www.facebook.com',	'https://www.instagram.com',	'https://www.linkedin.com',	'https://twitter.com',	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:47:59',	NULL),
(2,	1,	'boc',	NULL,	'Dewan Pengawas',	1101,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:09',	'001'),
(3,	1,	'bod',	'presdir',	'Direktur Utama',	2001,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:19',	'002'),
(4,	3,	'bod',	NULL,	'Direktur Perencanaan Organisasi & Umum',	2002,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:24',	'003'),
(5,	3,	'bod',	NULL,	'Direktur Pelayanan Medik, Keperawatan dan Penunjang',	2003,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:29',	'001'),
(6,	3,	'bod',	NULL,	'Direktur Sumber Daya Manusia, Pendidikan dan Penelitian',	2004,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:39',	'001'),
(7,	3,	'bod',	NULL,	'Direktur Keuangan dan Barang Milik Negara',	2005,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:51',	'005'),
(8,	3,	'bod',	NULL,	'Satuan Pemeriksa Internal',	2006,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:54:57',	'006'),
(9,	6,	'division',	NULL,	'Sumber Daya Manusia',	3001,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:57:39',	NULL),
(10,	5,	'division',	NULL,	'Pelayanan Medik',	3002,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:57:23',	NULL),
(11,	4,	'division',	NULL,	'Substansi Umum',	3003,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:57:54',	NULL),
(12,	4,	'division',	NULL,	'Substansi Perencanaan & Evaluasi',	3004,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:58:12',	NULL),
(13,	7,	'division',	NULL,	'Substansi Anggaran',	3005,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:58:22',	NULL),
(14,	7,	'division',	NULL,	'Substansi Akuntansi dan BMN',	3006,	'(021) 568 1111',	'Jl. Letjen S. Parman Kav 87 Slipi, Jakarta Barat 11420',	'08119080707',	'corsec@pjnhk.go.id',	'https://pjnhk.go.id',	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 04:58:38',	NULL),
(15,	9,	'department',	NULL,	'Administrasi SDM',	4001,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:00:00',	NULL),
(16,	10,	'department',	NULL,	'Pelayanan Medik Rawat Jalan',	4002,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:00:16',	NULL),
(17,	11,	'department',	NULL,	'Tata Usaha',	4003,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:00:29',	NULL),
(18,	9,	'department',	NULL,	'Perencanaan SDM',	4004,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:00:54',	NULL),
(19,	11,	'department',	NULL,	'Rumah Tangga',	4005,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:01:10',	NULL),
(20,	12,	'department',	NULL,	'Sub Substansi Perencanaan Program',	4006,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:01:28',	NULL),
(21,	12,	'department',	NULL,	'Sub Substansi Evaluasi & Pelaporan',	4007,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:01:45',	NULL),
(22,	14,	'department',	NULL,	'Sub Substansi Akuntansi',	4008,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:01:56',	NULL),
(23,	14,	'department',	NULL,	'Sub Substansi Pengelolaan BMN',	4009,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:02:19',	NULL),
(24,	13,	'department',	NULL,	'Sub Substansi Penyusunan dan Evaluasi Anggaran',	4010,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:02:35',	NULL),
(25,	13,	'department',	NULL,	'Sub SUbstansi Perbendaharaan & Pelaksanaan Anggaran',	4011,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:02:50',	NULL),
(26,	5,	'instalasi',	NULL,	'Instalasi Rawat Jalan',	5001,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:03:53',	NULL),
(27,	5,	'instalasi',	NULL,	'Instalasi Bedah',	5002,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:03:59',	NULL),
(28,	5,	'instalasi',	NULL,	'Instalasi SIMRS',	5003,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	'2023-02-05 04:46:22',	'2023-02-05 05:04:06',	NULL),
(29,	3,	'komite',	NULL,	'Komite Etik dan Hukum',	7001,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL),
(30,	28,	'unitinstalasi',	NULL,	'Pengembangan SI',	8001,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL),
(31,	28,	'unitinstalasi',	NULL,	'Pemeliharaan Sistem',	8002,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL),
(32,	28,	'unitinstalasi',	NULL,	'Operasional',	8003,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL),
(33,	3,	'komite',	NULL,	'Komite Mutu',	7002,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL),
(34,	3,	'komite',	NULL,	'Komite Medik',	7003,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL),
(35,	NULL,	'staffmedik',	NULL,	'Staf Medik Kardiologi Klinik',	10001,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:22',	'2023-02-05 04:46:22',	NULL);

DROP TABLE IF EXISTS `sys_unit_instalasi`;
CREATE TABLE `sys_unit_instalasi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_unit_instalasi_parent_id_foreign` (`parent_id`),
  CONSTRAINT `sys_unit_instalasi_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `sys_instalasi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe_struktur` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nopeg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_users_username_unique` (`username`),
  UNIQUE KEY `sys_users_email_unique` (`email`),
  UNIQUE KEY `sys_users_nip_unique` (`nip`),
  UNIQUE KEY `sys_users_nopeg_unique` (`nopeg`),
  KEY `sys_users_position_id_foreign` (`position_id`),
  CONSTRAINT `sys_users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sys_users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `position_id`, `status`, `nik`, `image`, `phone`, `tipe_struktur`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `nip`, `nopeg`) VALUES
(1,	'Administrator',	'admin',	'admin@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	NULL,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(2,	'siska amelia',	'siska',	'siska@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	4,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(3,	'ria siswara',	'ria',	'ria@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	10,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(4,	'retno',	'retno',	'retno@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	3,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(5,	'suwastini',	'suwastini',	'suwastini@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	11,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(6,	'Retno Dwi',	'dwi',	'dwi@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	2,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(7,	'novianti',	'novi',	'novi@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	5,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(8,	'rusman',	'rusman',	'rusman@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	7,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(9,	'budi haryanto',	'budi',	'budi@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	6,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(10,	'agus',	'agus',	'agus@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	8,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(11,	'tanzil',	'tanzil',	'tanzil@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	9,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL),
(12,	'Iwan Dakota',	'iwan',	'iwan@email.com',	NULL,	'$2y$10$VdviwQrhdjTOlEvqGfl9v.M0fybQmP51oLJ44NzVtNdlp7J8Sch3S',	12,	'active',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-02-05 04:46:27',	'2023-02-05 04:46:27',	NULL,	NULL);

DROP TABLE IF EXISTS `temp_files`;
CREATE TABLE `temp_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `threads`;
CREATE TABLE `threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_forum_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `threads_user_id_foreign` (`user_id`),
  CONSTRAINT `threads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_agenda`;
CREATE TABLE `trans_agenda` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `tempat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `done_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `done_date` date DEFAULT NULL,
  `reschedule_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reschedule_date` date DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `penyelenggara` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_agenda_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_agenda_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_agenda_details`;
CREATE TABLE `trans_agenda_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `agenda_id` bigint(20) unsigned NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `acara` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_agenda_details_agenda_id_foreign` (`agenda_id`),
  KEY `trans_agenda_details_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_agenda_details_agenda_id_foreign` FOREIGN KEY (`agenda_id`) REFERENCES `trans_agenda` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_agenda_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_agenda_report`;
CREATE TABLE `trans_agenda_report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_agenda_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_agenda_report_trans_agenda_id_foreign` (`trans_agenda_id`),
  CONSTRAINT `trans_agenda_report_trans_agenda_id_foreign` FOREIGN KEY (`trans_agenda_id`) REFERENCES `trans_agenda` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_analisis_resiko`;
CREATE TABLE `trans_analisis_resiko` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sys_position_id` bigint(20) unsigned NOT NULL,
  `ref_kode_resiko_id` bigint(20) unsigned NOT NULL,
  `ref_tingkat_probabilitas_id` bigint(20) unsigned NOT NULL,
  `ref_tingkat_dampak_id` bigint(20) unsigned NOT NULL,
  `ref_level_resiko_id` bigint(20) unsigned NOT NULL,
  `ref_prioritas_resiko_id` bigint(20) unsigned NOT NULL,
  `pemilik_pegawai_id` bigint(20) unsigned NOT NULL,
  `pjtl_pegawai_id` bigint(20) unsigned NOT NULL,
  `periode_tahun` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pernyataan_resiko` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_pengendalian` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desain_pengendalian` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rencana_pengendalian` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jadwal_pengendalian_from` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jadwal_pengendalian_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_analisis_resiko_sys_position_id_foreign` (`sys_position_id`),
  KEY `trans_analisis_resiko_ref_kode_resiko_id_foreign` (`ref_kode_resiko_id`),
  KEY `trans_analisis_resiko_ref_tingkat_probabilitas_id_foreign` (`ref_tingkat_probabilitas_id`),
  KEY `trans_analisis_resiko_ref_tingkat_dampak_id_foreign` (`ref_tingkat_dampak_id`),
  KEY `trans_analisis_resiko_ref_level_resiko_id_foreign` (`ref_level_resiko_id`),
  KEY `trans_analisis_resiko_ref_prioritas_resiko_id_foreign` (`ref_prioritas_resiko_id`),
  KEY `trans_analisis_resiko_pemilik_pegawai_id_foreign` (`pemilik_pegawai_id`),
  KEY `trans_analisis_resiko_pjtl_pegawai_id_foreign` (`pjtl_pegawai_id`),
  KEY `trans_analisis_resiko_created_by_foreign` (`created_by`),
  KEY `trans_analisis_resiko_updated_by_foreign` (`updated_by`),
  CONSTRAINT `trans_analisis_resiko_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_analisis_resiko_pemilik_pegawai_id_foreign` FOREIGN KEY (`pemilik_pegawai_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_analisis_resiko_pjtl_pegawai_id_foreign` FOREIGN KEY (`pjtl_pegawai_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_analisis_resiko_ref_kode_resiko_id_foreign` FOREIGN KEY (`ref_kode_resiko_id`) REFERENCES `ref_kode_resiko` (`id`),
  CONSTRAINT `trans_analisis_resiko_ref_level_resiko_id_foreign` FOREIGN KEY (`ref_level_resiko_id`) REFERENCES `ref_level_resiko` (`id`),
  CONSTRAINT `trans_analisis_resiko_ref_prioritas_resiko_id_foreign` FOREIGN KEY (`ref_prioritas_resiko_id`) REFERENCES `ref_prioritas_resiko` (`id`),
  CONSTRAINT `trans_analisis_resiko_ref_tingkat_dampak_id_foreign` FOREIGN KEY (`ref_tingkat_dampak_id`) REFERENCES `ref_tingkat_dampak` (`id`),
  CONSTRAINT `trans_analisis_resiko_ref_tingkat_probabilitas_id_foreign` FOREIGN KEY (`ref_tingkat_probabilitas_id`) REFERENCES `ref_tingkat_probabilitas` (`id`),
  CONSTRAINT `trans_analisis_resiko_sys_position_id_foreign` FOREIGN KEY (`sys_position_id`) REFERENCES `sys_positions` (`id`),
  CONSTRAINT `trans_analisis_resiko_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_apm`;
CREATE TABLE `trans_apm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `regarding` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'biasa|rahasia',
  `date` date NOT NULL,
  `background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overview` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approach` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allocation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_apm_summary_id_foreign` (`summary_id`),
  CONSTRAINT `trans_apm_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_apm_cc`;
CREATE TABLE `trans_apm_cc` (
  `apm_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`apm_id`,`user_id`),
  KEY `trans_apm_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_apm_cc_apm_id_foreign` FOREIGN KEY (`apm_id`) REFERENCES `trans_apm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_apm_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_apm_details`;
CREATE TABLE `trans_apm_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apm_id` bigint(20) unsigned NOT NULL,
  `agenda` int(10) unsigned NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_apm_details_apm_id_foreign` (`apm_id`),
  KEY `trans_apm_details_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_apm_details_apm_id_foreign` FOREIGN KEY (`apm_id`) REFERENCES `trans_apm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_apm_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_apm_users`;
CREATE TABLE `trans_apm_users` (
  `apm_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`apm_id`,`user_id`),
  KEY `trans_apm_users_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_apm_users_apm_id_foreign` FOREIGN KEY (`apm_id`) REFERENCES `trans_apm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_apm_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_assignments`;
CREATE TABLE `trans_assignments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `letter_manual` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_id` bigint(20) unsigned NOT NULL,
  `letter_no` int(11) NOT NULL,
  `letter_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `letter_date` date NOT NULL,
  `to_user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Moved to trans_assignments_users',
  `to_position_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Moved to trans_assignments_users',
  `to_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_id` bigint(20) unsigned NOT NULL,
  `leader_id` bigint(20) unsigned NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_assignments_summary_id_foreign` (`summary_id`),
  KEY `trans_assignments_letter_id_foreign` (`letter_id`),
  KEY `trans_assignments_to_user_id_foreign` (`to_user_id`),
  KEY `trans_assignments_to_position_id_foreign` (`to_position_id`),
  KEY `trans_assignments_pic_id_foreign` (`pic_id`),
  KEY `trans_assignments_leader_id_foreign` (`leader_id`),
  CONSTRAINT `trans_assignments_leader_id_foreign` FOREIGN KEY (`leader_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_assignments_letter_id_foreign` FOREIGN KEY (`letter_id`) REFERENCES `ref_letters` (`id`),
  CONSTRAINT `trans_assignments_pic_id_foreign` FOREIGN KEY (`pic_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_assignments_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_assignments_aspects`;
CREATE TABLE `trans_assignments_aspects` (
  `assignment_id` bigint(20) unsigned NOT NULL,
  `aspect_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`assignment_id`,`aspect_id`),
  KEY `trans_assignments_aspects_aspect_id_foreign` (`aspect_id`),
  CONSTRAINT `trans_assignments_aspects_aspect_id_foreign` FOREIGN KEY (`aspect_id`) REFERENCES `ref_aspects` (`id`),
  CONSTRAINT `trans_assignments_aspects_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `trans_assignments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_assignments_cc`;
CREATE TABLE `trans_assignments_cc` (
  `assignment_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`assignment_id`,`user_id`),
  KEY `trans_assignments_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_assignments_cc_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `trans_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_assignments_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_assignments_members`;
CREATE TABLE `trans_assignments_members` (
  `assignment_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`assignment_id`,`user_id`),
  KEY `trans_assignments_members_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_assignments_members_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `trans_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_assignments_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_assignments_users`;
CREATE TABLE `trans_assignments_users` (
  `assignment_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`assignment_id`,`user_id`),
  KEY `trans_assignments_users_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_assignments_users_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `trans_assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_assignments_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_berita`;
CREATE TABLE `trans_berita` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `berita` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `tgl_berita` date NOT NULL,
  `ref_kategori_berita_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `judul_berita` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  PRIMARY KEY (`id`),
  KEY `trans_berita_user_id_foreign` (`user_id`),
  KEY `trans_berita_unit_kerja_id_foreign` (`unit_kerja_id`),
  CONSTRAINT `trans_berita_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`),
  CONSTRAINT `trans_berita_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_closing`;
CREATE TABLE `trans_closing` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_closing_summary_id_foreign` (`summary_id`),
  CONSTRAINT `trans_closing_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_closing_details`;
CREATE TABLE `trans_closing_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `closing_id` bigint(20) unsigned NOT NULL,
  `place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_closing_details_closing_id_foreign` (`closing_id`),
  CONSTRAINT `trans_closing_details_closing_id_foreign` FOREIGN KEY (`closing_id`) REFERENCES `trans_closing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_closing_details_parts`;
CREATE TABLE `trans_closing_details_parts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '1:Internal,2:Eksternal',
  `detail_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_closing_details_parts_detail_id_foreign` (`detail_id`),
  KEY `trans_closing_details_parts_user_id_foreign` (`user_id`),
  KEY `trans_closing_details_parts_position_id_foreign` (`position_id`),
  CONSTRAINT `trans_closing_details_parts_detail_id_foreign` FOREIGN KEY (`detail_id`) REFERENCES `trans_closing_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_closing_details_parts_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `ref_positions` (`id`),
  CONSTRAINT `trans_closing_details_parts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_cruds`;
CREATE TABLE `trans_cruds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `date` date NOT NULL,
  `range_start` date NOT NULL,
  `range_end` date NOT NULL,
  `input` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textarea` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:Option A, 2:Option B',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_cruds_cc`;
CREATE TABLE `trans_cruds_cc` (
  `crud_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`crud_id`,`user_id`),
  KEY `trans_cruds_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_cruds_cc_crud_id_foreign` FOREIGN KEY (`crud_id`) REFERENCES `trans_cruds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_cruds_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_cruds_details`;
CREATE TABLE `trans_cruds_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `crud_id` bigint(20) unsigned NOT NULL,
  `example_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_cruds_details_crud_id_foreign` (`crud_id`),
  KEY `trans_cruds_details_example_id_foreign` (`example_id`),
  KEY `trans_cruds_details_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_cruds_details_crud_id_foreign` FOREIGN KEY (`crud_id`) REFERENCES `trans_cruds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_cruds_details_example_id_foreign` FOREIGN KEY (`example_id`) REFERENCES `ref_examples` (`id`),
  CONSTRAINT `trans_cruds_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_cuti`;
CREATE TABLE `trans_cuti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pemohon` int(11) NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `jenis_cuti` int(11) NOT NULL,
  `alasan_cuti` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_cuti` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plt_cuti` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `masa_kerja` date DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_cuti_cc`;
CREATE TABLE `trans_cuti_cc` (
  `cuti_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`cuti_id`,`user_id`),
  KEY `trans_cuti_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_cuti_cc_cuti_id_foreign` FOREIGN KEY (`cuti_id`) REFERENCES `trans_cuti` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_cuti_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_cuti_pegawai`;
CREATE TABLE `trans_cuti_pegawai` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pegawai_id` bigint(20) unsigned NOT NULL,
  `jenis_cuti` bigint(20) unsigned NOT NULL,
  `year` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sisa_cuti` int(11) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_cuti_pegawai_pegawai_id_foreign` (`pegawai_id`),
  KEY `trans_cuti_pegawai_jenis_cuti_foreign` (`jenis_cuti`),
  CONSTRAINT `trans_cuti_pegawai_jenis_cuti_foreign` FOREIGN KEY (`jenis_cuti`) REFERENCES `ref_jenis_cuti` (`id`),
  CONSTRAINT `trans_cuti_pegawai_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `ref_pegawai` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_detail_gruppimpinanpk`;
CREATE TABLE `trans_detail_gruppimpinanpk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_pkpimpinan_id` bigint(20) unsigned NOT NULL,
  `grup_ik_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_detail_gruppimpinanpk_trans_pkpimpinan_id_foreign` (`trans_pkpimpinan_id`),
  KEY `trans_detail_gruppimpinanpk_grup_ik_id_foreign` (`grup_ik_id`),
  CONSTRAINT `trans_detail_gruppimpinanpk_grup_ik_id_foreign` FOREIGN KEY (`grup_ik_id`) REFERENCES `ref_grup_indikator_kinerja` (`id`),
  CONSTRAINT `trans_detail_gruppimpinanpk_trans_pkpimpinan_id_foreign` FOREIGN KEY (`trans_pkpimpinan_id`) REFERENCES `trans_pk_pimpinan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_detail_kinerjaindividupk`;
CREATE TABLE `trans_detail_kinerjaindividupk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `indikator_kinerja_id` bigint(20) unsigned NOT NULL,
  `trans_pkindividu_id` bigint(20) unsigned NOT NULL,
  `bobot` int(11) NOT NULL DEFAULT 0,
  `target_kinerja` int(11) NOT NULL DEFAULT 0,
  `capaian` int(11) NOT NULL DEFAULT 0,
  `persen_capaian` int(11) NOT NULL DEFAULT 0,
  `nilai` int(11) NOT NULL DEFAULT 0,
  `bobot_x_nilai` double(8,2) NOT NULL DEFAULT 0.00,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_detail_kinerjaindividupk_indikator_kinerja_id_foreign` (`indikator_kinerja_id`),
  KEY `trans_detail_kinerjaindividupk_trans_pkindividu_id_foreign` (`trans_pkindividu_id`),
  CONSTRAINT `trans_detail_kinerjaindividupk_indikator_kinerja_id_foreign` FOREIGN KEY (`indikator_kinerja_id`) REFERENCES `ref_indikator_kinerja` (`id`),
  CONSTRAINT `trans_detail_kinerjaindividupk_trans_pkindividu_id_foreign` FOREIGN KEY (`trans_pkindividu_id`) REFERENCES `trans_pk_individu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_detail_kinerjapimpinanpk`;
CREATE TABLE `trans_detail_kinerjapimpinanpk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `grup_ik_id` bigint(20) unsigned NOT NULL,
  `indikator_kinerja_id` bigint(20) unsigned NOT NULL,
  `bobot` int(11) NOT NULL DEFAULT 0,
  `target_kinerja` int(11) NOT NULL DEFAULT 0,
  `capaian` int(11) NOT NULL DEFAULT 0,
  `persen_capaian` int(11) NOT NULL DEFAULT 0,
  `nilai` int(11) NOT NULL DEFAULT 0,
  `bobot_x_nilai` double(8,2) NOT NULL DEFAULT 0.00,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_detail_kinerjapimpinanpk_grup_ik_id_foreign` (`grup_ik_id`),
  KEY `trans_detail_kinerjapimpinanpk_indikator_kinerja_id_foreign` (`indikator_kinerja_id`),
  CONSTRAINT `trans_detail_kinerjapimpinanpk_grup_ik_id_foreign` FOREIGN KEY (`grup_ik_id`) REFERENCES `trans_detail_gruppimpinanpk` (`id`),
  CONSTRAINT `trans_detail_kinerjapimpinanpk_indikator_kinerja_id_foreign` FOREIGN KEY (`indikator_kinerja_id`) REFERENCES `ref_indikator_kinerja` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_disposisi_langsung`;
CREATE TABLE `trans_disposisi_langsung` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_agenda` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `pengirim_id` bigint(20) unsigned DEFAULT NULL,
  `sifat_id` bigint(20) unsigned DEFAULT NULL,
  `instruksi_id` bigint(20) unsigned DEFAULT NULL,
  `uraian` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_disposisi_langsung_pengirim_id_foreign` (`pengirim_id`),
  KEY `trans_disposisi_langsung_sifat_id_foreign` (`sifat_id`),
  KEY `trans_disposisi_langsung_instruksi_id_foreign` (`instruksi_id`),
  CONSTRAINT `trans_disposisi_langsung_instruksi_id_foreign` FOREIGN KEY (`instruksi_id`) REFERENCES `ref_disposisi` (`id`),
  CONSTRAINT `trans_disposisi_langsung_pengirim_id_foreign` FOREIGN KEY (`pengirim_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_disposisi_langsung_sifat_id_foreign` FOREIGN KEY (`sifat_id`) REFERENCES `ref_sifat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_disposisi_langsung_tembusan`;
CREATE TABLE `trans_disposisi_langsung_tembusan` (
  `user_id` bigint(20) unsigned NOT NULL,
  `disposisi_langsung_id` bigint(20) unsigned NOT NULL,
  KEY `trans_disposisi_langsung_tembusan_user_id_foreign` (`user_id`),
  KEY `trans_disposisi_langsung_tembusan_disposisi_langsung_id_foreign` (`disposisi_langsung_id`),
  CONSTRAINT `trans_disposisi_langsung_tembusan_disposisi_langsung_id_foreign` FOREIGN KEY (`disposisi_langsung_id`) REFERENCES `trans_disposisi_langsung` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_disposisi_langsung_tembusan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_disposisi_langsung_tujuan`;
CREATE TABLE `trans_disposisi_langsung_tujuan` (
  `tujuan_id` bigint(20) unsigned NOT NULL,
  `disposisi_langsung_id` bigint(20) unsigned NOT NULL,
  KEY `trans_disposisi_langsung_tujuan_tujuan_id_foreign` (`tujuan_id`),
  KEY `trans_disposisi_langsung_tujuan_disposisi_langsung_id_foreign` (`disposisi_langsung_id`),
  CONSTRAINT `trans_disposisi_langsung_tujuan_disposisi_langsung_id_foreign` FOREIGN KEY (`disposisi_langsung_id`) REFERENCES `trans_disposisi_langsung` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_disposisi_langsung_tujuan_tujuan_id_foreign` FOREIGN KEY (`tujuan_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_imunit`;
CREATE TABLE `trans_imunit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `year` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trans_imunit_unit_kerja_id_year_unique` (`unit_kerja_id`,`year`),
  CONSTRAINT `trans_imunit_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_imunit_details`;
CREATE TABLE `trans_imunit_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_imunit_id` bigint(20) unsigned NOT NULL,
  `month` int(11) NOT NULL,
  `target` int(11) NOT NULL DEFAULT 0,
  `capaian` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_imunit_details_trans_imunit_id_foreign` (`trans_imunit_id`),
  CONSTRAINT `trans_imunit_details_trans_imunit_id_foreign` FOREIGN KEY (`trans_imunit_id`) REFERENCES `trans_imunit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_kka_feedbacks`;
CREATE TABLE `trans_kka_feedbacks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `sample_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_kka_feedbacks_summary_id_foreign` (`summary_id`),
  KEY `trans_kka_feedbacks_sample_id_foreign` (`sample_id`),
  CONSTRAINT `trans_kka_feedbacks_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `trans_kka_samples` (`id`),
  CONSTRAINT `trans_kka_feedbacks_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_kka_samples`;
CREATE TABLE `trans_kka_samples` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_kka_samples_summary_id_foreign` (`summary_id`),
  CONSTRAINT `trans_kka_samples_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_kka_samples_details`;
CREATE TABLE `trans_kka_samples_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) unsigned NOT NULL,
  `aspect_id` bigint(20) unsigned NOT NULL,
  `apm_detail_id` bigint(20) unsigned DEFAULT NULL,
  `no_contract` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posting_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criteria` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `because` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consequence` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommendation` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finding` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'finding',
  `feedback_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'valid' COMMENT 'valid|invalid',
  `feedback_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback_by` bigint(20) unsigned DEFAULT NULL,
  `feedback_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'valid' COMMENT 'valid|invalid',
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low' COMMENT 'low|medium|high',
  `review_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_by` bigint(20) unsigned DEFAULT NULL,
  `review_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_kka_samples_details_sample_id_foreign` (`sample_id`),
  KEY `trans_kka_samples_details_aspect_id_foreign` (`aspect_id`),
  KEY `trans_kka_samples_details_feedback_by_foreign` (`feedback_by`),
  KEY `trans_kka_samples_details_review_by_foreign` (`review_by`),
  KEY `trans_kka_samples_details_apm_detail_id_foreign` (`apm_detail_id`),
  CONSTRAINT `trans_kka_samples_details_apm_detail_id_foreign` FOREIGN KEY (`apm_detail_id`) REFERENCES `trans_apm_details` (`id`),
  CONSTRAINT `trans_kka_samples_details_aspect_id_foreign` FOREIGN KEY (`aspect_id`) REFERENCES `ref_aspects` (`id`),
  CONSTRAINT `trans_kka_samples_details_feedback_by_foreign` FOREIGN KEY (`feedback_by`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_kka_samples_details_review_by_foreign` FOREIGN KEY (`review_by`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_kka_samples_details_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `trans_kka_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_kka_worksheets`;
CREATE TABLE `trans_kka_worksheets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `sample_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_kka_worksheets_summary_id_foreign` (`summary_id`),
  KEY `trans_kka_worksheets_sample_id_foreign` (`sample_id`),
  CONSTRAINT `trans_kka_worksheets_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `trans_kka_samples` (`id`),
  CONSTRAINT `trans_kka_worksheets_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_kka_worksheets_cc`;
CREATE TABLE `trans_kka_worksheets_cc` (
  `worksheet_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`worksheet_id`,`user_id`),
  KEY `trans_kka_worksheets_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_kka_worksheets_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_kka_worksheets_cc_worksheet_id_foreign` FOREIGN KEY (`worksheet_id`) REFERENCES `trans_kka_worksheets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha`;
CREATE TABLE `trans_lha` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_summary_id_foreign` (`summary_id`),
  CONSTRAINT `trans_lha_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_cover`;
CREATE TABLE `trans_lha_cover` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lha_id` bigint(20) unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_cover_lha_id_foreign` (`lha_id`),
  CONSTRAINT `trans_lha_cover_lha_id_foreign` FOREIGN KEY (`lha_id`) REFERENCES `trans_lha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_inspection`;
CREATE TABLE `trans_lha_inspection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lha_id` bigint(20) unsigned NOT NULL,
  `background` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `times` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `goals` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `standard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_inspection_lha_id_foreign` (`lha_id`),
  CONSTRAINT `trans_lha_inspection_lha_id_foreign` FOREIGN KEY (`lha_id`) REFERENCES `trans_lha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_memo`;
CREATE TABLE `trans_lha_memo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lha_id` bigint(20) unsigned NOT NULL,
  `letter_id` bigint(20) unsigned NOT NULL,
  `letter_no` int(11) NOT NULL,
  `letter_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `letter_date` date NOT NULL,
  `letter_manual` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regarding` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discussion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `followup` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_memo_lha_id_foreign` (`lha_id`),
  KEY `trans_lha_memo_letter_id_foreign` (`letter_id`),
  CONSTRAINT `trans_lha_memo_letter_id_foreign` FOREIGN KEY (`letter_id`) REFERENCES `ref_letters` (`id`),
  CONSTRAINT `trans_lha_memo_lha_id_foreign` FOREIGN KEY (`lha_id`) REFERENCES `trans_lha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_memo_cc`;
CREATE TABLE `trans_lha_memo_cc` (
  `lha_memo_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `position_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`lha_memo_id`,`user_id`),
  KEY `trans_lha_memo_cc_user_id_foreign` (`user_id`),
  KEY `trans_lha_memo_cc_position_id_foreign` (`position_id`),
  CONSTRAINT `trans_lha_memo_cc_lha_memo_id_foreign` FOREIGN KEY (`lha_memo_id`) REFERENCES `trans_lha_memo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_lha_memo_cc_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `ref_positions` (`id`),
  CONSTRAINT `trans_lha_memo_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_memo_to`;
CREATE TABLE `trans_lha_memo_to` (
  `lha_memo_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `position_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`lha_memo_id`,`user_id`),
  KEY `trans_lha_memo_to_user_id_foreign` (`user_id`),
  KEY `trans_lha_memo_to_position_id_foreign` (`position_id`),
  CONSTRAINT `trans_lha_memo_to_lha_memo_id_foreign` FOREIGN KEY (`lha_memo_id`) REFERENCES `trans_lha_memo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_lha_memo_to_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `ref_positions` (`id`),
  CONSTRAINT `trans_lha_memo_to_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_result`;
CREATE TABLE `trans_lha_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lha_id` bigint(20) unsigned NOT NULL,
  `profile` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performance` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `case` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `weakness` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_result_lha_id_foreign` (`lha_id`),
  CONSTRAINT `trans_lha_result_lha_id_foreign` FOREIGN KEY (`lha_id`) REFERENCES `trans_lha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_resume`;
CREATE TABLE `trans_lha_resume` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lha_id` bigint(20) unsigned NOT NULL,
  `profile` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performance` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attention` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_resume_lha_id_foreign` (`lha_id`),
  CONSTRAINT `trans_lha_resume_lha_id_foreign` FOREIGN KEY (`lha_id`) REFERENCES `trans_lha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_lha_toc`;
CREATE TABLE `trans_lha_toc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lha_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'root,bab,subbab',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_lha_toc_lha_id_foreign` (`lha_id`),
  CONSTRAINT `trans_lha_toc_lha_id_foreign` FOREIGN KEY (`lha_id`) REFERENCES `trans_lha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_manrisk_analisis`;
CREATE TABLE `trans_manrisk_analisis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifikasi_id` bigint(20) unsigned NOT NULL,
  `identifikasi_details_id` bigint(20) unsigned NOT NULL,
  `uraian_pengendalian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desain_pengendalian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `efektifitas_pengendalian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `probabilitas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tingkat_dampak_id` bigint(20) unsigned NOT NULL,
  `level_resiko_id` bigint(20) unsigned NOT NULL,
  `prioritas_resiko_id` bigint(20) unsigned NOT NULL,
  `jadwal_rencana_pengendalian` date NOT NULL,
  `uraian_rencana_pengendalian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemilik_resiko_id` bigint(20) unsigned NOT NULL,
  `pic_tindak_lanjut_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_manrisk_analisis_identifikasi_id_foreign` (`identifikasi_id`),
  KEY `trans_manrisk_analisis_identifikasi_details_id_foreign` (`identifikasi_details_id`),
  KEY `trans_manrisk_analisis_tingkat_dampak_id_foreign` (`tingkat_dampak_id`),
  KEY `trans_manrisk_analisis_level_resiko_id_foreign` (`level_resiko_id`),
  KEY `trans_manrisk_analisis_prioritas_resiko_id_foreign` (`prioritas_resiko_id`),
  KEY `trans_manrisk_analisis_pemilik_resiko_id_foreign` (`pemilik_resiko_id`),
  KEY `trans_manrisk_analisis_pic_tindak_lanjut_id_foreign` (`pic_tindak_lanjut_id`),
  CONSTRAINT `trans_manrisk_analisis_identifikasi_details_id_foreign` FOREIGN KEY (`identifikasi_details_id`) REFERENCES `trans_manrisk_identifikasi_details` (`id`),
  CONSTRAINT `trans_manrisk_analisis_identifikasi_id_foreign` FOREIGN KEY (`identifikasi_id`) REFERENCES `trans_manrisk_identifikasi` (`id`),
  CONSTRAINT `trans_manrisk_analisis_level_resiko_id_foreign` FOREIGN KEY (`level_resiko_id`) REFERENCES `ref_level_resiko` (`id`),
  CONSTRAINT `trans_manrisk_analisis_pemilik_resiko_id_foreign` FOREIGN KEY (`pemilik_resiko_id`) REFERENCES `sys_structs` (`id`),
  CONSTRAINT `trans_manrisk_analisis_pic_tindak_lanjut_id_foreign` FOREIGN KEY (`pic_tindak_lanjut_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_manrisk_analisis_prioritas_resiko_id_foreign` FOREIGN KEY (`prioritas_resiko_id`) REFERENCES `ref_prioritas_resiko` (`id`),
  CONSTRAINT `trans_manrisk_analisis_tingkat_dampak_id_foreign` FOREIGN KEY (`tingkat_dampak_id`) REFERENCES `ref_tingkat_dampak` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_manrisk_identifikasi`;
CREATE TABLE `trans_manrisk_identifikasi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `periode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `struktur_id` bigint(20) unsigned NOT NULL,
  `kode_resiko_id` bigint(20) unsigned NOT NULL,
  `pernyataan_resiko` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penyebab_utama` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ucc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dampak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_manrisk_identifikasi_struktur_id_foreign` (`struktur_id`),
  KEY `trans_manrisk_identifikasi_kode_resiko_id_foreign` (`kode_resiko_id`),
  CONSTRAINT `trans_manrisk_identifikasi_kode_resiko_id_foreign` FOREIGN KEY (`kode_resiko_id`) REFERENCES `ref_kode_resiko` (`id`),
  CONSTRAINT `trans_manrisk_identifikasi_struktur_id_foreign` FOREIGN KEY (`struktur_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_manrisk_identifikasi_details`;
CREATE TABLE `trans_manrisk_identifikasi_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identifikasi_id` bigint(20) unsigned NOT NULL,
  `kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tujuan_kegiatan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pernyataan_resiko` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penyebab_utama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dampak` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_manrisk_identifikasi_details_identifikasi_id_foreign` (`identifikasi_id`),
  CONSTRAINT `trans_manrisk_identifikasi_details_identifikasi_id_foreign` FOREIGN KEY (`identifikasi_id`) REFERENCES `trans_manrisk_identifikasi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_meetings`;
CREATE TABLE `trans_meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leader_id` bigint(20) unsigned NOT NULL,
  `recorder_id` bigint(20) unsigned NOT NULL,
  `letter_id` bigint(20) unsigned NOT NULL,
  `letter_no` int(11) NOT NULL,
  `letter_date` date NOT NULL,
  `letter_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `letter_manual` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regarding` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meet_date` date NOT NULL,
  `meet_start` time NOT NULL,
  `meet_end` time NOT NULL,
  `meet_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'offline' COMMENT 'offline/online',
  `meet_place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meet_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meet_agenda` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_sentence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_sentence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.review|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_meetings_leader_id_foreign` (`leader_id`),
  KEY `trans_meetings_recorder_id_foreign` (`recorder_id`),
  KEY `trans_meetings_letter_id_foreign` (`letter_id`),
  CONSTRAINT `trans_meetings_leader_id_foreign` FOREIGN KEY (`leader_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_meetings_letter_id_foreign` FOREIGN KEY (`letter_id`) REFERENCES `ref_letters` (`id`),
  CONSTRAINT `trans_meetings_recorder_id_foreign` FOREIGN KEY (`recorder_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_meetings_cc`;
CREATE TABLE `trans_meetings_cc` (
  `meeting_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`meeting_id`,`user_id`),
  KEY `trans_meetings_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_meetings_cc_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `trans_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_meetings_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_meetings_parts`;
CREATE TABLE `trans_meetings_parts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1:Internal,2:Eksternal',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_meetings_parts_meeting_id_foreign` (`meeting_id`),
  KEY `trans_meetings_parts_user_id_foreign` (`user_id`),
  KEY `trans_meetings_parts_position_id_foreign` (`position_id`),
  CONSTRAINT `trans_meetings_parts_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `trans_meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_meetings_parts_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`),
  CONSTRAINT `trans_meetings_parts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_meetings_recap`;
CREATE TABLE `trans_meetings_recap` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned NOT NULL,
  `mom` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.review|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_meetings_recap_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `trans_meetings_recap_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `trans_meetings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_meetings_recap_cc`;
CREATE TABLE `trans_meetings_recap_cc` (
  `recap_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`recap_id`,`user_id`),
  KEY `trans_meetings_recap_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_meetings_recap_cc_recap_id_foreign` FOREIGN KEY (`recap_id`) REFERENCES `trans_meetings_recap` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_meetings_recap_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_nota_dinas`;
CREATE TABLE `trans_nota_dinas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `hal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembuka` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konten` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `penutup` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `signed_by` int(10) unsigned DEFAULT NULL,
  `signed_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `sifat_surat` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_nota_dinas_sifat_surat_foreign` (`sifat_surat`),
  CONSTRAINT `trans_nota_dinas_sifat_surat_foreign` FOREIGN KEY (`sifat_surat`) REFERENCES `ref_sifat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_nota_dinas_cc`;
CREATE TABLE `trans_nota_dinas_cc` (
  `user_id` bigint(20) unsigned NOT NULL,
  `nota_dinas_id` bigint(20) unsigned NOT NULL,
  KEY `trans_nota_dinas_cc_user_id_foreign` (`user_id`),
  KEY `trans_nota_dinas_cc_nota_dinas_id_foreign` (`nota_dinas_id`),
  CONSTRAINT `trans_nota_dinas_cc_nota_dinas_id_foreign` FOREIGN KEY (`nota_dinas_id`) REFERENCES `trans_nota_dinas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_nota_dinas_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_nota_dinas_penerima`;
CREATE TABLE `trans_nota_dinas_penerima` (
  `user_id` bigint(20) unsigned NOT NULL,
  `nota_dinas_id` bigint(20) unsigned NOT NULL,
  KEY `trans_nota_dinas_penerima_user_id_foreign` (`user_id`),
  KEY `trans_nota_dinas_penerima_nota_dinas_id_foreign` (`nota_dinas_id`),
  CONSTRAINT `trans_nota_dinas_penerima_nota_dinas_id_foreign` FOREIGN KEY (`nota_dinas_id`) REFERENCES `trans_nota_dinas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_nota_dinas_penerima_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_nota_dinas_pengirim`;
CREATE TABLE `trans_nota_dinas_pengirim` (
  `user_id` bigint(20) unsigned NOT NULL,
  `nota_dinas_id` bigint(20) unsigned NOT NULL,
  KEY `trans_nota_dinas_pengirim_user_id_foreign` (`user_id`),
  KEY `trans_nota_dinas_pengirim_nota_dinas_id_foreign` (`nota_dinas_id`),
  CONSTRAINT `trans_nota_dinas_pengirim_nota_dinas_id_foreign` FOREIGN KEY (`nota_dinas_id`) REFERENCES `trans_nota_dinas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_nota_dinas_pengirim_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_notulen_cc`;
CREATE TABLE `trans_notulen_cc` (
  `notulen_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`notulen_id`,`user_id`),
  KEY `trans_notulen_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_notulen_cc_notulen_id_foreign` FOREIGN KEY (`notulen_id`) REFERENCES `trans_notulen_rapat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_notulen_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_notulen_parts`;
CREATE TABLE `trans_notulen_parts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '1:Internal,2:Eksternal',
  `notulen_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_notulen_parts_notulen_id_foreign` (`notulen_id`),
  KEY `trans_notulen_parts_user_id_foreign` (`user_id`),
  KEY `trans_notulen_parts_position_id_foreign` (`position_id`),
  CONSTRAINT `trans_notulen_parts_notulen_id_foreign` FOREIGN KEY (`notulen_id`) REFERENCES `trans_notulen_rapat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_notulen_parts_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`),
  CONSTRAINT `trans_notulen_parts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_notulen_rapat`;
CREATE TABLE `trans_notulen_rapat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_undangan_id` bigint(20) unsigned DEFAULT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_pengumuman`;
CREATE TABLE `trans_pengumuman` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pengumuman` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `tgl_pengumuman` date NOT NULL,
  `ref_kategori_pengumuman_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `judul_pengumuman` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  PRIMARY KEY (`id`),
  KEY `trans_pengumuman_user_id_foreign` (`user_id`),
  KEY `trans_pengumuman_unit_kerja_id_foreign` (`unit_kerja_id`),
  CONSTRAINT `trans_pengumuman_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`),
  CONSTRAINT `trans_pengumuman_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_penilaian`;
CREATE TABLE `trans_penilaian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `tahun` int(11) NOT NULL,
  `bulan` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_penilaian_unit_kerja_id_foreign` (`unit_kerja_id`),
  CONSTRAINT `trans_penilaian_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_penilaian_details`;
CREATE TABLE `trans_penilaian_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `penilaian_id` bigint(20) unsigned NOT NULL,
  `bulan` int(11) NOT NULL,
  `nilai_kinerja` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_penilaian_details_penilaian_id_foreign` (`penilaian_id`),
  CONSTRAINT `trans_penilaian_details_penilaian_id_foreign` FOREIGN KEY (`penilaian_id`) REFERENCES `trans_penilaian` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_pk_individu`;
CREATE TABLE `trans_pk_individu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `pegawai_id` bigint(20) unsigned NOT NULL,
  `pimpinan1_id` bigint(20) unsigned DEFAULT NULL,
  `pimpinan2_id` bigint(20) unsigned DEFAULT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `jumlah_nilai` double NOT NULL DEFAULT 0,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_pk_individu_unit_kerja_id_foreign` (`unit_kerja_id`),
  KEY `trans_pk_individu_pegawai_id_foreign` (`pegawai_id`),
  KEY `trans_pk_individu_pimpinan1_id_foreign` (`pimpinan1_id`),
  KEY `trans_pk_individu_pimpinan2_id_foreign` (`pimpinan2_id`),
  CONSTRAINT `trans_pk_individu_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_pk_individu_pimpinan1_id_foreign` FOREIGN KEY (`pimpinan1_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_pk_individu_pimpinan2_id_foreign` FOREIGN KEY (`pimpinan2_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_pk_individu_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_pk_pimpinan`;
CREATE TABLE `trans_pk_pimpinan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_kerja_id` bigint(20) unsigned NOT NULL,
  `pegawai_id` bigint(20) unsigned NOT NULL,
  `pimpinan1_id` bigint(20) unsigned DEFAULT NULL,
  `pimpinan2_id` bigint(20) unsigned DEFAULT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `jumlah_nilai` int(11) NOT NULL DEFAULT 0,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_pk_pimpinan_unit_kerja_id_foreign` (`unit_kerja_id`),
  KEY `trans_pk_pimpinan_pegawai_id_foreign` (`pegawai_id`),
  KEY `trans_pk_pimpinan_pimpinan1_id_foreign` (`pimpinan1_id`),
  KEY `trans_pk_pimpinan_pimpinan2_id_foreign` (`pimpinan2_id`),
  CONSTRAINT `trans_pk_pimpinan_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_pk_pimpinan_pimpinan1_id_foreign` FOREIGN KEY (`pimpinan1_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_pk_pimpinan_pimpinan2_id_foreign` FOREIGN KEY (`pimpinan2_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_pk_pimpinan_unit_kerja_id_foreign` FOREIGN KEY (`unit_kerja_id`) REFERENCES `sys_structs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_ptkinerjaindividupk`;
CREATE TABLE `trans_ptkinerjaindividupk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_pkindividu_id` bigint(20) unsigned NOT NULL,
  `bobot` int(11) NOT NULL DEFAULT 0,
  `target_kinerja` int(11) NOT NULL DEFAULT 0,
  `capaian` int(11) NOT NULL DEFAULT 0,
  `persen_capaian` int(11) NOT NULL DEFAULT 0,
  `nilai` int(11) NOT NULL DEFAULT 0,
  `bobot_x_nilai` double(8,2) NOT NULL DEFAULT 0.00,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_ptkinerjaindividupk_trans_pkindividu_id_foreign` (`trans_pkindividu_id`),
  CONSTRAINT `trans_ptkinerjaindividupk_trans_pkindividu_id_foreign` FOREIGN KEY (`trans_pkindividu_id`) REFERENCES `trans_pk_individu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_ptkinerjapimpinanpk`;
CREATE TABLE `trans_ptkinerjapimpinanpk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `trans_pkpimpinan_id` bigint(20) unsigned NOT NULL,
  `bobot` int(11) NOT NULL DEFAULT 0,
  `target_kinerja` int(11) NOT NULL DEFAULT 0,
  `capaian` int(11) NOT NULL DEFAULT 0,
  `persen_capaian` int(11) NOT NULL DEFAULT 0,
  `nilai` int(11) NOT NULL DEFAULT 0,
  `bobot_x_nilai` double(8,2) NOT NULL DEFAULT 0.00,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_ptkinerjapimpinanpk_trans_pkpimpinan_id_foreign` (`trans_pkpimpinan_id`),
  CONSTRAINT `trans_ptkinerjapimpinanpk_trans_pkpimpinan_id_foreign` FOREIGN KEY (`trans_pkpimpinan_id`) REFERENCES `trans_pk_pimpinan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_rkia`;
CREATE TABLE `trans_rkia` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `version` smallint(6) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed|upgraded',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_rkia_cc`;
CREATE TABLE `trans_rkia_cc` (
  `rkia_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`rkia_id`,`user_id`),
  KEY `trans_rkia_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_rkia_cc_rkia_id_foreign` FOREIGN KEY (`rkia_id`) REFERENCES `trans_rkia` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_rkia_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_rkia_summary`;
CREATE TABLE `trans_rkia_summary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rkia_id` bigint(20) unsigned NOT NULL,
  `object_id` bigint(20) unsigned DEFAULT NULL,
  `ict_object_id` bigint(20) unsigned DEFAULT NULL,
  `ext_object_id` bigint(20) unsigned DEFAULT NULL,
  `pic_id` bigint(20) unsigned NOT NULL,
  `leader_id` bigint(20) unsigned NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_rkia_summary_rkia_id_foreign` (`rkia_id`),
  KEY `trans_rkia_summary_object_id_foreign` (`object_id`),
  KEY `trans_rkia_summary_ict_object_id_foreign` (`ict_object_id`),
  KEY `trans_rkia_summary_ext_object_id_foreign` (`ext_object_id`),
  KEY `trans_rkia_summary_pic_id_foreign` (`pic_id`),
  KEY `trans_rkia_summary_leader_id_foreign` (`leader_id`),
  CONSTRAINT `trans_rkia_summary_ext_object_id_foreign` FOREIGN KEY (`ext_object_id`) REFERENCES `ref_ext_objects` (`id`),
  CONSTRAINT `trans_rkia_summary_ict_object_id_foreign` FOREIGN KEY (`ict_object_id`) REFERENCES `ref_ict_objects` (`id`),
  CONSTRAINT `trans_rkia_summary_leader_id_foreign` FOREIGN KEY (`leader_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_rkia_summary_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `ref_org_structs` (`id`),
  CONSTRAINT `trans_rkia_summary_pic_id_foreign` FOREIGN KEY (`pic_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_rkia_summary_rkia_id_foreign` FOREIGN KEY (`rkia_id`) REFERENCES `trans_rkia` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_rkia_summary_members`;
CREATE TABLE `trans_rkia_summary_members` (
  `summary_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`summary_id`,`user_id`),
  KEY `trans_rkia_summary_members_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_rkia_summary_members_summary_id_foreign` FOREIGN KEY (`summary_id`) REFERENCES `trans_rkia_summary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_rkia_summary_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_keluar`;
CREATE TABLE `trans_surat_keluar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `no_surat` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_surat` date NOT NULL,
  `perihal` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kepada` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(4096) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembuat_id` bigint(20) unsigned NOT NULL,
  `penandatangan_id` bigint(20) unsigned NOT NULL,
  `pengoreksi_id` bigint(20) unsigned NOT NULL,
  `pemeriksa_id` bigint(20) unsigned NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan_lampiran` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_surat_keluar_pembuat_id_foreign` (`pembuat_id`),
  KEY `trans_surat_keluar_penandatangan_id_foreign` (`penandatangan_id`),
  KEY `trans_surat_keluar_pengoreksi_id_foreign` (`pengoreksi_id`),
  KEY `trans_surat_keluar_pemeriksa_id_foreign` (`pemeriksa_id`),
  CONSTRAINT `trans_surat_keluar_pembuat_id_foreign` FOREIGN KEY (`pembuat_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_surat_keluar_pemeriksa_id_foreign` FOREIGN KEY (`pemeriksa_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_surat_keluar_penandatangan_id_foreign` FOREIGN KEY (`penandatangan_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_surat_keluar_pengoreksi_id_foreign` FOREIGN KEY (`pengoreksi_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_keluar_cc`;
CREATE TABLE `trans_surat_keluar_cc` (
  `crud_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`crud_id`,`user_id`),
  KEY `trans_surat_keluar_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_surat_keluar_cc_crud_id_foreign` FOREIGN KEY (`crud_id`) REFERENCES `trans_surat_keluar` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_surat_keluar_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_keterangan`;
CREATE TABLE `trans_surat_keterangan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_permintaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `pemohon` bigint(20) unsigned NOT NULL,
  `jenis_surat_keterangan` bigint(20) unsigned NOT NULL,
  `keperluan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_surat_keterangan_pemohon_foreign` (`pemohon`),
  KEY `trans_surat_keterangan_jenis_surat_keterangan_foreign` (`jenis_surat_keterangan`),
  CONSTRAINT `trans_surat_keterangan_jenis_surat_keterangan_foreign` FOREIGN KEY (`jenis_surat_keterangan`) REFERENCES `ref_jenis_surat_keterangan` (`id`),
  CONSTRAINT `trans_surat_keterangan_pemohon_foreign` FOREIGN KEY (`pemohon`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_keterangan_cc`;
CREATE TABLE `trans_surat_keterangan_cc` (
  `surat_keterangan_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_keterangan__penerbitan`;
CREATE TABLE `trans_surat_keterangan__penerbitan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `surat_keterangan` bigint(20) unsigned NOT NULL,
  `no_surat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_surat_keterangan` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|warning.approval|rejected|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_surat_keterangan__penerbitan_surat_keterangan_foreign` (`surat_keterangan`),
  KEY `trans_surat_keterangan__penerbitan_no_surat_index` (`no_surat`),
  CONSTRAINT `trans_surat_keterangan__penerbitan_surat_keterangan_foreign` FOREIGN KEY (`surat_keterangan`) REFERENCES `trans_surat_keterangan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_masuk`;
CREATE TABLE `trans_surat_masuk` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `no_agenda` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_agenda` date NOT NULL,
  `no_surat` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_surat` date NOT NULL,
  `penerima_id` bigint(20) unsigned NOT NULL,
  `pengirim` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_pengirim` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perihal` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ringkasan` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifat_id` bigint(20) unsigned NOT NULL,
  `klasifikasi_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `jenis_id` bigint(20) unsigned NOT NULL,
  `keterangan_lampiran` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_surat_masuk_penerima_id_foreign` (`penerima_id`),
  KEY `trans_surat_masuk_sifat_id_foreign` (`sifat_id`),
  KEY `trans_surat_masuk_klasifikasi_id_foreign` (`klasifikasi_id`),
  KEY `trans_surat_masuk_status_id_foreign` (`status_id`),
  KEY `trans_surat_masuk_jenis_id_foreign` (`jenis_id`),
  CONSTRAINT `trans_surat_masuk_jenis_id_foreign` FOREIGN KEY (`jenis_id`) REFERENCES `ref_jenis` (`id`),
  CONSTRAINT `trans_surat_masuk_klasifikasi_id_foreign` FOREIGN KEY (`klasifikasi_id`) REFERENCES `ref_klasifikasi` (`id`),
  CONSTRAINT `trans_surat_masuk_penerima_id_foreign` FOREIGN KEY (`penerima_id`) REFERENCES `sys_users` (`id`),
  CONSTRAINT `trans_surat_masuk_sifat_id_foreign` FOREIGN KEY (`sifat_id`) REFERENCES `ref_sifat` (`id`),
  CONSTRAINT `trans_surat_masuk_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surat_masuk_cc`;
CREATE TABLE `trans_surat_masuk_cc` (
  `crud_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`crud_id`,`user_id`),
  KEY `trans_surat_masuk_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_surat_masuk_cc_crud_id_foreign` FOREIGN KEY (`crud_id`) REFERENCES `trans_surat_masuk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_surat_masuk_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surveys_regs`;
CREATE TABLE `trans_surveys_regs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `summary_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|shared|completed',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surveys_regs_users`;
CREATE TABLE `trans_surveys_regs_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_reg_id` bigint(20) unsigned NOT NULL,
  `master_survey_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `timer` time DEFAULT NULL,
  `suggestion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new' COMMENT 'new|draft|done',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_surveys_regs_users_details`;
CREATE TABLE `trans_surveys_regs_users_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_reg_user_id` bigint(20) unsigned NOT NULL,
  `survey_statement_id` bigint(20) unsigned NOT NULL,
  `answer` int(11) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_tindak_lanjut`;
CREATE TABLE `trans_tindak_lanjut` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nota_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status_tindak_lanjut` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_tindak_lanjut_nota_id_foreign` (`nota_id`),
  CONSTRAINT `trans_tindak_lanjut_nota_id_foreign` FOREIGN KEY (`nota_id`) REFERENCES `trans_nota_dinas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_undangan`;
CREATE TABLE `trans_undangan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_undangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_undangan` date NOT NULL,
  `tgl_rapat` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `peserta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `hal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sifat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kalimat_pembuka` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kalimat_penutup` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judul_rapat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_undangan_cc`;
CREATE TABLE `trans_undangan_cc` (
  `undangan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`undangan_id`,`user_id`),
  KEY `trans_undangan_cc_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_undangan_cc_undangan_id_foreign` FOREIGN KEY (`undangan_id`) REFERENCES `trans_undangan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_undangan_cc_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_undangan_details`;
CREATE TABLE `trans_undangan_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `undangan_id` bigint(20) unsigned NOT NULL,
  `agenda` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` time DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_undangan_details_undangan_id_foreign` (`undangan_id`),
  CONSTRAINT `trans_undangan_details_undangan_id_foreign` FOREIGN KEY (`undangan_id`) REFERENCES `trans_undangan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_undangan_notulen`;
CREATE TABLE `trans_undangan_notulen` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `undangan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_undangan_notulen_undangan_id_foreign` (`undangan_id`),
  KEY `trans_undangan_notulen_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_undangan_notulen_undangan_id_foreign` FOREIGN KEY (`undangan_id`) REFERENCES `trans_undangan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_undangan_notulen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_undangan_parts`;
CREATE TABLE `trans_undangan_parts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '1:Internal,2:Eksternal',
  `undangan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_undangan_parts_undangan_id_foreign` (`undangan_id`),
  KEY `trans_undangan_parts_user_id_foreign` (`user_id`),
  KEY `trans_undangan_parts_position_id_foreign` (`position_id`),
  CONSTRAINT `trans_undangan_parts_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `sys_positions` (`id`),
  CONSTRAINT `trans_undangan_parts_undangan_id_foreign` FOREIGN KEY (`undangan_id`) REFERENCES `trans_undangan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_undangan_parts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `trans_undangan_pemimpin`;
CREATE TABLE `trans_undangan_pemimpin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `undangan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_undangan_pemimpin_undangan_id_foreign` (`undangan_id`),
  KEY `trans_undangan_pemimpin_user_id_foreign` (`user_id`),
  CONSTRAINT `trans_undangan_pemimpin_undangan_id_foreign` FOREIGN KEY (`undangan_id`) REFERENCES `trans_undangan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trans_undangan_pemimpin_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `sys_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2023-02-05 05:05:41
