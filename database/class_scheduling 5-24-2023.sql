-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2023 at 06:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `class_scheduling`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_log`
--

CREATE TABLE `access_log` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_agent` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `access_log`
--

INSERT INTO `access_log` (`id`, `user_id`, `ip`, `user_agent`, `url`, `date`) VALUES
('645a76bebdebc', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/signatory.php', '2023-05-09 16:37:18'),
('645ca7e2e31e2', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-11 08:31:30'),
('645ca7ea48867', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-11 08:31:38'),
('645ca7f45f241', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-11 08:31:48'),
('645ca7fac7817', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-11 08:31:54'),
('645ca80155d45', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-11 08:32:01'),
('645ca8121a738', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-11 08:32:18'),
('645ca81a6765a', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/account.php', '2023-05-11 08:32:26'),
('645ca830340e8', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-11 08:32:48'),
('645ca85a7c07c', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-11 08:33:30'),
('645ca85a845c7', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-11 08:33:30'),
('645ca8601d55d', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/account.php', '2023-05-11 08:33:36'),
('645ca8c9d7c4e', '645ca85a7732d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0', '/class_scheduling/view/', '2023-05-11 08:35:21'),
('645ca8d034890', '645ca85a7732d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0', '/class_scheduling/view/college.php', '2023-05-11 08:35:28'),
('645ca8ed664bf', '645ca85a7732d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0', '/class_scheduling/view/faculties.php', '2023-05-11 08:35:57'),
('645ca8f1436de', '645ca85a7732d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0', '/class_scheduling/view/instructor_load.php?fac_id=', '2023-05-11 08:36:01'),
('645cb9616264b', '645ca85a7732d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0', '/class_scheduling/view/faculties.php', '2023-05-11 09:46:09'),
('645cb966b6170', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/account.php', '2023-05-11 09:46:14'),
('645cea249c172', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/account.php', '2023-05-11 13:14:12'),
('645dfcc264a6a', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-12 08:45:54'),
('645dfe1bb4fd9', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/college.php', '2023-05-12 08:51:39'),
('645e007fe3156', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/college.php', '2023-05-12 09:01:51'),
('645e00c4a884c', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:03:00'),
('645e013b4a17b', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:04:59'),
('645e03c66804b', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:15:50'),
('645e03cc0875b', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:15:56'),
('645e03d883256', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:16:08'),
('645e03e34b306', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:16:19'),
('645e050a9a893', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-12 09:21:14'),
('645e051066020', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/course.php', '2023-05-12 09:21:20'),
('645e0514689d5', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/prospectus.php?course_id=63', '2023-05-12 09:21:24'),
('645e051aa20d4', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/course.php', '2023-05-12 09:21:30'),
('645e05d341f2e', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-12 09:24:35'),
('645e05e0b5454', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/prospectus.php?course_id=63', '2023-05-12 09:24:48'),
('645e05e567828', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/schedules.php?course_id=637', '2023-05-12 09:24:53'),
('645e05e778f3a', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php?course_id=637', '2023-05-12 09:24:55'),
('645e05ea10312', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/rooms.php', '2023-05-12 09:24:58'),
('645e05edaf75f', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/room_schedule.php?room_id=1', '2023-05-12 09:25:01'),
('645e05f6a9aaf', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/prospectus.php?course_id=63', '2023-05-12 09:25:10'),
('645e085123c30', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/scheduling_area.php?coll_id', '2023-05-12 09:35:13'),
('645e086512153', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/prospectus.php?course_id=63', '2023-05-12 09:35:33'),
('645e086b2f19f', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/scheduling_area.php?coll_id', '2023-05-12 09:35:39'),
('645e17e3c2c45', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/scheduling_area.php?coll_id', '2023-05-12 10:41:39'),
('645ef852eba71', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-13 02:39:14'),
('645ef8595c3ad', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:39:21'),
('645ef8b6a2f68', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:40:54'),
('645ef8ca0863d', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:41:14'),
('645ef8ca105fe', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:41:14'),
('645ef8d7c626e', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:41:27'),
('645ef94b47377', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:43:23'),
('645ef94d554ba', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:43:25'),
('645ef9544f9f3', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:43:32'),
('645ef99a25e72', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:44:42'),
('645ef9afe2340', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:45:03'),
('645ef9b5151d8', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/signatory.php', '2023-05-13 02:45:09'),
('645ef9b857531', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/signatory.php', '2023-05-13 02:45:12'),
('645ef9bb43e96', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:45:15'),
('645ef9df7c98f', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:45:51'),
('645ef9e40fe21', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:45:56'),
('645efa1082164', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:46:40'),
('645efa2a2a445', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:47:06'),
('645efa3025457', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:47:12'),
('645efa3918b1a', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:47:21'),
('645efa3ce25c5', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:47:24'),
('645efa5b32040', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:47:55'),
('645efa905d437', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:48:48'),
('645efa96d25e9', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:48:54'),
('645efaa0919ed', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:49:04'),
('645efaaa6745d', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/staff.php', '2023-05-13 02:49:14'),
('6460470134764', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:27:13'),
('6460470430db2', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/history_log.php', '2023-05-14 02:27:16'),
('6460476ec697b', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/account.php', '2023-05-14 02:29:02'),
('6460478f1fed9', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:29:35'),
('64604795bf0e5', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/account.php', '2023-05-14 02:29:41'),
('646047970e1fa', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/history_log.php', '2023-05-14 02:29:43'),
('6460479b4cdc1', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/history_log.php', '2023-05-14 02:29:47'),
('64604849904e0', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:32:41'),
('6460484b7183f', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:32:43'),
('646048d9dd1c6', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:35:05'),
('6460493f5fd2c', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:36:47'),
('646049458745b', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:36:53'),
('646049bb0d3d0', '645a480ff3b03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-14 02:38:51'),
('646ba250803e2', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/', '2023-05-22 17:11:44'),
('646ba25411d7b', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/college.php', '2023-05-22 17:11:48'),
('646ba2568aa40', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/course.php', '2023-05-22 17:11:50'),
('646ba258dac04', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/designation.php', '2023-05-22 17:11:52'),
('646ba25b6d421', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/signatory.php', '2023-05-22 17:11:55'),
('646ba25de1fdf', '100303723284135936', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', '/class_scheduling/view/faculties.php', '2023-05-22 17:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Stud_id` varchar(40) NOT NULL,
  `date` varchar(40) NOT NULL,
  `time` varchar(40) NOT NULL,
  `transaction` text NOT NULL,
  `tansact_with` varchar(40) DEFAULT NULL,
  `contact` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `Stud_id` varchar(40) NOT NULL,
  `date` varchar(40) NOT NULL,
  `time_in` varchar(40) DEFAULT NULL,
  `temp_in` varchar(40) DEFAULT NULL,
  `time_out` varchar(40) DEFAULT NULL,
  `temp_out` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `coll_id` varchar(60) NOT NULL,
  `coll_code` varchar(40) DEFAULT NULL,
  `coll_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`coll_id`, `coll_code`, `coll_desc`) VALUES
('100042826267492352', 'CITE', 'College of Information Technology Education '),
('63719385c8ed2', 'CAS', 'College of Arts and Sciences'),
('6371958f88e11', 'CFT', 'College of Fisheries Technology'),
('6378defe53e04', 'CBM', 'College of Business and Management'),
('6425345fc7d11', 'CFAAS', 'College of Forestry, Agriculture and Aquatic Sciences'),
('6437a08ad2492', 'CTE', 'College of Teacher Education');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(40) NOT NULL,
  `coll_id` varchar(60) NOT NULL,
  `crs_code` varchar(40) DEFAULT NULL,
  `crs_desc` text DEFAULT NULL,
  `major` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `coll_id`, `crs_code`, `crs_desc`, `major`) VALUES
('637789eb86042', '100042826267492352', 'BSCS', 'Bachelor of Science in Computer Science', ''),
('6378e035e6c30', '6378defe53e04', 'BSBA-BE', 'Bachelor of Science in Business Administrator', 'Business Economics'),
('637987ed20f5d', '63719385c8ed2', 'BSES', 'Bachelor of Science in Environmental Science', ''),
('64006697b941c', '6425345fc7d11', 'BSFi', 'Bachelor of Science in Fishiries', ''),
('641b02ac75bdb', '6378defe53e04', 'BSBA-FM', 'Bachelor of Science in Business Administrator', 'Financial Management'),
('642534bc6259d', '6425345fc7d11', 'BSMB', 'Bachelor of Science in Marine Biology', ''),
('6437a0d6c3be3', '6437a08ad2492', 'BEED', 'Bachelor of Elementary Education', ''),
('6437a119c51d3', '6437a08ad2492', 'BSED-GS', 'Bachelor of Secondary Education', 'General Science'),
('6437b7e407993', '6378defe53e04', 'BSHM', 'Bachelor of Science in Hotel Management', '');

-- --------------------------------------------------------

--
-- Table structure for table `course_faculty`
--

CREATE TABLE `course_faculty` (
  `course_id` varchar(40) NOT NULL,
  `fac_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_faculty`
--

INSERT INTO `course_faculty` (`course_id`, `fac_id`) VALUES
('637789eb86042', '2023-0001'),
('637789eb86042', '2023-0002'),
('637789eb86042', '2023-0003'),
('637789eb86042', '2023-0004'),
('637789eb86042', '2023-0005'),
('637789eb86042', '2023-0007'),
('6378e035e6c30', '2023-0009'),
('6378e035e6c30', '2023-0011'),
('6378e035e6c30', '2023-0012'),
('6378e035e6c30', '2023-0013'),
('6378e035e6c30', '2023-0014'),
('6378e035e6c30', '2023-0015'),
('6378e035e6c30', '2023-0016'),
('6378e035e6c30', '2023-0020'),
('637987ed20f5d', '2023-0006'),
('637987ed20f5d', '2023-0010'),
('637987ed20f5d', '2023-0023'),
('64006697b941c', '2023-0021'),
('641b02ac75bdb', '2023-0017'),
('642534bc6259d', '2023-0022'),
('6437a0d6c3be3', '2023-0018'),
('6437a119c51d3', '2023-0019'),
('6437b7e407993', '2023-0024');

-- --------------------------------------------------------

--
-- Table structure for table `dean`
--

CREATE TABLE `dean` (
  `id` int(50) NOT NULL,
  `coll_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dean`
--

INSERT INTO `dean` (`id`, `coll_id`, `name`, `degree`) VALUES
(3, '6378defe53e04', '', ''),
(4, '6437a08ad2492', '', ''),
(5, '6371958f88e11', '', ''),
(6, '6425345fc7d11', '', ''),
(7, '63719385c8ed2', '', ''),
(8, '100042826267492352', 'BORN CHRISTIAN A. ISIP', 'DTE');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` varchar(50) NOT NULL,
  `designation_title` varchar(50) NOT NULL,
  `deloading` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `designation_title`, `deloading`) VALUES
('640434a9eb052', 'Department Chair', 6),
('640435b3a369d', 'Program Coordinator', 3),
('6404587d48c20', 'Extension', 3),
('6404589078e85', 'Research', 3);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fac_id` varchar(40) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `mname` varchar(100) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `sex` varchar(40) DEFAULT NULL,
  `marital_stat` varchar(40) DEFAULT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `vaccinated` varchar(40) DEFAULT NULL,
  `educ_qualification` varchar(50) NOT NULL,
  `qual_major` varchar(50) NOT NULL,
  `eligibility_prc` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fname`, `mname`, `lname`, `address`, `sex`, `marital_stat`, `contact`, `vaccinated`, `educ_qualification`, `qual_major`, `eligibility_prc`, `position`) VALUES
('2023-0001', 'Gene Boy', '', 'Pitos', 'Poblacion, Lianga, Surigao del Sur', 'male', 'married', '09506866597', 'true', 'MSCS', '', 'CSC', 'Instructor I'),
('2023-0002', 'Christine', 'Wagas', 'Pitos', 'Poblacion, Lianga, Surigao del Sur', 'female', 'married', '09665544321', 'true', 'MSCS', '', 'CSC', 'Instructor III'),
('2023-0003', 'Melizande', '', 'Uriarte', 'Diatagon SDS', 'female', 'married', '09345231123', 'true', '', '', '', 'Asst. Professor I'),
('2023-0004', 'Jename', '', 'Tadlip', 'Butuan City, ADS', 'female', 'single', '09988772341', 'true', '', '', '', 'Part-time'),
('2023-0005', 'Mantiza', '', 'Mantiza', 'Unknown', 'male', 'single', '09234231245', 'true', '', '', '', 'Instructor I'),
('2023-0006', 'Edrick Ray', '', 'Santamaria', 'Poblacion Lianga SDS', 'male', 'married', '09923657844', 'true', '', '', '', 'Instructor I'),
('2023-0007', 'Jobert', 'Salinas', 'Palacio', 'Lianga SDS', 'male', 'single', '09344123232', 'true', '', '', '', 'Instructor I'),
('2023-0009', '', '', 'Sanchez', 'Lianga SDS', 'male', 'single', '09324564321', 'true', '', '', '', 'Asst. Professor I'),
('2023-0010', 'AL', '', 'Encenzo', 'Lianga SDS', 'male', 'married', '09342565566', 'true', '', '', '', 'Instructor I'),
('2023-0011', 'Annie', '', '', 'Lianga SDS', 'female', 'single', '09342199333', 'true', '', '', '', 'Instructor II'),
('2023-0012', 'C', '', 'Balinton', 'Liangaa SDS', 'male', 'single', '09234323455', 'true', '', '', '', 'Instructor I'),
('2023-0013', 'KD', '', 'Jabagat', 'Lianga SDS', 'male', 'single', '09234354321', 'true', '', '', '', 'Instructor I'),
('2023-0014', 'Lolita', '', 'Martin', 'Lianga SDS', 'female', 'married', '09876765434', 'true', '', '', '', 'Asst. Professor I'),
('2023-0015', 'Liaflora', '', 'Orcullo', 'Lianga SDS', 'male', 'married', '09765666543', 'true', '', '', '', 'Asst. Professor I'),
('2023-0016', 'LM', '', 'Rodriquez', 'Lianga SDS', 'female', 'married', '09234412213', 'true', '', '', '', 'Instructor I'),
('2023-0017', 'Alex', '', 'Ajoc', '-', 'male', 'married', '09', 'true', 'BSC BSED', 'Management TLE', 'None', 'Instructor III'),
('2023-0018', 'Ermelyn', '', 'Bustillo', '-', 'female', 'married', '09', 'true', 'Bachelor of Elementary Education', '', 'LET', 'Instructor I'),
('2023-0019', 'Faith', '', 'Villanueva', '-', 'female', 'married', '09', 'true', 'BS', 'Physics', 'PBET/CSC Prof', 'Asst. Professor I'),
('2023-0020', 'Vilma', '', 'Pandi', '-', 'female', 'widowed', '09', 'true', 'BSC/CTP', 'Ecomomics', 'PBET/CSC Prof.', 'Instructor I'),
('2023-0021', 'Henrietta', '', 'Sanchez', '-', 'female', 'married', '09', 'true', 'BSF', 'Inland Fishiries', 'PBET/CS Sub-Prof.', 'Instructor III'),
('2023-0022', 'Amor', '', 'Salinas', '-', 'female', 'married', '09', 'true', 'BSMB', '', 'CSC Prof.', 'Asst. Professor I'),
('2023-0023', 'Edgar', '', 'Jose', '-', 'male', 'single', '09', 'true', '-', '', '-', 'Instructor I'),
('2023-0024', 'July', '', 'Salomon', '-', 'female', 'married', '09', 'true', '-', '-', '-', 'Instructor III'),
('32234234324', 'ewrtewrt', 'wertwerte', 'ewrtewrt', 'twretretre', 'male', 'single', '4423534534523523', 'true', 'ertewteret', 'sdfgdsfg', 'dsfgsdgf', 'Asst. Professor I');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_designation`
--

CREATE TABLE `faculty_designation` (
  `fac_id` varchar(50) NOT NULL,
  `designation_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_designation`
--

INSERT INTO `faculty_designation` (`fac_id`, `designation_id`) VALUES
('2023-0002', '640434a9eb052'),
('2023-0002', '640435b3a369d'),
('2023-0017', '640435b3a369d'),
('2023-0018', '640435b3a369d'),
('2023-0019', '640435b3a369d'),
('2023-0020', '640435b3a369d'),
('2023-0021', '640435b3a369d'),
('2023-0022', '640435b3a369d'),
('2023-0023', '640435b3a369d'),
('2023-0024', '640435b3a369d'),
('32234234324', '640435b3a369d'),
('32234234324', '6404587d48c20');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `Stud_id` varchar(40) NOT NULL,
  `filename` text DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `size` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `id` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_agent` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `ip`, `user_agent`, `status`, `date`) VALUES
('645ca7e2d8b7c', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-11 16:31:30'),
('645ca8c9cade2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0', 'success', '2023-05-11 16:35:21'),
('645dfcc258ff9', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-12 16:45:54'),
('645e05d33b300', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-12 17:24:35'),
('645ef852d95f4', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-13 10:39:14'),
('646047012822f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-14 10:27:13'),
('6460478f0ee92', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-14 10:29:35'),
('646048d9cd884', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-14 10:35:05'),
('646049a55188f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'failed', '2023-05-14 10:38:29'),
('646049ab66b95', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'failed', '2023-05-14 10:38:35'),
('646049b27b87a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'failed', '2023-05-14 10:38:42'),
('646049bb09e6a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-14 10:38:51'),
('646ba2506c5e3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb', 'success', '2023-05-23 01:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `offering_sem`
--

CREATE TABLE `offering_sem` (
  `program_code` varchar(50) NOT NULL,
  `subject_code` varchar(60) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `acad_year` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `fac_id` varchar(40) NOT NULL,
  `rm_id` int(40) DEFAULT NULL,
  `sched_time` varchar(40) DEFAULT NULL,
  `sched_day` varchar(40) NOT NULL,
  `type` varchar(50) NOT NULL,
  `format` varchar(50) NOT NULL,
  `load_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offering_sem`
--

INSERT INTO `offering_sem` (`program_code`, `subject_code`, `course_id`, `acad_year`, `year`, `sem`, `section`, `fac_id`, `rm_id`, `sched_time`, `sched_day`, `type`, `format`, `load_type`) VALUES
('CS110A', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '7:30AM-8:30AM', 'Mon', 'lec', 'format1', 'regular'),
('CS110A', 'CS 111', '637789eb86042', '2023-2024', 'first', 'first', 'A', '2023-0002', 3, '7:30AM-8:30AM', 'Mon', 'lec', 'format1', 'regular'),
('CS110A', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '7:30AM-8:30AM', 'Thu', 'lec', 'format1', 'regular'),
('CS110A', 'CS 111', '637789eb86042', '2023-2024', 'first', 'first', 'A', '2023-0002', 3, '7:30AM-8:30AM', 'Thu', 'lec', 'format1', 'regular'),
('CS110C', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0004', 3, '7:30AM-8:30AM', 'Fri', 'lec', 'format1', 'regular'),
('CS110C', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0004', 3, '7:30AM-8:30AM', 'Tue', 'lec', 'format1', 'regular'),
('CS111A', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 1, '7:30AM-9:00AM', 'Fri', 'lab', 'format1', 'regular'),
('CS111A', 'CS 111', '637789eb86042', '2023-2024', 'first', 'first', 'A', '2023-0002', 1, '7:30AM-9:00AM', 'Fri', 'lab', 'format1', 'regular'),
('CS111A', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 1, '7:30AM-9:00AM', 'Tue', 'lab', 'format1', 'regular'),
('CS111A', 'CS 111', '637789eb86042', '2023-2024', 'first', 'first', 'A', '2023-0002', 1, '7:30AM-9:00AM', 'Tue', 'lab', 'format1', 'regular'),
('CS111C', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0004', 3, '8:30AM-10:00AM', 'Fri', 'lab', 'format1', 'regular'),
('CS111C', 'CS 111', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0004', 3, '8:30AM-10:00AM', 'Tue', 'lab', 'format1', 'regular'),
('CS112A', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '10:30AM-11:30AM', 'Mon', 'lec', 'format1', 'regular'),
('CS112A', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '10:30AM-11:30AM', 'Thu', 'lec', 'format1', 'regular'),
('CS112C', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0004', 3, '10:00AM-11:00AM', 'Fri', 'lec', 'format1', 'regular'),
('CS112C', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0004', 3, '10:00AM-11:00AM', 'Tue', 'lec', 'format1', 'regular'),
('CS113A', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '7:30AM-10:30AM', 'Wed', 'lab', 'format1', 'regular'),
('CS113C', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0006', 3, '9:00AM-10:30AM', 'Mon', 'lab', 'format1', 'regular'),
('CS113C', 'CS 112', '637789eb86042', '2023-2024', 'first', 'first', 'C', '2023-0006', 3, '9:00AM-10:30AM', 'Mon', 'lab', 'format1', 'regular'),
('CS113C', 'CS 112', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0006', 3, '9:00AM-10:30AM', 'Thu', 'lab', 'format1', 'regular'),
('CS113C', 'CS 112', '637789eb86042', '2023-2024', 'first', 'first', 'C', '2023-0006', 3, '9:00AM-10:30AM', 'Thu', 'lab', 'format1', 'regular'),
('CS114A', 'GE-MMW', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '1:00PM-2:30PM', 'Mon', 'lec', 'format1', 'regular'),
('CS114A', 'GE-MMW', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '1:00PM-2:30PM', 'Thu', 'lec', 'format1', 'regular'),
('CS114C', 'GE-MMW', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '2:30PM-4:00PM', 'Mon', 'lec', 'format1', 'over'),
('CS114C', 'GE-MMW', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '2:30PM-4:00PM', 'Thu', 'lec', 'format1', 'over'),
('CS115A', 'GE-PC', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '1:00PM-2:30PM', 'Fri', 'lec', 'format1', 'regular'),
('CS115A', 'GE-PC', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0002', 3, '1:00PM-2:30PM', 'Tue', 'lec', 'format1', 'regular'),
('CS115C', 'GE-PC', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '2:30PM-4:00PM', 'Fri', 'lec', 'format1', 'over'),
('CS115C', 'GE-PC', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '2:30PM-4:00PM', 'Tue', 'lec', 'format1', 'over'),
('CS116A', 'GE-US', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0001', 1, '8:30AM-10:00AM', 'Mon', 'lec', 'format1', 'regular'),
('CS116A', 'GE-US', '637789eb86042', '2022-2023', 'first', 'first', 'A', '2023-0001', 1, '8:30AM-10:00AM', 'Thu', 'lec', 'format1', 'regular'),
('CS116C', 'GE-US', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '2:30PM-5:30PM', 'Wed', 'lec', 'format1', 'over'),
('CS117C', 'IT 1', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '4:00PM-5:30PM', 'Mon', 'lec', 'format1', 'emergency'),
('CS117C', 'IT 1', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0002', 1, '4:00PM-5:30PM', 'Thu', 'lec', 'format1', 'emergency'),
('CS118C', 'NSTP 1', '637789eb86042', '2022-2023', 'first', 'first', 'C', '2023-0006', 3, '1:00PM-4:00PM', 'Sat', 'lec', 'format1', 'merge'),
('CS118C', 'NSTP 1', '637789eb86042', '2023-2024', 'first', 'first', 'C', '2023-0006', 3, '1:00PM-4:00PM', 'Sat', 'lec', 'format1', 'merge');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` varchar(50) NOT NULL,
  `position_title` varchar(50) NOT NULL,
  `min_load` int(50) NOT NULL,
  `max_load` int(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_title`, `min_load`, `max_load`, `status`) VALUES
('100209270745726976', 'Instructor I', 21, 33, 'permanent'),
('64040b42412e0', 'Instructor II', 21, 33, 'permanent'),
('64040ec667792', 'Instructor III', 21, 33, 'permanent'),
('640d410488e91', 'Instructor IV', 21, 33, 'permanent'),
('640d41796fceb', 'Instructor V', 21, 33, 'permanent'),
('640d41b31d9cd', 'Asst. Professor I', 21, 33, 'permanent'),
('640d4266bfd14', 'Asst. Professor II', 21, 33, 'permanent'),
('640d4280b453b', 'Asst. Professor III', 21, 33, 'permanent'),
('640d428f5539a', 'Asst. Professor IV', 21, 33, 'permanent'),
('640d429b2581b', 'Asst. Professor V', 21, 33, 'permanent'),
('640d42c722115', 'Professor I', 21, 33, 'permanent'),
('640d42d53d005', 'Professor II', 21, 33, 'permanent'),
('640d42e0bbada', 'Professor III', 21, 33, 'permanent'),
('640d42ecbb02b', 'Professor IV', 21, 33, 'permanent'),
('640d4317f2d26', 'Contractual', 15, 33, 'contructual'),
('640d4333dcdcf', 'Part-time', 3, 9, 'part-time');

-- --------------------------------------------------------

--
-- Table structure for table `prospectus`
--

CREATE TABLE `prospectus` (
  `revision_year` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prospectus`
--

INSERT INTO `prospectus` (`revision_year`, `course_id`) VALUES
('2017-2018', '6437b7e407993'),
('2018-2019', '6378e035e6c30'),
('2018-2019', '64006697b941c'),
('2018-2019', '641b02ac75bdb'),
('2018-2019', '6437a119c51d3'),
('2019-2020', '637987ed20f5d'),
('2020-2021', '637789eb86042'),
('2022-2023', '637789eb86042'),
('2022-2023', '6437a0d6c3be3');

-- --------------------------------------------------------

--
-- Table structure for table `prospectus_detail`
--

CREATE TABLE `prospectus_detail` (
  `course_id` varchar(40) NOT NULL,
  `revision_year` varchar(40) NOT NULL,
  `subject_code` varchar(60) NOT NULL,
  `year` varchar(40) NOT NULL,
  `sem` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prospectus_detail`
--

INSERT INTO `prospectus_detail` (`course_id`, `revision_year`, `subject_code`, `year`, `sem`) VALUES
('637789eb86042', '2022-2023', 'CS 111', 'first', 'first'),
('637789eb86042', '2022-2023', 'CS 112', 'first', 'first'),
('637789eb86042', '2022-2023', 'CS 121', 'first', 'second'),
('637789eb86042', '2022-2023', 'CS 122', 'first', 'second'),
('637789eb86042', '2022-2023', 'CS 123', 'first', 'second'),
('637789eb86042', '2022-2023', 'CS 211', 'second', 'first'),
('637789eb86042', '2022-2023', 'CS 212', 'second', 'first'),
('637789eb86042', '2022-2023', 'CS 213', 'second', 'first'),
('637789eb86042', '2022-2023', 'CS 214', 'second', 'first'),
('637789eb86042', '2022-2023', 'CS 221', 'second', 'second'),
('637789eb86042', '2022-2023', 'CS 222', 'second', 'second'),
('637789eb86042', '2022-2023', 'CS 223', 'second', 'second'),
('637789eb86042', '2022-2023', 'CS 311', 'third', 'first'),
('637789eb86042', '2022-2023', 'CS 312', 'third', 'first'),
('637789eb86042', '2022-2023', 'CS 313', 'third', 'first'),
('637789eb86042', '2022-2023', 'CS 314', 'third', 'first'),
('637789eb86042', '2022-2023', 'CS 315', 'third', 'first'),
('637789eb86042', '2022-2023', 'CS 316', 'third', 'first'),
('637789eb86042', '2022-2023', 'CS 321', 'third', 'second'),
('637789eb86042', '2022-2023', 'CS 322', 'third', 'second'),
('637789eb86042', '2022-2023', 'CS 323', 'third', 'second'),
('637789eb86042', '2022-2023', 'CS 324', 'third', 'second'),
('637789eb86042', '2022-2023', 'CS 325', 'third', 'second'),
('637789eb86042', '2022-2023', 'CS 326', 'third', 'second'),
('637789eb86042', '2022-2023', 'CS 331', 'third', 'summer'),
('637789eb86042', '2022-2023', 'CS 411', 'fourth', 'first'),
('637789eb86042', '2022-2023', 'CS 412', 'fourth', 'first'),
('637789eb86042', '2022-2023', 'CS 413', 'fourth', 'first'),
('637789eb86042', '2022-2023', 'CS 414', 'fourth', 'first'),
('637789eb86042', '2022-2023', 'CS 415', 'fourth', 'first'),
('637789eb86042', '2022-2023', 'CS 416', 'fourth', 'first'),
('637789eb86042', '2022-2023', 'CS 421', 'fourth', 'second'),
('637789eb86042', '2022-2023', 'CS 422', 'fourth', 'second'),
('637789eb86042', '2022-2023', 'Ecos 1', 'second', 'second'),
('637789eb86042', '2022-2023', 'Entrep 1', 'second', 'first'),
('637789eb86042', '2022-2023', 'GE-AA', 'second', 'first'),
('637789eb86042', '2022-2023', 'GE-BC', 'first', 'second'),
('637789eb86042', '2022-2023', 'GE-CW', 'first', 'second'),
('637789eb86042', '2022-2023', 'GE-E', 'first', 'second'),
('637789eb86042', '2022-2023', 'GE-MMW', 'first', 'first'),
('637789eb86042', '2022-2023', 'GE-PC', 'first', 'first'),
('637789eb86042', '2022-2023', 'GE-RPH', 'second', 'second'),
('637789eb86042', '2022-2023', 'GE-STS', 'first', 'second'),
('637789eb86042', '2022-2023', 'GE-US', 'first', 'first'),
('637789eb86042', '2022-2023', 'IT 1', 'first', 'first'),
('637789eb86042', '2022-2023', 'Math-Elec', 'second', 'second'),
('637789eb86042', '2022-2023', 'NSTP 1', 'first', 'first'),
('637789eb86042', '2022-2023', 'NSTP 2', 'first', 'second'),
('637789eb86042', '2022-2023', 'PE 1', 'first', 'first'),
('637789eb86042', '2022-2023', 'PE 2', 'first', 'second'),
('637789eb86042', '2022-2023', 'PE 3', 'second', 'first'),
('637789eb86042', '2022-2023', 'PE 4', 'second', 'second'),
('637789eb86042', '2022-2023', 'Rizal', 'third', 'first'),
('6378e035e6c30', '2018-2019', 'GE-US', 'first', 'first'),
('637987ed20f5d', '2019-2020', 'Chem1', 'first', 'first'),
('637987ed20f5d', '2019-2020', 'Math1', 'first', 'first'),
('64006697b941c', '2018-2019', 'GE-RPH', 'first', 'first'),
('64006697b941c', '2018-2019', 'GE-US', 'first', 'first'),
('641b02ac75bdb', '2018-2019', 'fm1', 'first', 'first'),
('6437a0d6c3be3', '2022-2023', 'GE-US', 'first', 'first'),
('6437a119c51d3', '2018-2019', 'GE-US', 'first', 'first'),
('6437b7e407993', '2017-2018', 'ge-pc', 'first', 'first');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `rm_id` int(11) NOT NULL,
  `building` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`rm_id`, `building`, `type`, `status`) VALUES
(1, 'CL1', 'lab', 'usable'),
(2, 'CL2', 'lab', 'usable'),
(3, 'CL3', 'lab', 'usable'),
(4, 'IL1', 'lab', 'usable'),
(5, 'IL2', 'lab', 'usable'),
(6, 'IL3', 'lab', 'usable'),
(7, 'Room 130', 'lec', 'usable'),
(8, 'Room 128', 'lec', 'usable'),
(9, 'Chem.Lab', 'lab', 'usable'),
(10, 'Auditorium', 'lec', 'usable'),
(11, 'Room 207', 'lec', 'usable'),
(12, 'Room 209', 'lec', 'usable'),
(13, 'Room 129', 'lec', 'usable'),
(210, 'Academic Building', 'lec', 'usable');

-- --------------------------------------------------------

--
-- Table structure for table `signatory`
--

CREATE TABLE `signatory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signatory`
--

INSERT INTO `signatory` (`id`, `name`, `degree`, `designation`) VALUES
(3, 'CYNTHIA P. SAJOT', 'Ph.D.', 'Campus Director'),
(4, 'FAITH  P. VILLANUEVA', 'Ph.D. (CAR)', 'Asst. Campus Director'),
(7, 'MARIA LADY SOL A. SUAZO', 'Ph.D.', 'Vice President for Academic Affairs'),
(8, 'NEMESIO G. LOAYON', 'Ph.D.', 'SUC President III');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Stud_id` varchar(40) NOT NULL,
  `fname` varchar(60) DEFAULT NULL,
  `mname` varchar(60) DEFAULT NULL,
  `lname` varchar(60) DEFAULT NULL,
  `ext_name` varchar(40) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Marital_stat` varchar(100) DEFAULT NULL,
  `cntact_no` varchar(40) DEFAULT NULL,
  `dbirth` varchar(40) DEFAULT NULL,
  `pbirth` varchar(254) DEFAULT NULL,
  `sex` varchar(40) DEFAULT NULL,
  `parents` varchar(150) DEFAULT NULL,
  `type_student` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `vaccinated` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Stud_id`, `fname`, `mname`, `lname`, `ext_name`, `Address`, `Marital_stat`, `cntact_no`, `dbirth`, `pbirth`, `sex`, `parents`, `type_student`, `status`, `remarks`, `vaccinated`) VALUES
('2018-04091', 'Richard', NULL, 'Divino', NULL, 'P-6 Kauswagan, Bahi, Barobo, Surigao del Sue', 'sigle', '09506866597', 'October 26, 1999', 'Mabuhay, Bayugan City', 'Male', 'Pilarcita Divino', 'old', NULL, NULL, 'yes'),
('2023-00001', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00002', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00003', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00004', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00005', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00006', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00007', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00008', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00009', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00010', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00011', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00012', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00013', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00014', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00015', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00016', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00017', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00018', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00019', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00020', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00021', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00022', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00023', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00024', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00025', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00026', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00027', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00028', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00029', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00030', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00031', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00032', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00033', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00034', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00035', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00036', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00037', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00038', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00039', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00040', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00041', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00042', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00043', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00044', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00045', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00046', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00047', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00048', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00049', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00050', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00051', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00052', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00053', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00054', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00055', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00056', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00057', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00058', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00059', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00060', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00061', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00062', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00063', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00064', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00065', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00066', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00067', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00068', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00069', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00070', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00071', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00072', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00073', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00074', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00075', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00076', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00077', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00078', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00079', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00080', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00081', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00082', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00083', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00084', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00085', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00086', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00087', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00088', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00089', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00090', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00091', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00092', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00093', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00094', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00095', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00096', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00097', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00098', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00099', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes'),
('2023-00100', 'Joy', 'De la', 'Cruz', 'Jr.', 'P-2 Poblacion, Lianga, SDS', 'single', '9506866597', 'November 12, 19999', 'B utuan City', 'male', 'Joe De la Cruz', 'old', '', '', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `students_enrolled_course`
--

CREATE TABLE `students_enrolled_course` (
  `Stud_id` varchar(40) NOT NULL,
  `year` varchar(40) NOT NULL,
  `sem` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `s_year` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students_enrolled_course`
--

INSERT INTO `students_enrolled_course` (`Stud_id`, `year`, `sem`, `course_id`, `s_year`) VALUES
('2018-04091', 'third', 'first', '637789eb86042', '2022-2023'),
('2023-00001', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00001', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00002', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00002', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00003', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00003', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00004', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00004', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00005', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00005', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00006', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00006', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00007', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00007', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00008', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00008', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00009', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00009', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00010', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00010', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00011', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00011', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00012', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00012', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00013', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00013', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00014', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00014', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00015', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00015', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00016', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00016', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00017', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00017', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00018', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00018', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00019', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00019', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00020', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00020', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00021', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00021', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00022', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00022', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00023', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00023', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00024', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00024', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00025', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00025', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00026', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00026', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00027', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00027', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00028', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00028', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00029', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00029', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00030', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00030', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00031', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00031', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00032', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00032', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00033', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00033', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00034', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00034', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00035', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00035', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00036', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00036', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00037', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00037', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00038', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00038', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00039', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00039', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00040', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00040', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00041', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00041', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00042', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00042', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00043', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00043', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00044', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00044', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00045', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00045', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00046', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00046', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00047', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00047', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00048', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00048', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00049', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00049', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00050', 'first', 'first', '637789eb86042', '2022-2023'),
('2023-00050', 'first', 'second', '637789eb86042', '2022-2023'),
('2023-00051', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00051', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00052', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00052', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00053', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00053', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00054', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00054', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00055', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00055', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00056', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00056', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00057', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00057', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00058', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00058', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00059', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00059', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00060', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00060', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00061', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00061', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00062', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00062', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00063', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00063', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00064', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00064', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00065', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00065', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00066', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00066', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00067', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00067', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00068', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00068', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00069', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00069', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00070', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00070', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00071', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00071', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00072', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00072', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00073', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00073', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00074', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00074', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00075', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00075', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00076', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00076', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00077', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00077', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00078', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00078', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00079', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00079', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00080', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00080', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00081', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00081', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00082', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00082', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00083', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00083', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00084', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00084', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00085', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00085', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00086', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00086', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00087', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00087', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00088', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00088', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00089', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00089', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00090', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00090', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00091', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00091', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00092', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00092', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00093', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00093', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00094', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00094', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00095', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00095', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00096', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00096', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00097', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00097', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00098', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00098', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00099', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00099', 'second', 'second', '637789eb86042', '2022-2023'),
('2023-00100', 'second', 'first', '637789eb86042', '2022-2023'),
('2023-00100', 'second', 'second', '637789eb86042', '2022-2023');

-- --------------------------------------------------------

--
-- Table structure for table `stud_enrolled_subject`
--

CREATE TABLE `stud_enrolled_subject` (
  `Stud_id` varchar(40) NOT NULL,
  `subject_code` varchar(60) NOT NULL,
  `s_year` varchar(40) NOT NULL,
  `sem` varchar(40) NOT NULL,
  `section` varchar(50) NOT NULL,
  `grade` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stud_enrolled_subject`
--

INSERT INTO `stud_enrolled_subject` (`Stud_id`, `subject_code`, `s_year`, `sem`, `section`, `grade`) VALUES
('2018-04091', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2018-04091', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2018-04091', 'CS 311', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00001', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00001', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00002', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00002', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00003', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00003', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00004', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00004', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00005', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00005', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00006', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00006', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00007', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00007', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00008', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00008', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00009', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00009', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00010', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00010', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00011', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00011', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00012', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00012', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00013', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00013', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00014', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00014', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00015', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00015', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00016', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00016', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00017', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00017', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00018', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00018', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00019', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00019', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00020', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00020', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00021', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00021', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00022', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00022', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00023', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00023', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00024', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00024', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'CS 111', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'CS 112', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'CS 121', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'CS 122', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'CS 123', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'GE-BC', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'GE-CW', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'GE-E', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'GE-MMW', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'GE-PC', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'GE-STS', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'GE-US', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'IT 1', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'NSTP 1', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'NSTP 2', '2022-2023', 'second', 'A', NULL),
('2023-00025', 'PE 1', '2022-2023', 'first', 'A', NULL),
('2023-00025', 'PE 2', '2022-2023', 'second', 'A', NULL),
('2023-00026', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00026', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00026', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00027', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00027', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00028', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00028', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00029', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00029', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00030', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00030', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00031', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00031', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00032', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00032', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00033', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00033', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00034', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00034', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00035', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00035', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00036', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00036', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00037', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00037', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00038', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00038', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00039', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00039', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00040', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00040', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00041', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00041', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00042', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00042', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00043', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00043', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00044', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00044', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00045', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00045', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00046', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00046', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00047', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00047', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00048', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00048', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00049', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00049', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'CS 111', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'CS 112', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'CS 121', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'CS 122', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'CS 123', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'GE-BC', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'GE-CW', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'GE-E', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'GE-MMW', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'GE-PC', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'GE-STS', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'GE-US', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'IT 1', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'NSTP 1', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'NSTP 2', '2022-2023', 'second', 'B', NULL),
('2023-00050', 'PE 1', '2022-2023', 'first', 'B', NULL),
('2023-00050', 'PE 2', '2022-2023', 'second', 'B', NULL),
('2023-00051', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00051', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00051', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00051', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00051', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00051', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00051', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00051', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00052', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00052', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00052', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00052', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00052', 'GE-AA', '2022-2023', 'first', 'A', NULL);
INSERT INTO `stud_enrolled_subject` (`Stud_id`, `subject_code`, `s_year`, `sem`, `section`, `grade`) VALUES
('2023-00052', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00052', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00052', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00053', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00053', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00054', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00054', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00055', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00055', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00056', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00056', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00057', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00057', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00058', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00058', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00059', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00059', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00060', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00060', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00061', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00061', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00062', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00062', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00063', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00063', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00064', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00064', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00065', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00065', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00066', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00066', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00067', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00067', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00068', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00068', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00069', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00069', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00070', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00070', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00071', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00071', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00072', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00072', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00073', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00073', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00074', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00074', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'CS 211', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'CS 212', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'CS 213', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'CS 214', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'CS 221', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'CS 222', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'CS 223', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'Ecos 1', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'Entrep 1', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'GE-AA', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'GE-RPH', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'Math-Elec', '2022-2023', 'second', 'A', NULL),
('2023-00075', 'PE 3', '2022-2023', 'first', 'A', NULL),
('2023-00075', 'PE 4', '2022-2023', 'second', 'A', NULL),
('2023-00076', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00076', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00076', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00076', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00076', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00076', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00076', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00076', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00077', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00077', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00078', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00078', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00079', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00079', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00080', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00080', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00081', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00081', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00082', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00082', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00083', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00083', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00084', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00084', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00085', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00085', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00086', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00086', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00087', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00087', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00088', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00088', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00089', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00089', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00090', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00090', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00091', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00091', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00092', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00092', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00093', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00093', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00094', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00094', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00095', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00095', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00096', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00096', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00097', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00097', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00098', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00098', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00099', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00099', 'PE 4', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'CS 211', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'CS 212', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'CS 213', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'CS 214', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'CS 221', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'CS 222', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'CS 223', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'Ecos 1', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'Entrep 1', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'GE-AA', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'GE-RPH', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'Math-Elec', '2022-2023', 'second', 'B', NULL),
('2023-00100', 'PE 3', '2022-2023', 'first', 'B', NULL),
('2023-00100', 'PE 4', '2022-2023', 'second', 'B', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_code` varchar(60) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `title` text DEFAULT NULL,
  `lec_hr` varchar(40) DEFAULT NULL,
  `lab_hr` varchar(40) DEFAULT NULL,
  `units` varchar(40) DEFAULT NULL,
  `pre_requisites` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_code`, `course_id`, `title`, `lec_hr`, `lab_hr`, `units`, `pre_requisites`) VALUES
('Chem1', '637987ed20f5d', 'Organic Chemistry', '3', '2', '5', ''),
('CS 111', '637789eb86042', 'Introduction to Computing', '2', '1', '3', ''),
('CS 112', '637789eb86042', 'Fundamentals of Programming - C++', '2', '1', '3', ''),
('CS 121', '637789eb86042', 'Discrete Structures 1', '3', '0', '3', 'CS 112'),
('CS 122', '637789eb86042', 'Intermediate Programming - Java Prog.', '2', '1', '3', 'CS 112'),
('CS 123', '637789eb86042', 'Multimedia Systems', '2', '1', '3', 'CS 112'),
('CS 211', '637789eb86042', 'Discrete Structure 2', '3', '0', '3', 'CS 121'),
('CS 212', '637789eb86042', 'Object-Oriented Programming - VB .Net', '2', '1', '3', 'CS 122'),
('CS 213', '637789eb86042', 'Data Structures and Algorithms', '2', '1', '3', 'CS 122'),
('CS 214', '637789eb86042', 'Embedded Systems', '2', '1', '3', 'CS 122'),
('CS 221', '637789eb86042', 'Algorithms and Complexity', '3', '0', '3', 'CS 213'),
('CS 222', '637789eb86042', 'Information Management', '2', '1', '3', 'CS 212'),
('CS 223', '637789eb86042', 'Web Systems and Technologies 1', '2', '1', '3', 'CS 212'),
('CS 311', '637789eb86042', 'Automata Theory and Formal Languages', '3', '0', '3', 'CS 221'),
('CS 312', '637789eb86042', 'Architecture and Organization', '3', '0', '3', 'CS 221'),
('CS 313', '637789eb86042', 'Information Assurance and Security', '3', '0', '3', 'CS 222'),
('CS 314', '637789eb86042', 'System Fundamentals - Elective 1', '2', '1', '3', 'CS 222'),
('CS 315', '637789eb86042', 'Application Devt & Emerging Technologies', '2', '1', '3', 'CS 222'),
('CS 316', '637789eb86042', 'Web Systems and Technologies 2', '2', '1', '3', 'CS 223'),
('CS 321', '637789eb86042', 'Programming Languages', '2', '1', '3', 'CS 312'),
('CS 322', '637789eb86042', 'Software Engineering 1', '2', '1', '3', 'CS 312'),
('CS 323', '637789eb86042', 'Social Issues and Professional Practice 1', '3', '0', '3', 'CS 313'),
('CS 324', '637789eb86042', 'Graphics and Visual Computing - Elective 2', '2', '1', '3', 'CS 316'),
('CS 325', '637789eb86042', 'Mobile Computing 1', '2', '1', '3', 'CS 315'),
('CS 326', '637789eb86042', 'Modeling and Simulation', '2', '1', '3', 'CS 314'),
('CS 331', '637789eb86042', 'Practicum (162 hours)', '3', '0', '3', '3rd yr.'),
('CS 411', '637789eb86042', 'Human Computer Interaction', '3', '0', '3', 'CS 323'),
('CS 412', '637789eb86042', 'Operating Systems', '2', '1', '3', 'CS 321'),
('CS 413', '637789eb86042', 'Software Engineering 2', '2', '1', '3', 'CS 322'),
('CS 414', '637789eb86042', 'CS Thesis Writing 1', '3', '0', '3', '4TH YR'),
('CS 415', '637789eb86042', 'Intelligent Systems - Elective 3', '2', '1', '3', 'CS 326'),
('CS 416', '637789eb86042', 'Mobile Computing 2', '2', '1', '3', 'CS 325'),
('CS 421', '637789eb86042', 'Networks and Communications', '2', '1', '3', 'CS 412'),
('CS 422', '637789eb86042', 'CS Thesis Writing 2', '3', '0', '3', 'CS 414'),
('Ecos 1', '637789eb86042', 'People and The Earth(s) Ecosystem', '3', '0', '3', ''),
('Entrep 1', '637789eb86042', 'The Entrepreneurial Mind', '3', '0', '3', ''),
('fm1', '641b02ac75bdb', 'financial mamangement ', '3', '0', '3', 'fin1'),
('GE-AA', '637789eb86042', 'Art Appreciation', '3', '0', '3', ''),
('GE-BC', '637789eb86042', 'Business Correspondence', '3', '0', '3', ''),
('GE-CW', '637789eb86042', 'The Contemporary World', '3', '0', '3', ''),
('GE-E', '637789eb86042', 'Ethics', '3', '0', '3', ''),
('GE-MMW', '637789eb86042', 'Mathematics in the Modern World', '3', '0', '3', ''),
('GE-PC', '637789eb86042', 'Purposive Communication', '3', '0', '3', ''),
('GE-RPH', '637789eb86042', 'Reading in Philippine History', '3', '0', '3', ''),
('GE-STS', '637789eb86042', 'Science, Technology and Society', '3', '0', '3', ''),
('GE-US', '637789eb86042', 'Understanding the Self', '3', '0', '3', ''),
('Gefsadfa', '6437b7e407993', 'adafdsfd', '3', '0', '3', ''),
('IT 1', '637789eb86042', 'Living in the IT Era', '3', '0', '3', ''),
('Math-Elec', '637789eb86042', 'Theory of Computation', '3', '0', '3', 'Math 1'),
('Math1', '637987ed20f5d', 'Algebra', '3', '0', '3', ''),
('NSTP 1', '637789eb86042', 'National Service Training Program 1', '3', '0', '3', ''),
('NSTP 2', '637789eb86042', 'National Service Training Program 2', '3', '0', '3', 'NSTP 1'),
('PE 1', '637789eb86042', 'Physical Fitness & Health', '2', '0', '2', ''),
('PE 2', '637789eb86042', 'Rhythmic Activities', '2', '0', '2', 'PE 1'),
('PE 3', '637789eb86042', 'Individual and Dual Sports', '2', '0', '2', 'PE 2'),
('PE 4', '637789eb86042', 'Recreational and Team Sports', '2', '0', '3', 'PE 3'),
('Rizal', '637789eb86042', 'Life and Works of Rizal', '3', '0', '3', ''),
('xzcv', '6378e035e6c30', 'zc', '1', '2', '2', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `ext` varchar(20) NOT NULL,
  `fac_id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `mname`, `lname`, `ext`, `fac_id`, `username`, `password`, `user_type`) VALUES
('100303723284135936', 'Administrator', '', '', '', '', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
('645a426a4317e', 'Jelrick', '', 'Capablanca', '', '', 'jelrickca384', '5f9cbb41cbe9b4d90c8eec6503afff63', 'staff'),
('645a480ff3b03', 'Christine', 'Wagas', 'Pitos', '', '2023-0002', 'christinepi446', '73b46ce287121185374ec7e1d35f48c0', 'Program coordinator'),
('645a4839452a4', 'Vilma', '', 'Pandi', '', '2023-0020', 'vilmapa847', 'd334cfd1e77ce625d96ed216247c988d', 'Program coordinator'),
('645a484509465', 'Edgar', '', 'Jose', '', '2023-0023', 'edgarjo470', '40f828aeb3bcd41a94bf26e7e6a0d3d7', 'Program coordinator'),
('645a487118f3d', 'Henrietta', '', 'Sanchez', '', '2023-0021', 'henriettasa171', '9b5062d83e49846ecd4cb1c0c1fa3cb9', 'Program coordinator'),
('645a487ecfec9', 'Amor', '', 'Salinas', '', '2023-0022', 'amorsa519', 'b1d83edd7290d8dbd6e9bebbd256a521', 'Program coordinator'),
('645a48a4af688', 'Alex', '', 'Ajoc', '', '2023-0017', 'alexaj355', '3ed7d5c1e08d4f2831f1c0d7b3f558fd', 'Program coordinator'),
('645a48ba16453', 'Ermelyn', '', 'Bustillo', '', '2023-0018', 'ermelynbu184', 'b056b4ba462475d60ae53d854796a33c', 'Program coordinator'),
('645a48bfb447d', 'Faith', '', 'Villanueva', '', '2023-0019', 'faithvi330', '62a27ee3fce0b27fb11db9a5b198e19a', 'Program coordinator'),
('645a48c4d66f5', 'July', '', 'Salomon', '', '2023-0024', 'julysa430', '9712daa21773fec335c7e3b890cc61d6', 'Program coordinator'),
('645ca85a7732d', 'Gene Boy', 'Juanito', 'Pitos', 'II', '', 'genebo577', 'ac595b61fdfa8a58858ffdbf03c29b0e', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_log`
--
ALTER TABLE `access_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Stud_id`,`date`,`time`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`Stud_id`,`date`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`coll_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `college_course` (`coll_id`);

--
-- Indexes for table `course_faculty`
--
ALTER TABLE `course_faculty`
  ADD PRIMARY KEY (`course_id`,`fac_id`),
  ADD KEY `faculty_course_faculty` (`fac_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `dean`
--
ALTER TABLE `dean`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coll_id` (`coll_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `faculty_designation`
--
ALTER TABLE `faculty_designation`
  ADD PRIMARY KEY (`designation_id`,`fac_id`) USING BTREE,
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `designation_id` (`designation_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`Stud_id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offering_sem`
--
ALTER TABLE `offering_sem`
  ADD PRIMARY KEY (`program_code`,`subject_code`,`section`,`year`,`sem`,`course_id`,`sched_day`,`acad_year`) USING BTREE,
  ADD KEY `faculty_offering_sem` (`fac_id`),
  ADD KEY `rm_id` (`rm_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `prospectus`
--
ALTER TABLE `prospectus`
  ADD PRIMARY KEY (`revision_year`,`course_id`),
  ADD KEY `course_Prospectus` (`course_id`);

--
-- Indexes for table `prospectus_detail`
--
ALTER TABLE `prospectus_detail`
  ADD PRIMARY KEY (`course_id`,`revision_year`,`subject_code`,`year`,`sem`),
  ADD KEY `subject_prospectus_detail` (`subject_code`),
  ADD KEY `Prospectus_prospectus_detail` (`revision_year`,`course_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`rm_id`);

--
-- Indexes for table `signatory`
--
ALTER TABLE `signatory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Stud_id`);

--
-- Indexes for table `students_enrolled_course`
--
ALTER TABLE `students_enrolled_course`
  ADD PRIMARY KEY (`Stud_id`,`sem`,`s_year`) USING BTREE,
  ADD KEY `course_Students_enrolled_course` (`course_id`);

--
-- Indexes for table `stud_enrolled_subject`
--
ALTER TABLE `stud_enrolled_subject`
  ADD PRIMARY KEY (`Stud_id`,`subject_code`,`s_year`,`sem`) USING BTREE,
  ADD KEY `subject_code` (`subject_code`),
  ADD KEY `s_year` (`s_year`),
  ADD KEY `sem` (`sem`),
  ADD KEY `Stud_id` (`Stud_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_code`),
  ADD KEY `course_subject` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dean`
--
ALTER TABLE `dean`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `signatory`
--
ALTER TABLE `signatory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `Students_appointment` FOREIGN KEY (`Stud_id`) REFERENCES `students` (`Stud_id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `Students_attendance` FOREIGN KEY (`Stud_id`) REFERENCES `students` (`Stud_id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `college_course` FOREIGN KEY (`coll_id`) REFERENCES `college` (`coll_id`);

--
-- Constraints for table `course_faculty`
--
ALTER TABLE `course_faculty`
  ADD CONSTRAINT `course_course_faculty` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `faculty_course_faculty` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `dean`
--
ALTER TABLE `dean`
  ADD CONSTRAINT `dean_ibfk_1` FOREIGN KEY (`coll_id`) REFERENCES `college` (`coll_id`);

--
-- Constraints for table `faculty_designation`
--
ALTER TABLE `faculty_designation`
  ADD CONSTRAINT `faculty_designation_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`),
  ADD CONSTRAINT `faculty_designation_ibfk_2` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `Students_images` FOREIGN KEY (`Stud_id`) REFERENCES `students` (`Stud_id`);

--
-- Constraints for table `offering_sem`
--
ALTER TABLE `offering_sem`
  ADD CONSTRAINT `faculty_offering_sem` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`),
  ADD CONSTRAINT `offering_sem_ibfk_1` FOREIGN KEY (`rm_id`) REFERENCES `rooms` (`rm_id`);

--
-- Constraints for table `prospectus`
--
ALTER TABLE `prospectus`
  ADD CONSTRAINT `course_Prospectus` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `prospectus_detail`
--
ALTER TABLE `prospectus_detail`
  ADD CONSTRAINT `Prospectus_prospectus_detail` FOREIGN KEY (`revision_year`,`course_id`) REFERENCES `prospectus` (`revision_year`, `course_id`),
  ADD CONSTRAINT `subject_prospectus_detail` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`);

--
-- Constraints for table `students_enrolled_course`
--
ALTER TABLE `students_enrolled_course`
  ADD CONSTRAINT `Students_Students_enrolled_course` FOREIGN KEY (`Stud_id`) REFERENCES `students` (`Stud_id`),
  ADD CONSTRAINT `course_Students_enrolled_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `stud_enrolled_subject`
--
ALTER TABLE `stud_enrolled_subject`
  ADD CONSTRAINT `stud_enrolled_subject_ibfk_1` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`),
  ADD CONSTRAINT `stud_enrolled_subject_ibfk_2` FOREIGN KEY (`Stud_id`) REFERENCES `students` (`Stud_id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `course_subject` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
