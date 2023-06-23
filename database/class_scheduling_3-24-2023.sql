-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 06:07 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.2.0

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
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Stud_id` varchar(40) NOT NULL,
  `date` varchar(40) NOT NULL,
  `time` varchar(40) NOT NULL,
  `transaction` text NOT NULL,
  `tansact_with` varchar(40) DEFAULT NULL,
  `contact` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `coll_id` varchar(60) NOT NULL,
  `coll_code` varchar(40) DEFAULT NULL,
  `coll_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`coll_id`, `coll_code`, `coll_desc`) VALUES
('100042826267492352', 'CITE', 'College of Information Technology Education '),
('63719385c8ed2', 'CAS', 'College of Arts and Sciences'),
('6371958f88e11', 'CFT', 'College of Fisheries Technology'),
('637349b7f39f6', 'CBIT', 'College of Business Information Technologyy'),
('6378defe53e04', 'CBM', 'College of Business and Management');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `coll_id`, `crs_code`, `crs_desc`, `major`) VALUES
('637789eb86042', '100042826267492352', 'BSCS', 'Bachelor of Science in Computer Science', ''),
('6378e035e6c30', '6378defe53e04', 'BSBA-BE', 'Bachelor of Science in Business Administrator', 'Business Economics'),
('637987ed20f5d', '63719385c8ed2', 'BSES', 'Bachelor of Science in Environmental Science', ''),
('64006697b941c', '6371958f88e11', 'BSFi', 'Bachelor of Science in Fishiries', ''),
('6411c9440ffcd', '6378defe53e04', 'BSMB', 'Bachelor of Science in Marine Biology', ''),
('641b02ac75bdb', '6378defe53e04', 'BSBA-FM', 'Bachelor of Science in Business Administrator', 'Financial Management');

-- --------------------------------------------------------

--
-- Table structure for table `course_faculty`
--

CREATE TABLE `course_faculty` (
  `course_id` varchar(40) NOT NULL,
  `fac_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('637987ed20f5d', '2023-0006'),
('637987ed20f5d', '2023-0010'),
('64006697b941c', '2023-0008'),
('641b02ac75bdb', '2023-0025');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` varchar(50) NOT NULL,
  `designation_title` varchar(50) NOT NULL,
  `deloading` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `designation_title`, `deloading`) VALUES
('640434a9eb052', 'Department Chair', 6),
('640435b3a369d', 'Program Coordinator', 3),
('6404587d48c20', 'Extention', 3),
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
  `position_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fname`, `mname`, `lname`, `address`, `sex`, `marital_stat`, `contact`, `vaccinated`, `educ_qualification`, `qual_major`, `eligibility_prc`, `position_id`) VALUES
