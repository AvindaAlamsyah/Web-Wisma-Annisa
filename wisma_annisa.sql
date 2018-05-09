-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2018 at 04:09 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisma_annisa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `namaAdmin` varchar(100) NOT NULL,
  `jabatan` varchar(45) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alat_elektronik`
--

CREATE TABLE `alat_elektronik` (
  `idAlat` int(11) NOT NULL,
  `namaAlat` varchar(45) NOT NULL,
  `biayaAlat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bayar_kamar`
--

CREATE TABLE `bayar_kamar` (
  `idPembayaran` int(11) NOT NULL,
  `tanggalPembayaran` datetime NOT NULL,
  `totalPembayaran` int(11) NOT NULL,
  `buktiTransfer` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `idPenyewa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `biaya_operasional`
--

CREATE TABLE `biaya_operasional` (
  `idPengeluaran` int(11) NOT NULL,
  `pengeluaran` varchar(45) NOT NULL,
  `tanggalPembayaran` date NOT NULL,
  `nominalPengeluaran` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `idfasilitas` int(11) NOT NULL,
  `fasilitas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_kamar`
--

CREATE TABLE `fasilitas_kamar` (
  `noKamar` int(11) NOT NULL,
  `idfasilitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `noKamar` int(11) NOT NULL,
  `hargaKamar` int(11) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keluhan`
--

CREATE TABLE `keluhan` (
  `idKeluhan` int(11) NOT NULL,
  `isiKeluhan` varchar(200) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `idPenyewa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kepemilikan_alat`
--

CREATE TABLE `kepemilikan_alat` (
  `idPenyewa` varchar(45) NOT NULL,
  `idAlat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `idPenyewa` varchar(45) NOT NULL,
  `namaPenyewa` varchar(100) NOT NULL,
  `noTelpPenyewa` varchar(15) NOT NULL,
  `tglMasuk` datetime NOT NULL,
  `universitas` varchar(45) NOT NULL,
  `fakultas` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `namaOrangTua` varchar(100) NOT NULL,
  `noTelpOrangTua` varchar(15) NOT NULL,
  `alamatOrangTua` varchar(100) NOT NULL,
  `noKamar` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD KEY `fk_admin_user1_idx` (`iduser`);

--
-- Indexes for table `alat_elektronik`
--
ALTER TABLE `alat_elektronik`
  ADD PRIMARY KEY (`idAlat`);

--
-- Indexes for table `bayar_kamar`
--
ALTER TABLE `bayar_kamar`
  ADD PRIMARY KEY (`idPembayaran`),
  ADD KEY `fk_bayar_kamar_penyewa1_idx` (`idPenyewa`);

--
-- Indexes for table `biaya_operasional`
--
ALTER TABLE `biaya_operasional`
  ADD PRIMARY KEY (`idPengeluaran`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`idfasilitas`),
  ADD UNIQUE KEY `idfasilitas_UNIQUE` (`idfasilitas`);

--
-- Indexes for table `fasilitas_kamar`
--
ALTER TABLE `fasilitas_kamar`
  ADD KEY `fk_kamar_has_fasilitas_fasilitas1_idx` (`idfasilitas`),
  ADD KEY `fk_kamar_has_fasilitas_kamar_idx` (`noKamar`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`noKamar`),
  ADD UNIQUE KEY `noKamar_UNIQUE` (`noKamar`);

--
-- Indexes for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`idKeluhan`),
  ADD KEY `fk_keluhan_penyewa1_idx` (`idPenyewa`);

--
-- Indexes for table `kepemilikan_alat`
--
ALTER TABLE `kepemilikan_alat`
  ADD KEY `fk_penyewa_has_alat_elektronik_alat_elektronik1_idx` (`idAlat`),
  ADD KEY `fk_penyewa_has_alat_elektronik_penyewa1_idx` (`idPenyewa`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`idPenyewa`),
  ADD UNIQUE KEY `idPenyewa_UNIQUE` (`idPenyewa`),
  ADD UNIQUE KEY `noTelpPenyewa_UNIQUE` (`noTelpPenyewa`),
  ADD KEY `fk_penyewa_kamar1_idx` (`noKamar`),
  ADD KEY `fk_penyewa_user1_idx` (`iduser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bayar_kamar`
--
ALTER TABLE `bayar_kamar`
  MODIFY `idPembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biaya_operasional`
--
ALTER TABLE `biaya_operasional`
  MODIFY `idPengeluaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `idKeluhan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bayar_kamar`
--
ALTER TABLE `bayar_kamar`
  ADD CONSTRAINT `fk_bayar_kamar_penyewa1` FOREIGN KEY (`idPenyewa`) REFERENCES `penyewa` (`idPenyewa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `fasilitas_kamar`
--
ALTER TABLE `fasilitas_kamar`
  ADD CONSTRAINT `fk_kamar_has_fasilitas_fasilitas1` FOREIGN KEY (`idfasilitas`) REFERENCES `fasilitas` (`idfasilitas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kamar_has_fasilitas_kamar` FOREIGN KEY (`noKamar`) REFERENCES `kamar` (`noKamar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD CONSTRAINT `fk_keluhan_penyewa1` FOREIGN KEY (`idPenyewa`) REFERENCES `penyewa` (`idPenyewa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kepemilikan_alat`
--
ALTER TABLE `kepemilikan_alat`
  ADD CONSTRAINT `fk_penyewa_has_alat_elektronik_alat_elektronik1` FOREIGN KEY (`idAlat`) REFERENCES `alat_elektronik` (`idAlat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_penyewa_has_alat_elektronik_penyewa1` FOREIGN KEY (`idPenyewa`) REFERENCES `penyewa` (`idPenyewa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD CONSTRAINT `fk_penyewa_kamar1` FOREIGN KEY (`noKamar`) REFERENCES `kamar` (`noKamar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_penyewa_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
