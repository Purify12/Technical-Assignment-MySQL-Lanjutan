-- MENAMPILKAN DATABASE --
SHOW DATABASES 

-- Membuat Database --
CREATE DATABASE skilvulbookstore

-- Use skilvul bookstore --
USE skilvulbookstore

-- Show Tables --
SHOW TABLES;

-- Create Tabel Penerbit --
CREATE TABLE `penerbit` (
  `id` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nama` VARCHAR(50) DEFAULT NULL,
  `kota` VARCHAR(50) DEFAULT NULL
);

-- Create Tabel Penulis --
CREATE TABLE `penulis` (
  `id` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nama` VARCHAR(50) DEFAULT NULL,
  `kota` VARCHAR(50) DEFAULT NULL
);

-- Create Tabel Buku --
CREATE TABLE `buku` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `isbn` VARCHAR(50) DEFAULT NULL,
  `judul` VARCHAR(50) DEFAULT NULL,
  `penulis` INT(10) DEFAULT NULL,
  `penerbit` INT(10) DEFAULT NULL,
  `harga` INT(10) DEFAULT NULL,
  `stock` INT(10) DEFAULT NULL,
--  Membuat Relasi --
  CONSTRAINT `penulis_penulis_id` FOREIGN KEY (`penulis`) REFERENCES `penulis`(`id`), 
  CONSTRAINT `penerbit_penerbit_id` FOREIGN KEY (`penerbit`) REFERENCES `penerbit`(`id`)
);

-- Input data ke tabel penulis --
INSERT INTO `penulis` (`nama`, `kota`)
VALUES	('Kencana A.', 'Tangerang'),
	('Ucok S.', 'Medan'),
	('Nono', 'Binjai'),
	('Bung Tono', 'Bogor');

-- Input data ke tabel penerbit --
INSERT INTO `penerbit` (`nama`, `kota`)
VALUES	('Company A', 'Yogyakarta'),
	('Company B', 'Pematang Siantar'),
	('Company C', 'Jakarta');
	
-- Input data ke tabel buku --
INSERT INTO buku (isbn, judul, penulis, penerbit, harga, stock)
VALUES	('101A-404-403-2', 'Si Cantik kembang Desa', 1, 2, 45000, 50),
	('303B-500-303-4', 'Tales of Begu Ganjang', 2, 2, 58000, 100),
	('202Z-305-101-1', 'Salam dari Binjai', 3, 3, 58000, 5),
	('404C-200-404-1', 'Mencari di Gelapnya Malam', 4, 1, 146000, 300);

-- INNER JOIN buku dengan penerbit --
SELECT * FROM buku
INNER JOIN penerbit ON buku.id = penerbit.id;

-- LEFT JOIN buku dengan penerbit --
SELECT buku.judul, buku.stock, penerbit.kota, penerbit.nama AS nama_penerbit FROM buku
LEFT JOIN penerbit ON buku.id = penerbit.id;

-- RIGHT JOIN buku dengan penerbit --
SELECT buku.judul, buku.harga, buku.stock, penerbit.nama AS penerbit FROM buku
RIGHT JOIN penerbit ON buku.id = penerbit.id;

-- Cek MAX harga buku dengan stok di bawah 10 --
SELECT MAX(harga) FROM buku
WHERE stock < 10;

-- Cek MIN harga buku --
SELECT MIN(harga) FROM buku;

-- COUNT data dengan harga buku di bawah 100000 --
SELECT COUNT(harga) FROM buku
WHERE harga < 100000;
