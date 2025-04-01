-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: dev_personality_test
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `letter_of_choice` varchar(1) NOT NULL,
  `answer_text` varchar(255) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id_idx` (`question_id`),
  CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'A','Embrace the change and adapt quickly'),(2,1,'B','Assess the impact and adjust your plans accordingly'),(3,1,'C','Seek clarification and negotiate a feasible solution'),(4,1,'D','You prefer stability and find it challenging to adjust'),(5,2,'A','Achieving personal goals and milestones'),(6,2,'B','Receiving recognition and praise from others'),(7,2,'C','Making a meaningful impact on projects or products'),(8,2,'D','Collaborating and building strong team relationships'),(9,3,'A','Rely on intuition and past experiences'),(10,3,'B','Gather as much information as possible before deciding'),(11,3,'C','Consult with others to get different perspectives'),(12,3,'D','Delay making a decision until more clarity is achieved'),(13,4,'A','Maintain clear boundaries between work and personal time'),(14,4,'B','Integrate work into your daily life as needed'),(15,4,'C','Find it challenging to separate work from personal time'),(16,4,'D','Balance depends on project deadlines and personal needs'),(17,5,'A','Structured and predictable with clear guidelines'),(18,5,'B','Dynamic and flexible with opportunities for creativity'),(19,5,'C','Collaborative and team-oriented with frequent interactions'),(20,5,'D','Independent and quiet with minimal interruptions'),(21,6,'A','Address issues directly and seek a resolution quickly'),(22,6,'B','Facilitate a discussion to understand all viewpoints'),(23,6,'C','Avoid confrontation and work towards compromise'),(24,6,'D','Seek mediation from a third party if necessary'),(25,7,'A','Face-to-face meetings for detailed discussions'),(26,7,'B','Email for formal communication and documentation'),(27,7,'C','Instant messaging for quick and informal exchanges'),(28,7,'D','Video calls for more personal and interactive conversations'),(29,8,'A','Set specific goals and pursue formal education or training'),(30,8,'B','Learn through practical experience and on-the-job challenges'),(31,8,'C','Engage in self-directed learning through books and online resources'),(32,8,'D','Participate in workshops, seminars, or conferences for new insights'),(33,9,'A','Stay calm and focus on problem-solving step-by-step'),(34,9,'B','Prioritize tasks and manage time effectively'),(35,9,'C','Seek support from colleagues or mentors'),(36,9,'D','Take breaks and practice stress-relief techniques'),(37,10,'A','Create a detailed plan with specific milestones'),(38,10,'B','Set broad goals and adapt as circumstances change'),(39,10,'C','Focus on short-term goals and make adjustments along the way'),(40,10,'D','Use feedback and reflection to guide goal setting and achievement');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `career_code` varchar(3) NOT NULL,
  `career_name` varchar(45) NOT NULL,
  `personality_description` varchar(1000) DEFAULT NULL,
  `motivation` varchar(500) DEFAULT NULL,
  `work_environment` varchar(500) DEFAULT NULL,
  `communication_style` varchar(500) DEFAULT NULL,
  `decision_making` varchar(500) DEFAULT NULL,
  `conflict_handling` varchar(500) DEFAULT NULL,
  `traits` varchar(120) DEFAULT NULL,
  `tech_stack` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`career_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES ('BCD','Blockchain Developer','You build decentralised apps and blockchain-based solutions. Not only do you specialise in blockchain technology, but you are also proficient in several programming languages. You design, develop and implement smart contracts that guarantee security and proof of exchange of digital assets.','Securing digital assets through creating tamper-proof systems, as well as potentially changing the financial landscape by introducing decentralised currency.','Either collaborative with other developers to create blockchain solutions, or creating blockchains on their own.','Uses a mix of instant messaging, social media and face-to-face meetings.','Based on innovative solutions and protecting digital assets and transactions from tampering and other fraudulent activities.','Addresses security and transaction issues through problem solving and implementation of cutting-edge technology.','Innovative, Open-minded, Willful, Security-focused.','Solidity, Vyper, Rust, Solana, Ethereum, JavaScript, Go, Python'),('BED','Back-End Developer','You excel at solving complex problems and enjoy working behind the scenes to ensure that applications run smoothly. You are detail-orientated and meticulous, with a strong focus on system performance and reliability. You prefer structured environments where you can dive deep into technical challenges and optimise server-side processes.','Solving complex logic problems, ensuring the server-side performance and scalability.','Structured with a focus on system stability, database management, and server-side operations.','Prefers email or documentation for technical specifications and requirements.','Based on technical constraints, performance metrics, and server-side architecture.','Resolves technical issues and optimizes system performance through detailed analysis and testing.','Analytical, methodical, problem-solver, technical','JavaScript, Python, Java, Ruby, PHP, TypeScript, Next.js'),('CSX','Cyber Security Expert','You protect digital systems, digital assets and user data from cyber attackers. You have a profound understanding of security principles and know which assets or data require the most protection. Not only do you possess knowledge of encryption schemes and countermeasures, you are also aware of how attackers can exploit vulnerabilities. You are also responsible for regularly running penetration tests to mitigate the weaknesses of the company’s systems and informing the company of best practices to protect their devices from cyber attacks. ','Protecting the company’s digital assets against cyber attacks and ensuring data privacy for the benefit of all stakeholders.','Analytical with a focus on assessing potential risks and monitoring systems for vulnerabilities or threats to these.','Can work with formal or informal communication when providing education or training on best practices in cyber security. ','Based on potential cyber threats, existing vulnerabilities of the software or devices as well as habits of the company’s employees. ','Addressing cyber attacks head-on and identify a solution as soon as possible. ','Analytical, security-focused, vigilant, proactive.','C, C++, C#, Python, Go, JavaScript, Bash, Power Shell'),('DBA','Database Administrator','You specialise in managing and optimising databases, ensuring data integrity and performance. You are detail-orientated and focused on maintaining the security and efficiency of data storage systems. Your work is analytical, often involving deep dives into data management and optimisation.','Ensuring data integrity, performance, and security of databases.','Analytical and detail-oriented, focusing on database management, optimization, and security.','Detailed documentation and formal communication for database specifications and performance reports.','Based on data performance metrics, security needs, and optimization strategies.','Resolves data-related issues through analysis and database management techniques, often working behind the scenes.','Analytical, meticulous, organized, security-focused','SQL, PL/SQL, T-SQL, Python, Shell Scripting, R'),('DOE','DevOps Engineer','You are focused on automating processes and ensuring that systems run smoothly and efficiently. Your role involves integrating development and operations, managing infrastructure, and optimising deployment pipelines. You thrive in fast-paced environments and enjoy solving problems related to system operations and automation.','Automating and optimizing deployment processes, ensuring smooth operation of systems.','Fast-paced and technical, with a focus on system integration, monitoring, and infrastructure management.','Prefers instant messaging for quick updates and collaborative problem-solving in real-time.','Based on system performance, deployment metrics, and infrastructure needs.','Uses automated tools and monitoring to identify and resolve issues efficiently, often working with other teams to streamline processes.','Technical, problem-solver, detail-oriented, proactive','Bash/Shell Scripting, Python, Go, Ruby, JavaScript, Terraform'),('FED','Front-End Developer','You have a keen eye for design and a passion for creating visually appealing and user-friendly interfaces. You thrive in environments where you can experiment with new design trends and focus on delivering a great user experience. Your work is often dynamic, involving frequent iterations, ability to work with the back-end functionality without guidance and feedback from users.','Achieving a polished and user-friendly interface, receiving feedback on design and user experience.','Dynamic and creative, often with frequent design iterations and user testing.','Prefers brainstorming sessions to come up with new design ideas.','Based on design principles, ease of use and user feedback.','Resolves issues using intuition and user experience.','Creative, detail-oriented, user-focused, adaptable','CSS, JavaScript, TypeScript, React, Next.js Angular, Vue.js, SASS/SCSS'),('FSD','Full Stack Developer','You are versatile and enjoy working on both front-end and back-end tasks. Your broad skill set allows you to build complete applications, from user interfaces to server-side logic. You thrive in roles that require balancing different aspects of development and enjoy seeing a project through from start to finish.','Building complete, functional applications and integrating front-end and back-end systems.','Versatile, balancing between front-end and back-end tasks, requiring adaptability and broad skill sets.','Uses a mix of communication methods, adapting to the needs of different aspects of the project.','Considers both front-end and back-end perspectives, making decisions that balance user experience and system functionality.','Manages conflicts by finding solutions that work across both the front-end and back-end.','Versatile, balanced, adaptable, integrative.','JavaScript, Python, Java, Ruby, PHP, TypeScript, Next.js'),('GDV','Game Developer','You are passionate about creating immersive and engaging experiences. You enjoy designing, programming, and refining games to captivate players. Your work involves creativity and iterative design, as well as technical problem-solving to bring games to life on various platforms. ','Creating engaging and immersive gaming experiences, refining gameplay and design elements.','Creative and iterative, involving game design, programming, and testing phases.','Collaborative and interactive, often with frequent feedback sessions and brainstorming meetings.','Based on game design principles, user feedback, and gameplay mechanics.','Works through design and technical challenges by prototyping and testing solutions to enhance the gaming experience.','Creative, imaginative, iterative, user-focused','C++, C#, Java, Python, JavaScript, GDScript'),('MAD','Mobile App Developer','You create applications made for mobile devices, providing convenience to users who frequently use their phones. Your work is dynamic as you take on multiple roles in the software development lifecycle such as designing, developing and deploying the app. You also ensure that the apps meet the standards of the app stores you will make it available to. ','Creating mobile applications that provide assistance and convenience in an aspect of a user’s life. ','Either working independently on the mobile app or working with a team.','Email for communicating with app reviewers and for relaying requirements, could also collaborate with other developers and users for feedback. ','Based on technical constraints as well as user and reviewer feedback.','Works through design and technical challenges through fixes that enhance the user mobile experience.','Versatile, iterative, adaptable, technical.','Java, Kotlin, Objective-C, Swift, React Native, JavaScript, Flutter, Dart'),('QAT','QA Tester','You ensure that the software created by the developer team works as expected. In the event that it does not work as intended, you report your findings to the team. You enhance the software development process through writing test cases and unit tests, encouraging team members to adopt best practices and running automation frameworks or manual tests. Your work is analytical as you prioritise the functionality and performance of the software so that the users will be satisfied with the end product.','Creating and performing tests to ensure that the application is functional and meets the standards of users.','Collaborating with other team members, especially the developer team in adopting best practices and reporting defects to the team.','Formal communication or video calls to impart outcomes of the tests or suggestions for best practices.','Utilises tests to identify flaws in application. Also highly considers user behaviour in the creation of test cases.','Resolves technical issues and performance by relaying the issues to the concerned parties.','Meticulous, Intuitive, Empathetic, User-focused.','JavaScript, Selenium, Cypress, POSTman, jUnit, Playwright, Puppeteer, Jest');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(255) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'How do you typically react to sudden changes in your work environment or project scope?'),(2,'What motivates you most in your work?'),(3,'How do you approach decision-making in uncertain situations?'),(4,'How do you handle work-life balance?'),(5,'What type of work environment do you thrive in?'),(6,'How do you prefer to handle conflicts or disagreements in a team setting?'),(7,'What is your preferred method of communication at work?'),(8,'How do you approach personal growth and skill development?'),(9,'What is your strategy for dealing with high-pressure situations?'),(10,'How do you approach setting and achieving personal goals?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `answer_id` int NOT NULL,
  `career_code` varchar(3) NOT NULL,
  `score` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`answer_id`,`career_code`),
  KEY `career_code_idx` (`career_code`),
  CONSTRAINT `answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  CONSTRAINT `career_code` FOREIGN KEY (`career_code`) REFERENCES `careers` (`career_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,'BCD',1),(1,'FED',1),(1,'QAT',1),(2,'CSX',1),(2,'DBA',1),(2,'DOE',1),(3,'FSD',1),(3,'MAD',1),(4,'BED',1),(5,'BCD',1),(5,'DBA',1),(5,'MAD',1),(6,'FED',1),(6,'GDV',1),(7,'BCD',1),(7,'BED',1),(7,'CSX',1),(7,'DOE',1),(8,'FSD',1),(8,'QAT',1),(9,'FED',1),(9,'MAD',1),(10,'BCD',1),(10,'CSX',1),(10,'DBA',1),(10,'GDV',1),(11,'DOE',1),(11,'FSD',1),(11,'QAT',1),(12,'BED',1),(13,'BED',1),(13,'CSX',1),(13,'DOE',1),(14,'BCD',1),(14,'FED',1),(15,'GDV',1),(15,'MAD',1),(16,'DBA',1),(16,'FSD',1),(16,'QAT',1),(17,'BED',1),(17,'CSX',1),(17,'DBA',1),(18,'FED',1),(18,'GDV',1),(19,'BCD',1),(19,'BED',1),(19,'DOE',1),(19,'FSD',1),(19,'MAD',1),(19,'QAT',1),(20,'BCD',1),(20,'DBA',1),(21,'BCD',1),(21,'CSX',1),(21,'DOE',1),(22,'FSD',1),(22,'QAT',1),(23,'DBA',1),(23,'MAD',1),(24,'BED',1),(24,'FED',1),(24,'GDV',1),(25,'BCD',1),(25,'CSX',1),(25,'FSD',1),(25,'GDV',1),(26,'BED',1),(26,'DBA',1),(26,'FSD',1),(26,'MAD',1),(27,'BCD',1),(27,'BED',1),(27,'DOE',1),(27,'FSD',1),(27,'QAT',1),(28,'FED',1),(28,'FSD',1),(29,'DBA',1),(29,'QAT',1),(30,'BCD',1),(30,'CSX',1),(30,'DOE',1),(30,'FED',1),(30,'GDV',1),(31,'BED',1),(31,'CSX',1),(31,'GDV',1),(31,'MAD',1),(32,'BCD',1),(32,'CSX',1),(32,'FSD',1),(33,'BCD',1),(33,'BED',1),(33,'CSX',1),(33,'GDV',1),(34,'CSX',1),(34,'DOE',1),(35,'BED',1),(35,'FED',1),(35,'FSD',1),(35,'GDV',1),(35,'MAD',1),(36,'DBA',1),(36,'QAT',1),(37,'BCD',1),(37,'DBA',1),(38,'CSX',1),(38,'FSD',1),(39,'BED',1),(39,'DOE',1),(39,'QAT',1),(40,'BED',1),(40,'FED',1),(40,'GDV',1),(40,'MAD',1);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-01 20:56:11