('2023-0001', 'Gene Boy', '', 'Pitos', 'Poblacion, Lianga SDS', 'male', 'married', '09235456766', 'true', '', '', '', '64040b42412e0'),
('2023-0002', 'Christine', 'Wagas', 'Pitos', 'Lianga SDS', 'female', 'married', '09343277433', 'true', '', '', '', '64040b42412e0'),
('2023-0003', 'Melizande', '', 'Uriarte', 'Diatagon SDS', 'female', 'married', '09345231123', 'true', '', '', '', '100209270745726976'),
('2023-0004', 'Jename', '', 'Tadlip', 'Butuan City, ADS', 'female', 'single', '09988772341', 'true', '', '', '', '640d4333dcdcf'),
('2023-0005', 'Mantiza', '', 'Mantiza', 'Unknown', 'male', 'single', '09234231245', 'true', '', '', '', '100209270745726976'),
('2023-0006', 'Edrick Ray', '', 'Santamaria', 'Poblacion Lianga SDS', 'male', 'married', '09923657844', 'true', '', '', '', '100209270745726976'),
('2023-0007', 'Unknown', '', 'Palacio', 'Lianga SDS', 'male', 'married', '09344123232', 'true', '', '', '', '100209270745726976'),
('2023-0008', 'Henrietta', '', 'Sanchez', 'Lianga SDS', 'female', 'married', '09342345656', 'true', '', '', '', '100209270745726976'),
('2023-0009', 'Unknown', '', 'Sanchez', 'Lianga SDS', 'male', 'single', '09324564321', 'true', '', '', '', '100209270745726976'),
('2023-0010', 'AL', '', 'Encenzo', 'Lianga SDS', 'male', 'married', '09342565566', 'true', '', '', '', '100209270745726976'),
('2023-0011', 'Annie', '', 'Unknown', 'Lianga SDS', 'female', 'single', '09342199333', 'true', '', '', '', '100209270745726976'),
('2023-0012', 'C', '', 'Balinton', 'Liangaa SDS', 'male', 'single', '09234323455', 'true', '', '', '', '100209270745726976'),
('2023-0013', 'KD', '', 'Jabagat', 'Lianga SDS', 'male', 'single', '09234354321', 'true', '', '', '', '100209270745726976'),
('2023-0014', 'Lolita', '', 'Martin', 'Lianga SDS', 'female', 'married', '09876765434', 'true', '', '', '', '640d4266bfd14'),
('2023-0015', 'Liaflora', '', 'Orcullo', 'Lianga SDS', 'male', 'married', '09765666543', 'true', '', '', '', '100209270745726976'),
('2023-0016', 'LM', '', 'Rodriquez', 'Lianga SDS', 'female', 'married', '09234412213', 'true', '', '', '', '100209270745726976'),
('2023-0025', 'Hello', '', 'World', 'Lianga SDS', 'female', 'single', '09506866597', 'true', '', '', '', '640d41796fceb');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_designation`
--

CREATE TABLE `faculty_designation` (
  `fac_id` varchar(50) NOT NULL,
  `designation_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty_designation`
--

INSERT INTO `faculty_designation` (`fac_id`, `designation_id`) VALUES
('2023-0002', '640434a9eb052'),
('2023-0014', '640434a9eb052'),
('2023-0025', '640434a9eb052'),
('2023-0002', '640435b3a369d'),
('2023-0008', '640435b3a369d'),
('2023-0025', '640435b3a369d'),
('2023-0001', '6404587d48c20'),
('2023-0014', '6404587d48c20'),
('2023-0014', '6404589078e85');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `Stud_id` varchar(40) NOT NULL,
  `filename` text DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `size` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offering_sem`
--

CREATE TABLE `offering_sem` (
  `program_code` varchar(50) NOT NULL,
  `subject_code` varchar(60) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `fac_id` varchar(40) NOT NULL,
  `rm_id` int(40) DEFAULT NULL,
  `sched_time` varchar(40) DEFAULT NULL,
  `sched_day` varchar(40) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offering_sem`
--

INSERT INTO `offering_sem` (`program_code`, `subject_code`, `course_id`, `year`, `sem`, `section`, `fac_id`, `rm_id`, `sched_time`, `sched_day`, `type`) VALUES
('CS120A', 'CS 121', '637789eb86042', 'first', 'second', 'A', '2023-0002', 4, '7:00AM-8:30AM', 'Mon', 'lec'),
('CS120A', 'CS 121', '637789eb86042', 'first', 'second', 'A', '2023-0002', 4, '7:00AM-8:30AM', 'Thu', 'lec'),
('CS120B', 'CS 121', '637789eb86042', 'first', 'second', 'B', '2023-0004', 1, '7:00AM-8:30AM', 'Mon', 'lec'),
('CS120B', 'CS 121', '637789eb86042', 'first', 'second', 'B', '2023-0004', 1, '7:00AM-8:30AM', 'Thu', 'lec');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('640d42f737b60', 'Professor V', 21, 33, 'permanent'),
('640d4317f2d26', 'Contractual', 15, 33, 'contructual'),
('640d4333dcdcf', 'Part-time', 3, 9, 'part-time');

-- --------------------------------------------------------

--
-- Table structure for table `prospectus`
--

CREATE TABLE `prospectus` (
  `revision_year` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prospectus`
--

INSERT INTO `prospectus` (`revision_year`, `course_id`) VALUES
('2015-2016', '637789eb86042'),
('2015-2016', '64006697b941c'),
('2016-2017', '637789eb86042'),
('2018-2019', '6378e035e6c30'),
('2018-2019', '641b02ac75bdb'),
('2022-2023', '637789eb86042'),
('2022-2023', '637987ed20f5d');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('6378e035e6c30', '2018-2019', 'GE-CW', 'first', 'first'),
('6378e035e6c30', '2018-2019', 'GE-PC', 'first', 'first'),
('6378e035e6c30', '2018-2019', 'GE-US', 'first', 'first'),
('637987ed20f5d', '2022-2023', 'Math1', 'first', 'first');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `rm_id` int(11) NOT NULL,
  `building` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'Room 129', 'lec', 'usable');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students_enrolled_course`
--

CREATE TABLE `students_enrolled_course` (
  `Stud_id` varchar(40) NOT NULL,
  `s_year` varchar(40) NOT NULL,
  `sem` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `year` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stud_enrolled_subject`
