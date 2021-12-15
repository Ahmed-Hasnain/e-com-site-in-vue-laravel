-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2021 at 07:54 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vue-laravel-shop-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_12_081224_create_products_table', 1),
(6, '2021_12_12_081628_create_carts_table', 1),
(7, '2021_12_15_122521_create_processings_table', 2);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `processings`
--

CREATE TABLE `processings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processings`
--

INSERT INTO `processings` (`id`, `client_name`, `client_id`, `client_address`, `order_details`, `amount`, `currency`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Hasnain', 1, '{\"line1\":\"f-594\",\"postal_code\":\"44000\",\"city\":\"Islamabad\",\"state\":\"Punjab\",\"country\":\"Pakistan\"}', '{\"1\":{\"order_id\":1,\"qty\":1},\"2\":{\"order_id\":2,\"qty\":2},\"3\":{\"order_id\":3,\"qty\":1}}', '1639', 'usd', '2021-12-15 08:20:26', '2021-12-15 08:20:26'),
(2, 'Ahmed Hasnain', 2, '{\"line1\":\"f-594, satellite town\",\"postal_code\":\"44000\",\"city\":\"Islamabad\",\"state\":\"Punjab\",\"country\":\"Pakistan\"}', '{\"1\":{\"order_id\":1,\"qty\":1},\"2\":{\"order_id\":2,\"qty\":1},\"3\":{\"order_id\":3,\"qty\":1},\"4\":{\"order_id\":4,\"qty\":1}}', '1980', 'usd', '2021-12-15 08:23:32', '2021-12-15 08:23:32'),
(3, 'Rao Waqar', 2, '{\"line1\":\"f-594\",\"postal_code\":\"44000\",\"city\":\"Islamabad\",\"state\":\"Punjab\",\"country\":\"Pakistan\"}', '{\"1\":{\"order_id\":1,\"qty\":1},\"2\":{\"order_id\":2,\"qty\":1},\"3\":{\"order_id\":3,\"qty\":1}}', '1135', 'usd', '2021-12-15 13:17:42', '2021-12-15 13:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `image_name`, `price`, `sale_price`, `created_at`, `updated_at`) VALUES
(1, 'Quia et qui voluptas.', 'quia-et-qui-voluptas', 'Quia quia magni perferendis consectetur. Qui blanditiis mollitia occaecati necessitatibus. Eos voluptatem quibusdam minus sit aperiam rerum quis. Explicabo minus unde nulla non repellendus sequi consequuntur vero.', 'https://via.placeholder.com/640x480.png/00ffaa?text=sed', '183', '133', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(2, 'In ipsum et quo.', 'in-ipsum-et-quo', 'In similique quis molestiae vel itaque nihil. Reiciendis quos libero repudiandae aut. Ipsa qui commodi vero ut et soluta. Omnis sunt quibusdam maiores ex qui. Totam nihil expedita enim repellendus. Odio aliquam ut ut.', 'https://via.placeholder.com/640x480.png/00ff77?text=natus', '554', '504', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(3, 'Eveniet ut odit enim.', 'eveniet-ut-odit-enim', 'Modi odio aut cum ratione doloremque. Quam expedita modi vero earum. Voluptas earum qui expedita repudiandae mollitia. Soluta consequatur qui tenetur et est harum.', 'https://via.placeholder.com/640x480.png/00bbee?text=laboriosam', '548', '498', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(4, 'Tempora vel aut ut sit.', 'tempora-vel-aut-ut-sit', 'Ut sit odio suscipit rerum soluta. Earum quidem aut accusamus sed illum eveniet. Eligendi impedit sint et sit et quis ex ullam.', 'https://via.placeholder.com/640x480.png/001166?text=corrupti', '895', '845', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(5, 'Ab est aliquid dolores.', 'ab-est-aliquid-dolores', 'Totam illum cumque voluptas voluptates atque. Nihil illo eius vel placeat in. Nesciunt rerum id ipsum id doloribus architecto voluptatem. Inventore cum mollitia quia aspernatur excepturi. Incidunt qui sed qui repellat.', 'https://via.placeholder.com/640x480.png/0044bb?text=repellendus', '291', '241', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(6, 'Eos dolor et culpa iure.', 'eos-dolor-et-culpa-iure', 'Recusandae enim blanditiis nemo ut quidem. Et rerum necessitatibus in nihil voluptatem ut minus. Vero nesciunt porro quas corrupti hic omnis. Repudiandae quo molestiae sint inventore sint veritatis.', 'https://via.placeholder.com/640x480.png/00aaaa?text=tempore', '590', '540', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(7, 'Rem dicta facilis iusto.', 'rem-dicta-facilis-iusto', 'Id qui asperiores facilis ullam itaque impedit aut. Nobis aliquid atque dolor natus at facilis.', 'https://via.placeholder.com/640x480.png/0088bb?text=dolor', '743', '693', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(8, 'Non est velit nihil.', 'non-est-velit-nihil', 'Repudiandae dolore molestias nostrum exercitationem. Velit voluptate nemo dolorem praesentium vitae. Ut quo maxime exercitationem distinctio. Molestias porro et praesentium nulla rerum sit velit.', 'https://via.placeholder.com/640x480.png/004433?text=placeat', '588', '538', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(9, 'Non aspernatur qui nisi.', 'non-aspernatur-qui-nisi', 'Possimus quia architecto quae quia expedita ipsum et ratione. Sapiente ipsum corrupti laboriosam non sunt omnis. Sit voluptas atque quia animi.', 'https://via.placeholder.com/640x480.png/007744?text=sed', '643', '593', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(10, 'Aut animi id nostrum.', 'aut-animi-id-nostrum', 'Non et et enim sint cumque sequi qui. Itaque est corrupti et voluptate. Quis et cum excepturi.', 'https://via.placeholder.com/640x480.png/0066aa?text=qui', '619', '569', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(11, 'Ad ipsam hic a eveniet.', 'ad-ipsam-hic-a-eveniet', 'Voluptatem voluptas sed sequi quidem sequi nihil. Non et rerum dolores rerum. Vel quisquam eum eum odit quae voluptates voluptatibus qui. Eaque dignissimos modi voluptate voluptatem cum. Quisquam porro provident et velit in.', 'https://via.placeholder.com/640x480.png/005511?text=non', '368', '318', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(12, 'Nam quo dolor aut.', 'nam-quo-dolor-aut', 'Est ut quasi exercitationem nobis laudantium ea expedita. Qui et officiis mollitia odit. Voluptate qui est quasi. Minima natus alias aut est nisi sapiente autem repudiandae.', 'https://via.placeholder.com/640x480.png/006699?text=ut', '827', '777', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(13, 'Cupiditate et nam sed.', 'cupiditate-et-nam-sed', 'Voluptatem sunt suscipit sit et doloremque. Quos eum placeat rerum commodi quidem. Sint dolorem est autem et natus. Dignissimos suscipit modi et voluptas illo. Beatae voluptas quaerat et est.', 'https://via.placeholder.com/640x480.png/00cc99?text=quia', '173', '123', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(14, 'Amet et sit deleniti et.', 'amet-et-sit-deleniti-et', 'Voluptates enim laudantium id repellendus blanditiis. Et et earum similique. Illum dolorum nobis sit veritatis facere. Eligendi minus asperiores soluta eos maiores vero. Dolor nostrum consectetur illum. Ut maxime ad quia corporis unde.', 'https://via.placeholder.com/640x480.png/005544?text=expedita', '272', '222', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(15, 'Quasi est veniam dolor.', 'quasi-est-veniam-dolor', 'Et nam omnis aut adipisci id. Animi voluptatum voluptatibus eligendi magni. Quia quisquam optio rerum non ut nesciunt facilis. Enim est aut accusamus non.', 'https://via.placeholder.com/640x480.png/000022?text=sed', '482', '432', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(16, 'Sit dolor error vitae.', 'sit-dolor-error-vitae', 'Est voluptatibus aut quibusdam corporis qui minus. Tempore totam quisquam eius qui. Quod et ut fugit consequatur fuga qui modi.', 'https://via.placeholder.com/640x480.png/0077ee?text=autem', '819', '769', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(17, 'Et iusto eum quo.', 'et-iusto-eum-quo', 'Est dicta et doloremque quia reiciendis quo. Modi est officiis quibusdam perferendis. Voluptatem omnis quod beatae qui rerum maxime. Voluptates est illum ratione voluptas incidunt.', 'https://via.placeholder.com/640x480.png/007722?text=rerum', '592', '542', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(18, 'Quis maiores quo est.', 'quis-maiores-quo-est', 'Dolor qui deserunt dolore sit vitae quae hic. Nam consequatur voluptatem quia neque. Et itaque dolorem ad ut. In quaerat aut animi omnis voluptatum quos.', 'https://via.placeholder.com/640x480.png/00ddee?text=rem', '626', '576', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(19, 'Iure nihil debitis sint.', 'iure-nihil-debitis-sint', 'Omnis magni ipsam et temporibus. Ea itaque voluptatem beatae reprehenderit. Quam quia saepe in nesciunt ipsa ducimus. Sequi quisquam tempora quam nisi eos quo id.', 'https://via.placeholder.com/640x480.png/008800?text=nobis', '891', '841', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(20, 'Aut ex a rerum.', 'aut-ex-a-rerum', 'Molestiae tenetur velit excepturi laudantium laudantium mollitia. Incidunt molestiae dolorem sed non error porro. Praesentium sed voluptate odit totam. Exercitationem omnis sed consequatur.', 'https://via.placeholder.com/640x480.png/00ccdd?text=iure', '855', '805', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(21, 'Amet sit eum provident.', 'amet-sit-eum-provident', 'Porro ut impedit doloremque quibusdam suscipit. Laboriosam quasi exercitationem earum voluptate. Odit delectus et voluptates autem accusantium optio. Quis reprehenderit nulla nihil at non eaque.', 'https://via.placeholder.com/640x480.png/0088cc?text=sit', '788', '738', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(22, 'Ut quia qui qui aut.', 'ut-quia-qui-qui-aut', 'Commodi porro ea quod nostrum. Corporis numquam maxime dolorum exercitationem. Non voluptas pariatur ut molestiae velit nihil qui veritatis. Quia voluptatum sunt est harum.', 'https://via.placeholder.com/640x480.png/009966?text=eius', '261', '211', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(23, 'Odit rerum at esse.', 'odit-rerum-at-esse', 'Ut veritatis quia qui dolore dolor reiciendis vel. Occaecati quo autem illum odio sint dicta. Qui sunt debitis quam dolor earum. Iusto dolorem necessitatibus corrupti libero praesentium mollitia.', 'https://via.placeholder.com/640x480.png/00aa99?text=omnis', '512', '462', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(24, 'Et ullam enim qui dicta.', 'et-ullam-enim-qui-dicta', 'Dolor eos corporis dolorum nostrum natus eveniet. Aspernatur nobis nemo neque harum at. Voluptatibus iusto facere modi odit harum assumenda.', 'https://via.placeholder.com/640x480.png/000099?text=deserunt', '258', '208', '2021-12-12 04:35:38', '2021-12-12 04:35:38'),
(25, 'Odio minima quis iste.', 'odio-minima-quis-iste', 'Consequuntur voluptates quae perspiciatis autem in sapiente. Aut fugit ut aspernatur quasi. Ratione voluptas sit unde est nesciunt. Quo tempore pariatur exercitationem vero.', 'https://via.placeholder.com/640x480.png/0044ee?text=quia', '708', '658', '2021-12-12 04:35:38', '2021-12-12 04:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'ahmedhasnainmughal@gmail.com', NULL, '$2y$10$V/O7Ds1jBp2l2lvoprU6neavsDCgRO8dCKSdj1eV1tn9gjc76FUK.', 'ayZHg9YEzuywEwjGLzBVmABfK3egTyNgJvYfJsvx1Jvwpd85e1ejkQreBhk3', '2021-12-12 11:56:54', '2021-12-12 11:56:54'),
(2, 'Ali Amin', 'ali@gmail.com', NULL, '$2y$10$IzbXesQINMD8d0KVUVeDo.vop61JC.Dz2M1AhKtgLzucGsS7a1Et.', NULL, '2021-12-15 08:22:13', '2021-12-15 08:22:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `processings`
--
ALTER TABLE `processings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `processings`
--
ALTER TABLE `processings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
