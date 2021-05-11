-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Apr 2021 pada 11.39
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ukk2021p1imam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_info`
--

CREATE TABLE `tb_info` (
  `info_id` int(10) NOT NULL,
  `info_judul` text NOT NULL,
  `info_isi` text NOT NULL,
  `info_status` enum('Terverifikasi','Belum Terverifikasi') NOT NULL,
  `info_tgl` int(2) NOT NULL,
  `info_bln` int(10) NOT NULL,
  `info_thn` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_class` int(11) NOT NULL,
  `nama_kelas` enum('X','XI','XII') NOT NULL,
  `kompetensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_class`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(1, 'X', 'Teknik Informasi & Komunikasi'),
(2, 'X', 'Teknik Bisnis Sepeda Motor'),
(3, 'XI', 'Rekayasa Perangkat Lunak'),
(4, 'XI', 'Teknik Komputer Jaringan'),
(5, 'XII', 'Rekayasa Perangkat Lunak'),
(6, 'XII', 'Teknik Komputer Jaringan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_login_siswa`
--

CREATE TABLE `tb_login_siswa` (
  `nis` char(8) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_login_siswa`
--

INSERT INTO `tb_login_siswa` (`nis`, `password`) VALUES
('18191001', '12345678'),
('18191002', '12345678'),
('18191003', '1234567');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_payment` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bln_dibayar` varchar(8) NOT NULL,
  `thn_dibayar` varchar(4) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `role` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `role`) VALUES
(3, 'admin', '123', 'imam', 'admin'),
(4, 'petugas', '123', 'imam petugas', 'petugas'),
(5, 'imsat', '123', 'Imam Satrio Prakoso', 'admin'),
(39, 'okabe', '12345678', 'levi ackerman', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nisn` char(10) NOT NULL,
  `nis` char(8) NOT NULL,
  `nama_siswa` varchar(35) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `id_class` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `siswa_status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`nisn`, `nis`, `nama_siswa`, `jenis_kelamin`, `id_class`, `alamat`, `no_telp`, `siswa_status`) VALUES
('0020100001', '18191001', 'Imam Satrio Prakoso', 'pria', 1, 'bandung', '089542164846', 'Aktif'),
('0020100002', '18191002', 'arima kousei', 'pria', 3, 'japan', '089434976464', 'Aktif'),
('0020100003', '18191003', 'Okabe rintarou', 'pria', 5, 'akb', '084943497979', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_spp`
--

CREATE TABLE `tb_spp` (
  `id_spp` int(11) NOT NULL,
  `nisn` char(10) NOT NULL,
  `spp_januari` int(7) NOT NULL,
  `spp_februari` int(7) NOT NULL,
  `spp_maret` int(7) NOT NULL,
  `spp_april` int(7) NOT NULL,
  `spp_mei` int(7) NOT NULL,
  `spp_juni` int(7) NOT NULL,
  `spp_juli` int(7) NOT NULL,
  `spp_agustus` int(7) NOT NULL,
  `spp_september` int(7) NOT NULL,
  `spp_oktober` int(7) NOT NULL,
  `spp_november` int(7) NOT NULL,
  `spp_desember` int(7) NOT NULL,
  `tahun_ajaran` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `status` enum('Lunas','Belum Lunas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_spp`
--

INSERT INTO `tb_spp` (`id_spp`, `nisn`, `spp_januari`, `spp_februari`, `spp_maret`, `spp_april`, `spp_mei`, `spp_juni`, `spp_juli`, `spp_agustus`, `spp_september`, `spp_oktober`, `spp_november`, `spp_desember`, `tahun_ajaran`, `nominal`, `status`) VALUES
(1, '0100000001', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2021, 300000, 'Lunas'),
(2, '1000000002', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2021, 300000, 'Lunas'),
(4, '1000000003', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2021, 300000, 'Belum Lunas'),
(5, '1000000004', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2021, 300000, 'Lunas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_info`
--
ALTER TABLE `tb_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_class`);

--
-- Indeks untuk tabel `tb_login_siswa`
--
ALTER TABLE `tb_login_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indeks untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_petugas` (`id_petugas`,`nisn`,`id_spp`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_kelas` (`id_class`),
  ADD KEY `nis` (`nis`);

--
-- Indeks untuk tabel `tb_spp`
--
ALTER TABLE `tb_spp`
  ADD PRIMARY KEY (`id_spp`),
  ADD KEY `nisn` (`nisn`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_info`
--
ALTER TABLE `tb_info`
  MODIFY `info_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tb_spp`
--
ALTER TABLE `tb_spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_login_siswa`
--
ALTER TABLE `tb_login_siswa`
  ADD CONSTRAINT `tb_login_siswa_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `tb_siswa` (`nis`);

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD CONSTRAINT `tb_pembayaran_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `tb_siswa` (`nisn`),
  ADD CONSTRAINT `tb_pembayaran_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`),
  ADD CONSTRAINT `tb_pembayaran_ibfk_4` FOREIGN KEY (`id_spp`) REFERENCES `tb_spp` (`id_spp`);

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `tb_kelas` (`id_class`);

--
-- Ketidakleluasaan untuk tabel `tb_spp`
--
ALTER TABLE `tb_spp`
  ADD CONSTRAINT `tb_spp_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `tb_siswa` (`nisn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
