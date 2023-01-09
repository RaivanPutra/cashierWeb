-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2023 pada 07.44
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi-kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tgl_dibuat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `nama_kategori`, `tgl_dibuat`) VALUES
(3, 'Makanan', '2023-01-09 04:29:47'),
(5, 'Minuman', '2023-01-09 04:29:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `idcart` int(11) NOT NULL,
  `no_nota` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `idlaporan` int(11) NOT NULL,
  `no_nota` varchar(50) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `totalbeli` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tgl_sub` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`idlaporan`, `no_nota`, `idpelanggan`, `catatan`, `totalbeli`, `pembayaran`, `kembalian`, `tgl_sub`) VALUES
(20, 'AD91231214001', 0, '', 35000, 40000, 5000, '2023-01-09 05:14:30'),
(21, 'AD91231216401', 0, '', 15000, 15000, 0, '2023-01-09 05:17:08'),
(22, 'AD91231226641', 0, '', 10000, 12000, 2000, '2023-01-09 05:26:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `nama_toko` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `nama_toko`, `username`, `password`, `alamat`, `telepon`) VALUES
(1, 'PT.PINS', 'user', '$2y$10$tI4m1YtKdfMPgteUsoXLAuPVz5VUKt2Zf4nr6ACx.bNXMjmicmOoW', 'bandung', '0873737448');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telepon_pelanggan` varchar(15) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(8, 'Affan', '04980589083', 'Cianjur'),
(9, 'user', '0898927393', 'asdad');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `kode_produk`, `nama_produk`, `harga_modal`, `harga_jual`, `stock`, `tgl_input`) VALUES
(7, 3, 'BRG001', 'Nasi Goreng', 12000, 15000, 6, '2023-01-09 06:38:25'),
(8, 5, 'BRG002', 'Teh Tarik', 9000, 10000, 11, '2023-01-09 05:26:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nota`
--

CREATE TABLE `tb_nota` (
  `idnota` int(11) NOT NULL,
  `no_nota` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_nota`
--

INSERT INTO `tb_nota` (`idnota`, `no_nota`, `idproduk`, `quantity`) VALUES
(21, 'AD91231214001', 7, 1),
(22, 'AD91231214001', 8, 2),
(24, 'AD91231216401', 7, 1),
(25, 'AD91231226641', 8, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`idcart`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idlaporan`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`);

--
-- Indeks untuk tabel `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD PRIMARY KEY (`idnota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `idlaporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
