-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Feb 2021 pada 17.34
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blanjaw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `address`
--

INSERT INTO `address` (`id`, `address`, `user_id`, `created_at`) VALUES
(28, 'Jl Semper Barat Jakarta Utara Indonesia 14130', 17, '2021-02-15 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_gender`
--

CREATE TABLE `category_gender` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `category_gender`
--

INSERT INTO `category_gender` (`id`, `gender`) VALUES
(1, 'Women'),
(2, 'Men'),
(3, 'Kids');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_product`
--

CREATE TABLE `category_product` (
  `ctg_id` int(11) NOT NULL,
  `ctg_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `category_product`
--

INSERT INTO `category_product` (`ctg_id`, `ctg_name`) VALUES
(1, 'shoes'),
(3, 'shirt'),
(4, 'short'),
(5, 'jacket'),
(6, 'pants'),
(7, 'backpak'),
(8, 'handbag'),
(9, 'watch'),
(10, 'Elektronik'),
(11, 'Gaming');

-- --------------------------------------------------------

--
-- Struktur dari tabel `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `color`
--

INSERT INTO `color` (`id`, `color_type`) VALUES
(1, 'Merah'),
(2, 'Kuning'),
(3, 'Hijau'),
(4, 'Biru'),
(5, 'Biru Tua'),
(6, 'Abu - Abu'),
(7, 'Hitam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `conditions`
--

CREATE TABLE `conditions` (
  `cndtn_id` int(11) NOT NULL,
  `cndtn_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `conditions`
--

INSERT INTO `conditions` (`cndtn_id`, `cndtn_type`) VALUES
(1, 'New'),
(2, 'Second');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history_transactions`
--

CREATE TABLE `history_transactions` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prd_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `price` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `history_transactions`
--

INSERT INTO `history_transactions` (`id`, `invoice`, `prd_id`, `qty`, `status`, `user_id`, `seller_id`, `price`, `created_at`) VALUES
(4, 'INV/2021/12/hatePnJOda', '17', 2, 'Menunggu Pembayaran', 12, 0, '1100000', '2021-02-08 00:00:00'),
(5, 'INV/2021/17/WdL4yDtaFf', '17', 3, 'Menunggu Pembayaran', 17, 0, '1650000', '2021-02-08 00:00:00'),
(6, 'INV/2021/17/S5aCeQm3qo', '', 1, 'Menunggu Pembayaran', 17, 0, '175000', '2021-02-10 00:00:00'),
(7, 'INV/2021/17/GQJGOHVxDp', '', 1, 'Menunggu Pembayaran', 17, 0, '175000', '2021-02-12 00:00:00'),
(8, 'INV/2021/17/YAe5oDoHtT', '', 1, 'Packing', 17, 19, '592000', '2021-02-15 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id`, `level`) VALUES
(1, 'Seller'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `prd_id` int(11) NOT NULL,
  `prd_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prd_brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prd_price` int(11) NOT NULL,
  `cndtn_id` int(11) NOT NULL,
  `prd_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `prd_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prd_ctg` int(11) NOT NULL,
  `prd_ctg_gender` int(11) DEFAULT NULL,
  `prd_rating` float NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`prd_id`, `prd_name`, `prd_brand`, `prd_price`, `cndtn_id`, `prd_description`, `user_id`, `size_id`, `prd_image`, `prd_ctg`, `prd_ctg_gender`, `prd_rating`, `created_at`, `updated_at`) VALUES
(4, 'Compass Brand Lokal', 'Compass', 3000000, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 0, 1, '[\"http://192.168.43.173:8000/images/1608083085638-image.jpg\"]', 1, 2, 4.5, '0000-00-00', '0000-00-00'),
(5, 'New Balance 999 Classic Shoes', 'New Balance', 2000000, 1, 'Sepatu Trendy cocok untuk aktivitas harian', 0, 1, '[\"http://192.168.43.173:8000/images/1608115028199-image.jpg\"]', 1, 2, 4.9, '0000-00-00', '0000-00-00'),
(6, 'Sepatu Adidas Ultra Boost', 'Adidas', 2000000, 1, 'Sepatu Trendy cocok untuk aktivitas harian', 0, 4, '[\"http://192.168.43.173:8000/images/1608115603010-image.jpg\"]', 1, 1, 4.4, '2020-11-23', '2020-11-23'),
(17, 'Jacket Nike', 'Nike', 550000, 1, 'Nyaman dipakai setiap hari senin  sampai jum\'at', 0, 9, '[\"http://192.168.43.173:8000/images/1608135747310-image.jpg\",\"http://192.168.43.173:8000/images/1608135747311-image.jpg\"]', 5, 3, 4.7, '2020-12-01', '2020-12-01'),
(18, 'Tas Eiger', 'Eiger', 550000, 1, 'Awet dipakai ke gunung atau pantai', 0, 9, '[\"http://192.168.43.173:8000/images/1608135757285-image.jpg\",\"http://192.168.43.173:8000/images/1608135757287-image.jpg\"]', 7, 1, 4.7, '2020-12-01', '2020-12-01'),
(21, 'Nike Shirt', 'Nike', 150111, 1, 'Baju Baru Alhamdulillah', 16, 5, '[\"http://192.168.43.173:8000/images/1608135767522-image.jpg\",\"http://localhost:8000/images/1608135767523-image.jpg\"]', 3, 3, 4.7, '2020-12-02', '2020-12-08'),
(23, 'Celana Pendek Eiger', 'Eiger', 99000, 1, 'Pendek tapi tahan lama', 19, 5, '[\"http://192.168.43.173:8000/images/1608135780046-image.jpg\",\"http://localhost:8000/images/1608135780046-image.jpg\"]', 4, NULL, 5, '2020-12-02', '2020-12-02'),
(24, 'Celana Jeans Levis Ori', 'Levis', 250000, 1, 'Gaul dan Kekinian', 0, 5, '[\"http://192.168.43.173:8000/images/1608135782979-image.jpg\",\"http://192.168.43.173:8000/images/1608135782982-image.jpg\"]', 6, NULL, 5, '2020-12-02', '2020-12-02'),
(25, 'Watch Man Series123', 'Timex', 800000, 1, 'For Adventure Man', 0, 5, '[\"http://192.168.43.173:8000/images/1608135796610-image.jpg\",\"http://localhost:8000/images/1608135796611-image.jpg\"]', 9, NULL, 4.5, '2020-12-02', '2020-12-06'),
(26, 'Tas Eiger 2.0', 'Eiger', 895623, 1, 'baggus banget', 0, 5, '[\"http://192.168.43.173:8000/images/1608135806670-image.jpg\",\"http://localhost:8000/images/1608135806671-image.jpg\"]', 4, NULL, 4.5, '2020-12-02', '2020-12-07'),
(27, 'Celana Adidas', 'Adidas', 800000, 1, 'Awet Baru', 19, 5, '[\"http://192.168.43.173:8000/images/1608135931310-image.jpg\",\"http://localhost:8000/images/1608135931310-image.jpg\"]', 4, NULL, 4.5, '2020-12-07', '2020-12-16'),
(28, 'tas baru', 'nike', 200000, 1, 'anti hujan', 19, 5, '[\"http://192.168.43.173:8000/images/1608135934897-image.jpg\",\"http://192.168.43.173:8000/images/1608135934897-image.jpg\"]', 4, NULL, 4.5, '2020-12-04', '2020-12-04'),
(29, 'New Balance 991 Classic Shoes', 'New Balance', 2000000, 1, 'Sepatu Trendy cocok untuk aktivitas harian', 16, 1, '[\"http://192.168.43.173:8000/images/1608115140449-image.jpg\"]', 1, NULL, 4.9, '2020-12-05', '2020-12-16'),
(31, 'Tas Adidas 1', 'Adidas wakabayasi', 350000, 1, 'test masuk ga ya', 16, 5, '[\"http://192.168.43.173:8000/images/1607533655137-image.jpg\",\"http://localhost:8000/images/1607533655138-image.jpg\"]', 1, NULL, 4.5, '2020-12-08', '2020-12-08'),
(33, 'sepatu nb merah', 'Nb', 80000, 1, 'test masuk ga ya', 0, 5, '[\"http://192.168.43.173:8000/images/1608082412690-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(34, 'sepatu nb yellow', 'Nb', 800364, 1, 'Bisa Ayo', 19, 5, '[\"http://192.168.43.173:8000/images/1607440306209-image.jpg\",\"http://localhost:8000/images/1607440306211-image.jpg\"]', 1, NULL, 4.5, '2020-12-08', '2020-12-08'),
(37, 'Yoki Black Formal', 'Yongki', 800364, 1, 'Bisa Ayo', 16, 5, '[\"http://192.168.43.173:8000/images/1607528204581-image.jpg\",\"http://192.168.43.173:8000/images/1607528204582-image.jpg\"]', 1, NULL, 4.5, '2020-12-09', '2020-12-09'),
(38, 'Yongki Brown Casual', 'Yongki', 800364, 1, 'Bisa Ayo', 19, 5, '[\"http://192.168.43.173:8000/images/1607532188974-image.jpg\",\"http://localhost:8000/images/1607532188975-image.jpg\"]', 1, NULL, 4.5, '2020-12-09', '2020-12-09'),
(39, 'Mercurial Assist v.99', 'Nike', 800364, 1, 'Bisa Ayo', 19, 5, '[\"http://192.168.43.173:8000/images/1607532267607-image.jpg\",\"http://localhost:8000/images/1607532267608-image.jpg\"]', 1, NULL, 4.5, '2020-12-09', '2020-12-09'),
(40, 'Adidas', 'Adidas wakabayasi', 350000, 1, 'Bisa Ayo', 0, 5, '[\"http://192.168.43.173:8000/images/1608114191781-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(41, 'test tas image array 22', 'Nike', 800364, 1, 'Bisa Ayo', 0, 5, '[\"http://192.168.43.173:8000/images/1607579652767-image.jpg\",\"http://192.168.43.173:8000/images/1607579652768-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(42, 'Nike New', 'Nike', 700364, 1, 'Bisa Ayo', 0, 5, '[\"http://192.168.43.173:8000/images/1607580110330-image.jpg\",\"http://localhost:8000/images/1607580110332-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(43, 'test tas image array 23', 'Adidas wakabayasi', 800364, 1, 'Bisa Ayo', 0, 5, '[\"http://192.168.43.173:8000/images/1608115095443-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(47, 'Tas Eiger 2.1', 'uniqlo', 500000, 1, 'baggus banget', 0, 5, '[\"http://192.168.43.173:8000/images/1608042671143-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(48, 'Tas Eiger 2.1', 'uniqlo', 500000, 1, 'baggus banget', 0, 5, '[\"http://192.168.43.173:8000/images/1608027193732-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(49, 'Tas Eiger 2.0', 'uniqlo', 500000, 1, 'baggus banget', 0, 5, '[\"http://192.168.43.173:8000/images/1608041935645-image.jpg\"]', 1, NULL, 4.5, '0000-00-00', '0000-00-00'),
(50, 'NAMA BARU', 'uniqlo', 800000, 1, 'baggus banget', 19, 5, '[\"http://192.168.43.173:8000/images/1608178161942-image.jpg\"]', 1, NULL, 4.5, '2020-12-16', '2020-12-17'),
(51, 'baju baru', 'uniqlo', 500000, 1, 'baggus banget', 16, 5, '[\"http://192.168.43.173:8000/images/1608178205273-image.jpg\"]', 1, NULL, 4.5, '2020-12-17', '2020-12-17'),
(55, 'Rsch lengan pendek', 'Rsch', 175000, 0, 'Baju lengan pendek karya anakb bangsa dan terjangkau', 16, 0, '[\"http://192.168.43.173:8000/images/1612911978033-image.jpg\",\"http://192.168.43.173:8000/images/1612911978167-image.jpeg\",\"http://192.168.43.173:8000/images/1612911978172-image.jpeg\",\"http://192.168.43.173:8000/images/1612911978174-image.jpeg\"]', 3, NULL, 0, '2021-02-10', '2021-02-09'),
(57, 'DC Hawknight', 'DCDC', 580000, 0, 'Produk import asli no tipu', 19, 0, '[\"http://192.168.43.173:8000/images/1613394797427-image.jpg\",\"http://192.168.43.173:8000/images/1613394797438-image.jpg\",\"http://192.168.43.173:8000/images/1613394797519-image.jpg\"]', 1, NULL, 0, '2021-02-15', '2021-02-15'),
(60, 'Jacket & Swiiter DIstro', 'Bloods', 325000, 0, 'Tersedia jacket dan switer custom ', 19, 0, '[\"http://192.168.43.173:8000/images/1613450283263-image.jpg\",\"http://192.168.43.173:8000/images/1613450283265-image.jpg\"]', 5, NULL, 0, '2021-02-16', '2021-02-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_color`
--

CREATE TABLE `product_color` (
  `pc_id` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `clr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `product_color`
--

INSERT INTO `product_color` (`pc_id`, `prd_id`, `clr_id`) VALUES
(1, 4, 4),
(2, 4, 5),
(3, 5, 1),
(4, 5, 2),
(5, 6, 3),
(6, 6, 4),
(7, 7, 5),
(8, 7, 6),
(9, 8, 7),
(10, 8, 7),
(11, 9, 5),
(12, 9, 3),
(13, 10, 4),
(14, 10, 1),
(15, 8, 2),
(16, 9, 6),
(17, 12, 4),
(18, 13, 5),
(19, 57, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_size`
--

CREATE TABLE `product_size` (
  `ps_id` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `sz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `product_size`
--

INSERT INTO `product_size` (`ps_id`, `prd_id`, `sz_id`) VALUES
(0, 12, 8),
(1, 4, 5),
(2, 4, 6),
(3, 5, 3),
(4, 5, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(12, 13, 9),
(13, 12, 8),
(14, 12, 9),
(15, 57, 1),
(16, 57, 4),
(17, 57, 5),
(18, 57, 6),
(19, 57, 1),
(20, 57, 4),
(21, 57, 5),
(22, 57, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `review` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `reviews`
--

INSERT INTO `reviews` (`id`, `review`, `user_id`, `prd_id`, `rating`) VALUES
(1, 'nyaman dipakai', 12, 4, 4),
(4, 'nyaman dipakai 2', 11, 4, 4),
(9, 'Barang sangat bagus banget', 10, 4, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_list`
--

CREATE TABLE `room_list` (
  `id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `room_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `room_list`
--

INSERT INTO `room_list` (`id`, `cus_id`, `seller_id`, `room_id`) VALUES
(1, 20, 12, 'c20s12'),
(2, 17, 16, 'c17s16'),
(3, 17, 16, 'c17s16'),
(4, 17, 16, 'c17s16'),
(5, 17, 16, 'c17s16'),
(6, 17, 16, 'c17s16'),
(7, 17, 16, 'c17s16'),
(8, 17, 16, 'c17s16'),
(9, 17, 16, 'c17s16'),
(10, 19, 16, 'c19s16'),
(11, 19, 16, 'c19s16'),
(12, 16, 19, 'c16s19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `size`
--

CREATE TABLE `size` (
  `size_id` int(11) NOT NULL,
  `size_prd` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `size`
--

INSERT INTO `size` (`size_id`, `size_prd`) VALUES
(1, '42'),
(3, '38'),
(4, '39'),
(5, '40'),
(6, '41'),
(7, 'S'),
(8, 'M'),
(9, 'L'),
(10, 'XL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_chat`
--

CREATE TABLE `tb_chat` (
  `id` int(11) NOT NULL,
  `chatMessage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `senderName` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` varchar(115) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tb_chat`
--

INSERT INTO `tb_chat` (`id`, `chatMessage`, `sender`, `senderName`, `room_id`) VALUES
(1, 'Rumbling with me?', '17', 'Eren Yeager', 'c17s16'),
(2, 'Yes ', '19', 'Haziq', 'c17s16'),
(3, 'no dude i\'m founding titan', '16', 'Muhammad', 'c17s16'),
(4, 'Okey i think about it', '17', 'Eren Jaeger', 'c17s16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_otp`
--

CREATE TABLE `tb_otp` (
  `id` int(11) NOT NULL,
  `otp` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tb_otp`
--

INSERT INTO `tb_otp` (`id`, `otp`) VALUES
(8, 'jyX0zU'),
(10, 'iPH3u3'),
(17, 'fKt3Cg'),
(18, 'gngZd7'),
(19, 'YxLa1E');

-- --------------------------------------------------------

--
-- Struktur dari tabel `token_blacklist`
--

CREATE TABLE `token_blacklist` (
  `id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `token_whitelist`
--

CREATE TABLE `token_whitelist` (
  `id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `token_whitelist`
--

INSERT INTO `token_whitelist` (`id`, `token`) VALUES
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1naGFseXJhbWFkaGFuQGdtYWlsLmNvbSIsImxldmVsIjoiU2VsbGVyIiwiaWF0IjoxNjEyNzExMTQzfQ.r-pWiwZSVOd9GCurwlLS7r70ZVKo0Grdm9ZjEZ_OuCY'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1naGFseXJhbWFkaGFuQGdtYWlsLmNvbSIsImxldmVsIjoiU2VsbGVyIiwiaWF0IjoxNjEyODc4NjM2fQ.bYG-HKhc-9TVUbwxXGLXq43yyYJfc34LUtt8XU2-yvA'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1naGFseXJhbWFkaGFuQGdtYWlsLmNvbSIsImxldmVsIjoiU2VsbGVyIiwiaWF0IjoxNjEyODczMzYwfQ.qJwFb5oadNxdLvVPMROmG5YO6O7KbPa-NPTVIbrCEpg'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1naGFseXJhbWFkaGFuQGdtYWlsLmNvbSIsImxldmVsIjoiU2VsbGVyIiwiaWF0IjoxNjEyODU4MjI4fQ.7bRae_HjZeuzdygzD1oXANWmhtdGHamnDuomrUxWQ0c'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1naGFseXJhbWFkaGFuQGdtYWlsLmNvbSIsImxldmVsIjoiU2VsbGVyIiwiaWF0IjoxNjEyOTI1NjAxfQ.CqgGXQ7xgoi4wcf3Xd0iPcFkP5chi9L61aXBwTO7VCo'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1naGFseXJhbWFkaGFuQGdtYWlsLmNvbSIsImxldmVsIjoiU2VsbGVyIiwiaWF0IjoxNjEzNDQzNTc0LCJleHAiOjE2MTM1Mjk5NzR9.06GHPreU4WKevrTAOSP8-VpKEZ4_Pug_5UKtwJeTs6s'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI3MTEyNTN9.NOLUlMKftSiob7GT2TrSxbUey1LDB926kE0sbkI1f6I'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI3NDgxNDF9.8wqGt5XOExubMv1_ViQJCClhwloNF7FLNGYxgUczqvE'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI4NTg0MDJ9.bXnTllcqt3rnvNkrV7zy2SN23jtvGq7bNmz9VfZOE6Y'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MjgwMzV9.BqaASGred3ZhQp2WPVtoRCtaX2-ujHjWKap88a_-0Ww'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MjgxMzZ9.bnZT2af5DmzXO5IHxXNtCx1H7lbx-DaegqobPc7w224'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MTI0MzR9.3xWmw5fUF6Qhl379Gi8cpmCD3YYxuvMx2UQlJrieYA0'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MTk3MDV9.uesKjLw-GIFOLtWMZppu9ZsdHP8y3wh7fiVkRMroU98'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MTk3MzV9.jedPE-oroVqxK_0UavoxZWv1h4OQAcX7jCsDCgrJDDk'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MTk4MzN9.0kZ0G-NaQ9-gVis3NFhFxYcAKNV6x4-oC5k0uSdL4KA'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MTkwMDV9.YmIw8t68CA1qk502rjbJorb5vRDIehCcBFcuoygvZ18'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5MTM0Mjl9.B2ssluYA5oZxB6NxscUJnPGApVjVOxrrH9mLok58cQ4'),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5NjcwOTZ9.CLDl5iq4YrkcU9wzNK3CRX82kZNQsSCKSapzBVzvBIg'),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5NjQyMDZ9.vKZ4G5abl-_CXziiAo1ngms8Hdx1hcXNOdBRx3UfCKc'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5NjY5ODR9.O-scN9-z8zBaOXmrog2l5CkoWag4InJ_elFLf9uqG_8'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTI5Nzc0Nzl9.g2-EegiiJypX-CRcfpaWwKKvaXN18-2B3VZy7if2yWs'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0Mzc2NTYsImV4cCI6MTYxMzUyNDA1Nn0.j93UGE3XC3H8xBCJ1GCZq-0kcT2HxVPEF3bSsH7p7Fg'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM0NjksImV4cCI6MTYxMzUyOTg2OX0.9-PadIF0afykUyhV29aQIrDYoeMwfVJ1Sky8OKZVcGM'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM0NzgsImV4cCI6MTYxMzUyOTg3OH0.8HVd0EtELdJXIVd2CqPNdWlCbFuKR7gl0NXUJJEWRAM'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM4OTUsImV4cCI6MTYxMzUzMDI5NX0.gCSG55hG-rRsgi2rUax3PZIZS9y--iEbloRarnmXINI'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM5MDUsImV4cCI6MTYxMzUzMDMwNX0.LlxXVXfZkC-IOpfjY_IXIZF3Ih1UNyLN1AcsiwYkSWI'),
(70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM5NDEsImV4cCI6MTYxMzUzMDM0MX0.9vEMwu_gRsXkrE-Bcph9twq2zNJ2jW0wq3e7lGsYimI'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM5NTIsImV4cCI6MTYxMzUzMDM1Mn0.C8vPGfWE3Q46Xi96FTPUUfrEb9cgDbavYRCLbYWkW50'),
(74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM5NzcsImV4cCI6MTYxMzUzMDM3N30.zYMpO9rylqsFJJFBhSbS6tLCr81DhwIYMztev50MhIQ'),
(73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDM5NzYsImV4cCI6MTYxMzUzMDM3Nn0.-UnLjPVkY4QdvB7ocG88Do6q9o9MrI7vYVG9aCXsegI'),
(75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDQwMjUsImV4cCI6MTYxMzUzMDQyNX0.q3CvNnJRu3f8JGNuktDr0rA5-qaMtdz76LvGmoBgjP0'),
(77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NDQyMDcsImV4cCI6MTYxMzUzMDYwN30.yq4318rzilGHaW7_QQeUKHotRMhKTO8M3X9OnUqM_8g'),
(88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NjY0ODIsImV4cCI6MTYxMzU1Mjg4Mn0.o1iYlVXR5-VvJ2L7c2_MpDvMWbDE6tPHbsFB6EyfwtQ'),
(87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NjYzNjUsImV4cCI6MTYxMzU1Mjc2NX0.OkkiRzNk5mQuoyue-g6Llt_jwaNAvqz-z92u1_46T9U'),
(86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTM0NTg4MDQsImV4cCI6MTYxMzU0NTIwNH0.ImrRBg-HIjDYZP6SQLQeAsl-RqmWQf3UTo604MFve7k'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTMwMDUwNzd9.Ad83eIdjgauvds8PBYYegHX22cXdEgdkMMtAlbvVS6s'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTMwOTc5ODF9.0DlMWeuXp05bc_FjoyX2ZciztluRSFiltjTPJQqbto8'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTMxOTkxNjJ9.Ld7Rcwr4BHX-CF7b1uji97_LQjQgt8pa6k4ztcnVOnA'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTMzMDQyODF9.iOb493acAijuqsFj_gjb5dynE9CvzmOJgiUo2E7z0No'),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vY2hhbW1hZGdoYWx5QGdtYWlsLmNvbSIsImxldmVsIjoiQ3VzdG9tZXIiLCJpYXQiOjE2MTMzODM0NTksImV4cCI6MTYxMzQ2OTg1OX0._XAhCSFqPS8bO5sHSZL97QcGhD4JxquaCuexEgA2QIA'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhlbmRyYS5zb2xpaC5qcEBnbWFpbC5jb20iLCJsZXZlbCI6IlNlbGxlciIsImlhdCI6MTYwOTUxNDc3NH0.m50Fh7iSE-h1f80fzyNhYm3kOy_X_GaNyCTxmC7PMWk'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhlbmRyYS5zb2xpaC5qcEBnbWFpbC5jb20iLCJsZXZlbCI6IlNlbGxlciIsImlhdCI6MTYwOTUxNDgwN30.XPeak6PNOLqjmlL07wSVdKsTNEUxKuT5CSQfTMxwPWk'),
(85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImludGVybmV0d2FyZ2FuZWdhcmFAZ21haWwuY29tIiwibGV2ZWwiOiJTZWxsZXIiLCJpYXQiOjE2MTM0NDk3NjgsImV4cCI6MTYxMzUzNjE2OH0.FAlw5pfUVdj_VdcySoA76m-QGUTBSYQPsA_FreIk-es'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImludGVybmV0d2FyZ2FuZWdhcmFAZ21haWwuY29tIiwibGV2ZWwiOiJTZWxsZXIiLCJpYXQiOjE2MTMzOTM4MTAsImV4cCI6MTYxMzQ4MDIxMH0.8nAF2LfaSooAyqGHPyctyC0URVx0BflHSZsnr1G-28s');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level_id` int(11) NOT NULL,
  `store_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `user_name`, `user_password`, `birth_date`, `level_id`, `store_name`, `phone_num`, `photo_user`) VALUES
(3, 'mark01@gmail.com', 'mark01', '$2b$10$bCAfgXa4g.QQ4cF8/v0NMuDbYfEGdw24M4uJ9N6OUjl4DINJw09KW', '0000-00-00', 1, '', '', ''),
(4, 'masbro@gmail.com', 'masbro', '$2b$10$xIwrfiwYfj.0kfkHBZKVB.40x7LChKINknBGZq0ZF90HiflnyBB1i', '0000-00-00', 2, '', '', ''),
(6, 'masbro01@gmail.com', 'masbro01', '$2b$10$C7G6AJi85.EkI/M6CAtj..Istys0lx3DeofkUc0sy43WwNpsHhpti', '0000-00-00', 2, '', '', NULL),
(7, 'masbro02@gmail.com', 'masbro02', '$2b$10$G4aNHyDdoxiZeFoLQvs2E.DU.plu0rx.JveeN187yQ7VA3uot2lH.', '0000-00-00', 1, '', '', ''),
(16, 'mghalyramadhan@gmail.com', 'Eren Yeageah', '$2b$10$Lp029jPOglXwBZqSeCcmhuQEY/avrgorVlAkSKfJaThAma2SNPALa', '1999-02-16T14:03:00.000Z', 1, NULL, NULL, ''),
(17, 'mochammadghaly@gmail.com', 'Eren Yeageah', '$2b$10$hWQCCORxsRXRxKtM0ODxVeS/BgTV7x.2AhykKsl0Jjv5rUHLis8HW', '2021-02-16T02:58:39.872Z', 2, NULL, '0812878791', 'http://192.168.43.173:8000/images/1613482009768-photo.jpg'),
(19, 'internetwarganegara@gmail.com', 'Haziq Gaesah', '$2b$10$xOv9fhjqMpAe7/HoJE2ZE.eN/5O.RrhUgW47PGg.iPR7ZuShwdl6O', '0000-00-00', 1, 'Norden', NULL, NULL),
(20, 'ghalievanhout@gmail.com', 'Admin Arlert', '$2b$10$N7cfXIyu16/h1mQlHf/GrOgJRNzirW37LkElH.zTRu0Euka6g8MTe', '', 2, '', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category_gender`
--
ALTER TABLE `category_gender`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`ctg_id`);

--
-- Indeks untuk tabel `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`cndtn_id`);

--
-- Indeks untuk tabel `history_transactions`
--
ALTER TABLE `history_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prd_id`);

--
-- Indeks untuk tabel `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`pc_id`);

--
-- Indeks untuk tabel `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`ps_id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`prd_id`);

--
-- Indeks untuk tabel `room_list`
--
ALTER TABLE `room_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indeks untuk tabel `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_otp`
--
ALTER TABLE `tb_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `token_blacklist`
--
ALTER TABLE `token_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `token_whitelist`
--
ALTER TABLE `token_whitelist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `category_gender`
--
ALTER TABLE `category_gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `category_product`
--
ALTER TABLE `category_product`
  MODIFY `ctg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `conditions`
--
ALTER TABLE `conditions`
  MODIFY `cndtn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `history_transactions`
--
ALTER TABLE `history_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `prd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `product_color`
--
ALTER TABLE `product_color`
  MODIFY `pc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `product_size`
--
ALTER TABLE `product_size`
  MODIFY `ps_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `room_list`
--
ALTER TABLE `room_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `size`
--
ALTER TABLE `size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_chat`
--
ALTER TABLE `tb_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_otp`
--
ALTER TABLE `tb_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `token_blacklist`
--
ALTER TABLE `token_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `token_whitelist`
--
ALTER TABLE `token_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
