-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 01, 2026 at 09:37 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_kendaraan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` varchar(5) NOT NULL,
  `nama_kendaraan` varchar(30) DEFAULT NULL,
  `no_polisi` varchar(15) DEFAULT NULL,
  `harga_sewa` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `nama_kendaraan`, `no_polisi`, `harga_sewa`) VALUES
('K001', 'Avanza', 'B2313OI', 320000),
('K002', 'Xenia', 'G0392YA', 300000),
('K003', 'Brio', 'D8868KN', 250000),
('K004', 'Jazz', 'F3681KK', 280000),
('K005', 'Ertiga', 'AB82783JL', 320000),
('K006', 'Innova', 'B8899FD', 400000),
('K007', 'Fortuner', 'AD7275BA', 600000),
('K008', 'Pajero', 'DB9328PO', 650000),
('K009', 'Rush', 'B3344II', 350000),
('K010', 'Terios', 'F6123UY', 340000);

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_metode` varchar(5) NOT NULL,
  `nama_metode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id_metode`, `nama_metode`) VALUES
('M001', 'Cash'),
('M002', 'Transfer'),
('M003', 'E-Wallet'),
('M004', 'Debit'),
('M005', 'Credit Card'),
('M006', 'QRIS'),
('M007', 'Mobile Banking'),
('M008', 'Virtual Account'),
('M009', 'COD'),
('M010', 'PayLater');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(15) NOT NULL,
  `nama_pelanggan` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `no_sim` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_telepon`, `no_sim`) VALUES
('P001', 'Fabio', 'Tangerang', '081209092', 'SIM001'),
('P002', 'Rayen', 'Manado', '082308318', 'SIM002'),
('P003', 'Arul', 'Jakarta', '0833333333', 'SIM003'),
('P004', 'Rehan', 'Tangerang', '0819238912', 'SIM004'),
('P005', 'Rizky', 'Ambon', '0884268148', 'SIM005'),
('P006', 'Febri', 'Bandung', '0813938092', 'SIM006'),
('P007', 'Kevin', 'Medan', '0872638716', 'SIM007'),
('P008', 'Ihdal', 'Jakarta', '0802383233', 'SIM008'),
('P009', 'Febrian', 'Bekasi', '0838173128', 'SIM009');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(5) NOT NULL,
  `id_pelanggan` varchar(5) DEFAULT NULL,
  `id_kendaraan` varchar(5) DEFAULT NULL,
  `id_metode` varchar(5) DEFAULT NULL,
  `tanggal_sewa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_kendaraan`, `id_metode`, `tanggal_sewa`) VALUES
('T001', 'P001', 'K001', 'M001', '2025-06-01'),
('T002', 'P002', 'K003', 'M002', '2025-06-02'),
('T003', 'P003', 'K004', 'M001', '2025-06-03'),
('T004', 'P004', 'K005', 'M003', '2025-06-04'),
('T005', 'P005', 'K006', 'M004', '2025-06-05'),
('T006', 'P006', 'K002', 'M005', '2025-06-06'),
('T007', 'P007', 'K007', 'M006', '2025-06-07'),
('T008', 'P008', 'K008', 'M007', '2025-06-08'),
('T009', 'P009', 'K009', 'M008', '2025-06-09'),
('T011', 'P001', 'K003', 'M010', '2025-06-11'),
('T012', 'P002', 'K004', 'M001', '2025-06-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `id_metode` (`id_metode`),
  ADD KEY `transaksi_ibfk_1` (`id_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_metode`) REFERENCES `metode_pembayaran` (`id_metode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
