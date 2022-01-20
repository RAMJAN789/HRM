-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2021 at 09:17 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attID` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `type` enum('in_time','out_time') NOT NULL,
  `punch_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attID`, `empID`, `type`, `punch_time`) VALUES
(1, 1, 'in_time', '2021-06-17 09:00:00'),
(2, 1, 'out_time', '2021-06-17 16:48:00'),
(3, 1, 'in_time', '2021-06-18 09:00:00'),
(4, 1, 'out_time', '2021-06-18 16:00:00'),
(5, 1, 'in_time', '2021-07-18 13:03:50'),
(6, 1, 'out_time', '2021-07-18 13:03:50'),
(7, 1, 'in_time', '2021-06-17 10:26:40'),
(8, 1, 'out_time', '2021-06-17 10:20:40'),
(9, 1, 'in_time', '2021-07-25 10:25:00'),
(10, 1, 'out_time', '2021-07-25 04:25:00'),
(11, 1, 'in_time', '2021-08-02 09:38:00'),
(12, 1, 'out_time', '2021-08-02 20:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bankID` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bankID`, `bank_name`, `status`) VALUES
(1, 'HSBC Bank', 'active'),
(2, 'Standard Chartered Bank ', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `benefits`
--

CREATE TABLE `benefits` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('add','deduct') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `benefits`
--

INSERT INTO `benefits` (`id`, `title`, `amount`, `type`) VALUES
(1, 'Bonus', '30.00', 'add'),
(2, 'PF', '10.00', 'deduct');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `shortlisted` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` enum('employee','candidate','','') NOT NULL DEFAULT 'candidate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `name`, `email`, `phone`, `address`, `photo`, `dob`, `gender`, `shortlisted`, `status`) VALUES
(9, 'Shahriar Kabir', 'skp.shahriar@gmail.com', '01625698323', 'Road No 3, Ali and Noor Real Estate, Mohammadpur', '2021-08-01-06-29-45193941873_3576195845939720_6277306882682759443_n.jpg', '1996-05-15', 'male', 'no', 'candidate');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_education`
--

CREATE TABLE `candidate_education` (
  `eduID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` varchar(10) NOT NULL,
  `board` varchar(255) NOT NULL,
  `result` varchar(10) NOT NULL,
  `candidateID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidate_education`
--

INSERT INTO `candidate_education` (`eduID`, `title`, `year`, `board`, `result`, `candidateID`) VALUES
(10, 'S.S.C.', '2013', 'Dhaka', 'A', 9),
(11, 'H.S.C.', '2015', 'Dhaka', 'A', 9);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dptID` int(11) NOT NULL,
  `dptName` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dptID`, `dptName`, `status`) VALUES
(1, 'HRM', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empID` int(11) NOT NULL,
  `dptID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `hire_date` date NOT NULL,
  `designation` varchar(50) NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empID`, `dptID`, `name`, `email`, `phone`, `dob`, `gender`, `address`, `photo`, `hire_date`, `designation`, `basic_salary`, `password`) VALUES
(1, 1, 'Sohel', 'gdf', '01735254295', '2021-06-01', 'male', 'dfgdf', 'dfgd', '2021-06-02', 'HR Admin', '25000.00', '12345'),
(2, 1, 'Shahriar Kabir', 'skp.shahriar@gmail.com', '01625649983', '2012-01-02', 'male', 'Road No 3, Ali and Noor Real Estate, Mohammadpur', '2021-06-29-09-05-282021-06-29-05-41-50logo.jpg', '2021-06-01', ' HR Admin', '50000.00', '123334');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `exoenseID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` enum('cash','bank') NOT NULL,
  `bankID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`exoenseID`, `categoryID`, `date`, `amount`, `method`, `bankID`) VALUES
(1, 2, '2021-06-16', '10000.00', 'cash', 0),
(2, 3, '2021-08-02', '5000.00', 'cash', 0),
(3, 4, '2021-08-04', '6000.00', 'cash', 0);

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`id`, `category_name`, `status`) VALUES
(2, 'expense', 'active'),
(3, 'Bill', 'active'),
(4, 'Mobile Bill', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `holidayID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`holidayID`, `title`, `start_date`, `end_date`) VALUES
(1, 'victory day', '2021-06-01', '2021-06-02'),
(2, 'birthday', '2021-06-28', '2021-07-02');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `incomeID` int(11) NOT NULL,
  `sourceID` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` enum('cash','bank') NOT NULL,
  `bankID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`incomeID`, `sourceID`, `date`, `amount`, `method`, `bankID`) VALUES
