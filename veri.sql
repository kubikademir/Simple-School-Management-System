-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 01 Haz 2023, 17:52:10
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `myo_ders`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `lesson_name` text NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5 COLLATE=latin5_turkish_ci;

--
-- Tablo döküm verisi `lessons`
--

INSERT INTO `lessons` (`id`, `lesson_name`, `teacher_id`) VALUES
(1, 'ACM368', 2),
(2, 'ACM412', 3),
(3, 'HTR302', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `number` text NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5 COLLATE=latin5_turkish_ci;

--
-- Tablo döküm verisi `students`
--

INSERT INTO `students` (`id`, `number`, `name`) VALUES
(1, '1010', 'Kemal'),
(2, '1020', 'Ayşe'),
(3, '1030', 'Hüseyin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_taking_lasson`
--

CREATE TABLE `student_taking_lasson` (
  `students_id` int(11) NOT NULL,
  `lessons_id` int(11) NOT NULL,
  `vize_note` int(11) DEFAULT NULL,
  `final_note` int(11) DEFAULT NULL,
  `letter_note` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5 COLLATE=latin5_turkish_ci;

--
-- Tablo döküm verisi `student_taking_lasson`
--

INSERT INTO `student_taking_lasson` (`students_id`, `lessons_id`, `vize_note`, `final_note`, `letter_note`) VALUES
(1, 1, 50, NULL, NULL),
(2, 1, NULL, NULL, NULL),
(1, 2, 60, NULL, NULL),
(2, 2, 44, NULL, ''),
(3, 2, 28, 25, NULL),
(2, 3, 25, 5, NULL),
(3, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'isim',
  `username` varchar(20) NOT NULL COMMENT 'kullanci adi',
  `password` varchar(20) NOT NULL COMMENT 'sifre',
  `auth` tinyint(4) NOT NULL COMMENT 'yetki-> 0: yetkili 1: diger'
) ENGINE=InnoDB DEFAULT CHARSET=latin5 COLLATE=latin5_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `auth`) VALUES
(1, 'admin', 'admin', 'admin', 0),
(2, 'ACM368', 'user1', '111', 1),
(3, 'ACM412', 'user2', '222', 1),
(4, 'HTR302', 'user3', '333', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Tablo için indeksler `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `student_taking_lasson`
--
ALTER TABLE `student_taking_lasson`
  ADD KEY `students_id` (`students_id`),
  ADD KEY `lessons_id` (`lessons_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `student_taking_lasson`
--
ALTER TABLE `student_taking_lasson`
  ADD CONSTRAINT `student_taking_lasson_ibfk_1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_taking_lasson_ibfk_2` FOREIGN KEY (`lessons_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