--

CREATE TABLE `stud_enrolled_subject` (
  `Stud_id` varchar(40) NOT NULL,
  `subject_code` varchar(60) NOT NULL,
  `s_year` varchar(40) NOT NULL,
  `sem` varchar(40) NOT NULL,
  `grade` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_code`, `course_id`, `title`, `lec_hr`, `lab_hr`, `units`, `pre_requisites`) VALUES
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
('GE-AA', '637789eb86042', 'Art Appreciation', '3', '0', '3', ''),
('GE-BC', '637789eb86042', 'Business Correspondence', '3', '0', '3', ''),
('GE-CW', '637789eb86042', 'The Contemporary World', '3', '0', '3', ''),
('GE-E', '637789eb86042', 'Ethics', '3', '0', '3', ''),
('GE-MMW', '637789eb86042', 'Mathematics in the Modern World', '3', '0', '3', ''),
('GE-PC', '637789eb86042', 'Purposive Communication', '3', '0', '3', ''),
('GE-RPH', '637789eb86042', 'Reading in Philippine History', '3', '0', '3', ''),
('GE-STS', '637789eb86042', 'Science, Technology and Society', '3', '0', '3', ''),
('GE-US', '637789eb86042', 'Understanding the Self', '3', '0', '3', ''),
('IT 1', '637789eb86042', 'Living in the IT Era', '3', '0', '3', ''),
('Math-Elec', '637789eb86042', 'Theory of Computation', '3', '0', '3', 'Math 1'),
('Math1', '637987ed20f5d', 'Algebra', '3', '0', '3', ''),
('NSTP 1', '637789eb86042', 'National Service Training Program 1', '3', '0', '3', ''),
('NSTP 2', '637789eb86042', 'National Service Training Program 2', '3', '0', '3', 'NSTP 1'),
('PE 1', '637789eb86042', 'Physical Fitness & Health', '2', '0', '2', ''),
('PE 2', '637789eb86042', 'Rhythmic Activities', '2', '0', '2', 'PE 1'),
('PE 3', '637789eb86042', 'Individual and Dual Sports', '2', '0', '2', 'PE 2'),
('PE 4', '637789eb86042', 'Recreational and Team Sports', '2', '0', '3', 'PE 3'),
('Rizal', '637789eb86042', 'Life and Works of Rizal', '3', '0', '3', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL,
  `fac_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `pass_modified` tinyint(1) NOT NULL,
  `user_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fac_id`, `name`, `username`, `password`, `pass_modified`, `user_type`) VALUES
('100045697419575296', '', 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 0, 'admin'),
('64006f5a9e62a', '2023-0002', 'Christine Pitos', 'christinepi929', '73b46ce287121185374ec7e1d35f48c0', 0, 'Program coordinator'),
('641b02e6a89ba', '2023-0008', 'Henrietta Sanchez', 'henriettasa849', '0a829169f5b3ba91138a27b08b9afc42', 0, 'Program coordinator'),
('641b05744429e', '2023-0025', 'Hello World', 'hellowo396', 'f13a8da0d14999f9e29225e10483b7d0', 0, 'Program coordinator');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`),
  ADD KEY `position_id` (`position_id`);

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
-- Indexes for table `offering_sem`
--
ALTER TABLE `offering_sem`
  ADD PRIMARY KEY (`program_code`,`subject_code`,`section`,`year`,`sem`,`course_id`,`sched_day`) USING BTREE,
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
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Stud_id`);

--
-- Indexes for table `students_enrolled_course`
--
ALTER TABLE `students_enrolled_course`
  ADD PRIMARY KEY (`Stud_id`,`s_year`,`sem`),
  ADD KEY `course_Students_enrolled_course` (`course_id`);

--
-- Indexes for table `stud_enrolled_subject`
--
ALTER TABLE `stud_enrolled_subject`
  ADD PRIMARY KEY (`Stud_id`),
  ADD KEY `Students_enrolled_course_Stud_enrolled_subject` (`Stud_id`,`s_year`,`sem`),
  ADD KEY `offering_sem_Stud_enrolled_subject` (`subject_code`);

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
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`);

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
  ADD CONSTRAINT `faculty_offering_sem` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

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
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `course_subject` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