(1, 1, '2021-06-15', '50000.00', 'cash', 0);

-- --------------------------------------------------------

--
-- Table structure for table `income_source`
--

CREATE TABLE `income_source` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income_source`
--

INSERT INTO `income_source` (`id`, `name`, `status`) VALUES
(1, 'Profit', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `job_experience`
--

CREATE TABLE `job_experience` (
  `jobID` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `organization` text NOT NULL,
  `joining_date` date NOT NULL,
  `resign_date` date NOT NULL,
  `candidateID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_experience`
--

INSERT INTO `job_experience` (`jobID`, `designation`, `organization`, `joining_date`, `resign_date`, `candidateID`) VALUES
(7, 'HR Admin', 'Mars Tech.', '2019-01-01', '2019-06-30', 9),
(8, 'HR Admin', 'MK Tech.', '2019-07-01', '2019-09-30', 9);

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `applicationID` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `comment` text NOT NULL,
  `status` enum('applied','approved','rejected') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_application`
--

INSERT INTO `leave_application` (`applicationID`, `empID`, `typeID`, `start_date`, `end_date`, `comment`, `status`) VALUES
(2, 1, 1, '2021-06-21', '2021-06-23', 'abc', 'approved'),
(3, 1, 2, '2021-07-09', '2021-07-11', 'abc', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `typeID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `allowed_leave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`typeID`, `title`, `allowed_leave`) VALUES
(1, 'Health Issue', 1),
(2, 'Others', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `title`, `date`, `details`) VALUES
(1, 'Vacation', '2021-06-07', 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `salary_month`
--

CREATE TABLE `salary_month` (
  `id` int(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `generate_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary_month`
--

INSERT INTO `salary_month` (`id`, `month`, `generate_date`) VALUES
(1, '2021-06', '2021-07-01'),
(2, '2021-05', '2021-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payment`
--

CREATE TABLE `salary_payment` (
  `paymentID` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(25) NOT NULL,
  `bankID` int(11) NOT NULL,
  `monthID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary_payment`
--

INSERT INTO `salary_payment` (`paymentID`, `empID`, `payment_date`, `amount`, `payment_method`, `bankID`, `monthID`) VALUES
(1, 1, '2021-07-08', '30000.00', 'cash', 0, 1),
(2, 1, '2021-07-08', '50000.00', 'cash', 0, 2),
(13, 1, '2021-08-01', '26600.00', 'cash', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attID`),
  ADD KEY `empID` (`empID`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bankID`);

--
-- Indexes for table `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD PRIMARY KEY (`eduID`),
  ADD KEY `candidateID` (`candidateID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dptID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empID`),
  ADD KEY `dptID` (`dptID`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`exoenseID`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `bankID` (`bankID`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`holidayID`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`incomeID`),
  ADD KEY `sourceID` (`sourceID`),
  ADD KEY `bankID` (`bankID`);

--
-- Indexes for table `income_source`
--
ALTER TABLE `income_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_experience`
--
ALTER TABLE `job_experience`
  ADD PRIMARY KEY (`jobID`),
  ADD KEY `candidateID` (`candidateID`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`applicationID`),
  ADD KEY `empID` (`empID`),
  ADD KEY `typeID` (`typeID`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`typeID`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_month`
--
ALTER TABLE `salary_month`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_payment`
--
ALTER TABLE `salary_payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `empID` (`empID`),
  ADD KEY `bankID` (`bankID`),
  ADD KEY `monthID` (`monthID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `candidate_education`
--
ALTER TABLE `candidate_education`
  MODIFY `eduID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dptID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `exoenseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `holidayID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `incomeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `income_source`
--
ALTER TABLE `income_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_experience`
--
ALTER TABLE `job_experience`
  MODIFY `jobID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `applicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `typeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_month`
--
ALTER TABLE `salary_month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salary_payment`
--
ALTER TABLE `salary_payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD CONSTRAINT `candidate_education_ibfk_1` FOREIGN KEY (`candidateID`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dptID`) REFERENCES `department` (`dptID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `expense_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_2` FOREIGN KEY (`sourceID`) REFERENCES `income_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_experience`
--
ALTER TABLE `job_experience`
  ADD CONSTRAINT `job_experience_ibfk_1` FOREIGN KEY (`candidateID`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD CONSTRAINT `leave_application_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leave_application_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `leave_type` (`typeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary_payment`
--
ALTER TABLE `salary_payment`
  ADD CONSTRAINT `salary_payment_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salary_payment_ibfk_2` FOREIGN KEY (`monthID`) REFERENCES `salary_month` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
