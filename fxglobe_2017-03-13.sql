# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.1.21-MariaDB)
# Database: fxglobe
# Generation Time: 2017-03-13 15:58:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table document_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document_categories`;

CREATE TABLE `document_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `document_categories` WRITE;
/*!40000 ALTER TABLE `document_categories` DISABLE KEYS */;

INSERT INTO `document_categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'nihil','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(2,'id','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(3,'pariatur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(4,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(5,'laudantium','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(6,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(7,'praesentium','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(8,'ipsam','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(9,'consequatur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(10,'eaque','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(11,'inventore','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(12,'quia','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(13,'fugit','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(14,'non','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(15,'praesentium','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(16,'consequuntur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(17,'consectetur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(18,'minus','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(19,'consequatur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(20,'excepturi','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(21,'architecto','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(22,'impedit','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(23,'aspernatur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(24,'quidem','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(25,'similique','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(26,'quo','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(27,'sed','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(28,'praesentium','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(29,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(30,'accusamus','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(31,'numquam','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(32,'ut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(33,'enim','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL);

/*!40000 ALTER TABLE `document_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table document_category_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document_category_document`;

CREATE TABLE `document_category_document` (
  `document_category_id` int(10) unsigned NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`document_category_id`,`document_id`),
  KEY `document_category_document_document_category_id_index` (`document_category_id`),
  KEY `document_category_document_document_id_index` (`document_id`),
  CONSTRAINT `document_category_document_document_category_id_foreign` FOREIGN KEY (`document_category_id`) REFERENCES `document_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `document_category_document_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table document_tag_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document_tag_document`;

CREATE TABLE `document_tag_document` (
  `document_tag_id` int(10) unsigned NOT NULL,
  `document_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`document_tag_id`,`document_id`),
  KEY `document_tag_document_document_tag_id_index` (`document_tag_id`),
  KEY `document_tag_document_document_id_index` (`document_id`),
  CONSTRAINT `document_tag_document_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `document_tag_document_document_tag_id_foreign` FOREIGN KEY (`document_tag_id`) REFERENCES `document_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table document_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document_tags`;

CREATE TABLE `document_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `document_tags` WRITE;
/*!40000 ALTER TABLE `document_tags` DISABLE KEYS */;

INSERT INTO `document_tags` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(2,'praesentium','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(3,'quaerat','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(4,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(5,'tempore','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(6,'voluptatem','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(7,'libero','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(8,'enim','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(9,'dolorum','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(10,'dolore','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(11,'minima','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(12,'magnam','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(13,'aut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(14,'illum','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(15,'reprehenderit','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(16,'eveniet','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(17,'dolorem','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(18,'qui','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(19,'dolorum','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(20,'ut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(21,'ea','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(22,'quos','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(23,'distinctio','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(24,'commodi','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(25,'consequuntur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(26,'quod','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(27,'asperiores','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(28,'magni','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(29,'quos','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(30,'exercitationem','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(31,'error','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(32,'aut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(33,'accusamus','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL);

/*!40000 ALTER TABLE `document_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `documents`;

CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;

INSERT INTO `documents` (`id`, `name`, `content`, `description`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,'Distinctio facere excepturi omnis natus sit perspiciatis.','Harum molestiae quo quos aut. Doloribus fugit autem commodi numquam sit vero. Quis maxime a numquam nostrum. Sed voluptas non neque molestiae esse qui. Tenetur in eum qui.','Tempore eius aut sint et.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(2,'Quaerat rerum fugiat libero cupiditate nemo.','Culpa quo asperiores dicta provident autem est quis. Voluptatibus ut iusto beatae aut quis enim exercitationem. Perspiciatis nesciunt recusandae tempora magnam. Voluptatem amet alias consequatur est ex ea.','Dolor nobis quia quidem tempore.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(3,'Corrupti ea et quasi.','Saepe repellat earum ut non ut placeat quis. Cum eaque autem perferendis hic qui corporis et. Repellendus voluptatem eius et magnam quae et. Quos nesciunt ad aut dicta cumque consequatur expedita.','Cupiditate quisquam ut incidunt aut nihil veritatis.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(4,'Ab quam maiores ut aut sunt quidem.','Eligendi ex numquam eos corporis et ab voluptatem nostrum. In laboriosam molestiae repellendus quo aut sint. Modi et autem accusamus accusantium voluptas doloribus facilis.','Ut quo est id porro.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(5,'Et tempora provident nihil doloribus tempora iure.','Expedita explicabo ea quia ab rem. Sunt dolor voluptas et tempora minus perferendis. Sunt doloribus ut est reprehenderit.','Vel accusamus cum reiciendis eos sint.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(6,'Et dolor fugit labore quibusdam doloribus.','Officiis harum odit distinctio dolores hic. Expedita placeat blanditiis est. Expedita cumque nisi eligendi eveniet neque. Nesciunt voluptas nobis quia atque earum eum voluptate.','Enim et non et omnis et qui.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(7,'Omnis numquam et quisquam consectetur velit quod.','Modi officiis veritatis repudiandae vero officiis. Ab commodi qui provident minima quod. Sed dolorum quibusdam voluptatem recusandae officia. Reiciendis consequatur quia dolor delectus.','Quae dicta quia magnam ut sit cum rerum.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(8,'Molestias a et et aliquid voluptatem.','Nostrum omnis architecto ipsum ipsum. Nam dolores necessitatibus qui adipisci. Alias vitae eum in corporis. Id voluptatem consectetur nihil omnis magnam et. Sunt deleniti sed ipsam nam id.','Delectus harum qui enim omnis temporibus distinctio itaque.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(9,'Qui et facere officiis enim nam.','Tempore doloremque rerum velit aut. Incidunt hic alias non quia minus enim aut. In exercitationem deserunt excepturi a adipisci. Sit rerum sed dolore repellat ducimus et et.','Ea asperiores corrupti itaque quidem.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(10,'Quas aliquid reiciendis corrupti.','Consequatur reiciendis nam labore quidem quo. Quam soluta nihil enim omnis atque. Porro est pariatur nihil natus accusantium tempora. Et harum molestiae quia similique.','Culpa voluptate velit voluptatem.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(11,'Et aut reprehenderit asperiores ab omnis fugit.','Et doloremque impedit rerum libero. Laborum sit ea itaque. Vel adipisci aliquid praesentium impedit itaque tempore.','Ex hic dolorem praesentium dolores.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(12,'Mollitia distinctio quas facilis laborum iste facilis.','Provident itaque nihil id odit quaerat. Eum omnis tenetur sapiente aut et sequi. Sit aperiam nemo veniam ut sed provident et sequi.','Voluptatum dolore ut dolorum molestias.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(13,'Ab saepe inventore est minima atque rerum.','Voluptas voluptas quia nostrum rerum. Non neque inventore dolor dolores. Nulla ea nihil quod et repellat tempora.','Porro rerum optio incidunt dolorum voluptatem sunt.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(14,'Nihil nemo qui sed distinctio corrupti sit consequatur quo.','Dolorem ut ipsa voluptas. Vitae et qui eaque dolorem et corrupti impedit. Nihil sint porro ea voluptates reprehenderit magni. Neque rem ducimus commodi est laboriosam.','Minus aliquid ipsa ratione ab.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(15,'Consequatur voluptate sit dolores eum.','Incidunt ullam cumque dolores. Culpa delectus tempora rerum iusto. Inventore hic voluptatibus aut.','Molestiae impedit doloribus in vero accusamus quod optio.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(16,'Ut reprehenderit enim ratione deleniti.','Voluptatum occaecati architecto necessitatibus voluptatem fugiat praesentium et. Qui ut praesentium adipisci ipsam unde. Culpa sed laudantium ut laboriosam culpa et culpa. Impedit qui consequuntur dolor itaque.','Magnam odio in placeat enim et sed.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(17,'Voluptatibus ab velit dolores qui sit.','Est odio vel a iusto aspernatur enim. Sint qui sequi ullam minima. Molestiae harum magnam fugiat quo dolore aliquid. Laudantium accusamus quia ipsum sunt accusantium omnis odio.','Eos architecto necessitatibus consectetur quos ducimus fugiat.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(18,'In maiores facere architecto aliquid beatae.','Et perspiciatis saepe et a. Non voluptate ad quos possimus sit iure.','Ut qui quia optio sed repellendus.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(19,'Quo beatae quis nulla et eum iste voluptates.','Voluptas qui provident ut facere. Quia dolor omnis nobis facere eius numquam. Alias est incidunt fugit aspernatur quod temporibus architecto.','Et repellendus autem aut est neque ea iusto non.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(20,'Incidunt doloribus quis quo rem itaque voluptatem ex et.','Vel earum modi blanditiis qui numquam et. Omnis ipsum qui aperiam occaecati aut nisi. Odio at molestiae earum quia fuga est. Ratione et nemo ratione.','Sit nam odit libero sequi.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(21,'Itaque cum expedita at nostrum.','Soluta quia quo optio qui molestias. Reprehenderit nemo aspernatur nostrum blanditiis. Inventore error repellat cupiditate et qui commodi et. Harum enim sapiente natus qui eos quod enim nihil.','Odio veniam et vel iste aut similique.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(22,'Eos temporibus exercitationem voluptatibus consequatur.','Dolorum mollitia qui autem accusamus. Quasi ab est sit quis quis commodi. Quia consequatur cumque ea minima aut.','Fugit et vitae deleniti quo praesentium eveniet assumenda.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(23,'Reprehenderit tempore quo fugit.','Libero eaque ad rem animi nam et autem. Consequatur et facere magni quo inventore quia. Neque et dolorem odio optio et. Qui unde impedit nihil veritatis reprehenderit.','Unde placeat asperiores deserunt repellendus ipsum fuga.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(24,'Aut consequuntur in necessitatibus.','Optio optio sit cum et minima eveniet. Dolore totam voluptatem veritatis atque. Qui deleniti vel in in nesciunt eaque quasi.','Omnis quos magni libero et ipsum quo facilis molestias.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(25,'Vero perferendis tempore ducimus similique non pariatur id.','Maxime ut et ipsum totam quidem a et. Libero iure recusandae doloribus est. Rerum itaque minima tenetur occaecati minima officia pariatur.','Fugit dolores aut facere autem.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(26,'Saepe et blanditiis nam facilis omnis.','Quis modi id amet omnis quod rerum. Vel nam et ratione et quo quod dolores. Et autem in cumque omnis. Vel dolorum quibusdam consequatur velit. Et omnis ex id ex dolorem adipisci.','Vero velit sint quasi aut accusamus.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(27,'Et ratione voluptas optio accusantium assumenda quo et placeat.','Adipisci non quaerat vero molestiae vitae doloremque. Excepturi cum et nihil itaque aut rerum consequuntur. Saepe alias earum odit.','Asperiores at molestiae veritatis qui et.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(28,'Perspiciatis non quo delectus hic occaecati quibusdam.','Laudantium accusamus ea corrupti sit beatae. Porro fugiat repellat architecto quia voluptatem quos. Commodi et qui aut ut vel laudantium quasi expedita. Sit maxime vero sapiente.','Autem accusantium in nisi sapiente voluptatum.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(29,'Dolorum iure beatae earum.','Dolor nemo laboriosam ducimus unde minus quaerat commodi. Sunt enim adipisci molestiae dolorum facere qui neque. At voluptas est veniam.','Alias beatae quia ipsa numquam ut culpa non.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(30,'Aliquam sapiente ut praesentium.','Suscipit voluptatem architecto velit dolor recusandae. Omnis in quia saepe quis aut occaecati sed pariatur. In et ducimus consequatur pariatur est officia quia.','Voluptate sint fuga voluptate aliquam enim.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(31,'Alias aperiam corrupti sapiente in est inventore aut necessitatibus.','Ut hic quisquam harum dignissimos earum magni. Fugiat illum doloribus fugit eveniet. Voluptatem dolorem ea repellat et.','Sunt quae id voluptas officia provident velit sit reprehenderit.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(32,'Sint cumque porro sit iusto sit error.','Error et sit unde velit beatae ut sunt. Adipisci magni dicta velit qui esse. Sit saepe itaque fugiat quia voluptatibus. Quo ex quasi recusandae totam quod est.','Dolorem illo excepturi eum ut id voluptas.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(33,'Illo eligendi placeat velit sequi nobis fuga.','Rem eius nisi maxime ut aspernatur et maxime. Animi excepturi quia debitis ut deserunt. Quos quaerat qui sit suscipit excepturi.','Vel et earum iure praesentium optio voluptatem consequatur.',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45');

/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(425,'2017_01_23_000003_create_positions_table',1),
	(426,'2017_01_23_000004_create_users_table',1),
	(427,'2017_01_23_000005_create_password_resets_table',1),
	(428,'2017_01_24_102108_create_documents_table',1),
	(429,'2017_01_24_102209_create_document_categories_table',1),
	(430,'2017_01_24_123822_create_pages_table',1),
	(431,'2017_01_24_124803_create_page_categories_table',1),
	(432,'2017_01_24_124836_create_document_tags_table',1),
	(433,'2017_01_24_124845_create_page_tags_table',1),
	(434,'2017_01_24_125446_create_page_category_page_pivot_table',1),
	(435,'2017_01_24_130150_create_page_tag_page_pivot_table',1),
	(436,'2017_01_24_130241_create_document_category_document_pivot_table',1),
	(437,'2017_01_24_141517_create_document_tag_document_pivot_table',1),
	(438,'2017_01_25_092354_entrust_setup_tables',1),
	(439,'2017_02_07_104658_AddPageCategoryDescriptionField',1),
	(440,'2017_02_07_141415_add_deleted_at_column',1),
	(441,'2017_03_06_135809_add_work_week_column',1),
	(442,'2017_03_06_152820_create_timezones_table',1),
	(443,'2017_03_06_153135_add_timezoneId_column',1),
	(444,'2017_03_07_122113_create_welcome_page_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_categories`;

CREATE TABLE `page_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `page_categories` WRITE;
/*!40000 ALTER TABLE `page_categories` DISABLE KEYS */;

INSERT INTO `page_categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'aliquid',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(2,'rerum',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(3,'quia',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(4,'asperiores',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(5,'dolor',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(6,'eligendi',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(7,'et',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(8,'error',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(9,'facere',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(10,'error',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(11,'enim',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(12,'dignissimos',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(13,'velit',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(14,'inventore',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(15,'porro',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(16,'facere',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(17,'ullam',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(18,'officiis',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(19,'et',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(20,'sequi',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(21,'veniam',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(22,'sunt',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(23,'voluptate',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(24,'aliquam',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(25,'non',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(26,'nihil',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(27,'eos',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(28,'quia',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(29,'et',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(30,'sapiente',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(31,'error',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(32,'quia',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(33,'cum',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45',NULL);

/*!40000 ALTER TABLE `page_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table page_category_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_category_page`;

CREATE TABLE `page_category_page` (
  `page_category_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`page_category_id`,`page_id`),
  KEY `page_category_page_page_category_id_index` (`page_category_id`),
  KEY `page_category_page_page_id_index` (`page_id`),
  CONSTRAINT `page_category_page_page_category_id_foreign` FOREIGN KEY (`page_category_id`) REFERENCES `page_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `page_category_page_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table page_tag_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_tag_page`;

CREATE TABLE `page_tag_page` (
  `page_tag_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`page_tag_id`,`page_id`),
  KEY `page_tag_page_page_tag_id_index` (`page_tag_id`),
  KEY `page_tag_page_page_id_index` (`page_id`),
  CONSTRAINT `page_tag_page_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `page_tag_page_page_tag_id_foreign` FOREIGN KEY (`page_tag_id`) REFERENCES `page_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table page_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `page_tags`;

CREATE TABLE `page_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `page_tags` WRITE;
/*!40000 ALTER TABLE `page_tags` DISABLE KEYS */;

INSERT INTO `page_tags` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'quo','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(2,'ea','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(3,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(4,'facere','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(5,'voluptas','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(6,'quis','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(7,'sit','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(8,'ab','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(9,'nam','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(10,'repellat','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(11,'aut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(12,'similique','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(13,'est','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(14,'qui','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(15,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(16,'est','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(17,'non','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(18,'quia','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(19,'natus','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(20,'aut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(21,'odit','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(22,'voluptatibus','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(23,'officiis','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(24,'aperiam','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(25,'soluta','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(26,'aliquam','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(27,'aspernatur','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(28,'aut','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(29,'et','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(30,'fugiat','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(31,'nesciunt','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(32,'eaque','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL),
	(33,'recusandae','2017-03-10 15:36:45','2017-03-10 15:36:45',NULL);

/*!40000 ALTER TABLE `page_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `name`, `content`, `description`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(68,'Veritatis possimus corrupti sed sunt possimus quia.','Et et assumenda similique aperiam quo delectus. Similique cupiditate libero optio animi dolorem assumenda dolore. Omnis esse at modi. Unde necessitatibus sed rerum non ut impedit.','Corrupti officia aut natus tempore.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(69,'Saepe voluptatem voluptatem sit culpa aut sunt pariatur.','Voluptatem voluptatum cumque autem esse nihil. Est eveniet omnis praesentium eum velit eum possimus beatae. Enim aperiam dolorum vitae.','Nihil est exercitationem qui.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(70,'Quidem ut molestiae a qui omnis est.','Deserunt sunt ut repellendus consequuntur et. Ipsam veritatis quibusdam quos corporis. Corrupti atque impedit non animi. Enim magni quia voluptates voluptates sunt vel.','Ea esse quasi veniam delectus cupiditate aliquam perspiciatis numquam.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(71,'Deserunt autem aliquam et tenetur tenetur nulla.','Ut dolores sit commodi. Et eligendi recusandae voluptatem commodi dolor natus eaque aut. Consequatur et nemo dolorem soluta commodi cupiditate ea.','Aperiam provident molestiae eum hic.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(72,'Nemo quo et delectus numquam.','Esse expedita magni quas atque rerum quidem. Dolorum vitae ad et pariatur nam sed. Dolor ut magnam voluptates dolores quaerat. Qui consequatur nam molestiae quo unde voluptatem necessitatibus.','Ex dolore recusandae consectetur aperiam.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(73,'Odit minus in nemo nisi ipsa.','Ut doloremque qui numquam illo vitae adipisci. Dicta quo et voluptas nihil fugiat. Suscipit soluta ut aliquid omnis aut. Est porro consequatur et minus.','In laudantium illo minus corporis facilis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(74,'Quisquam ducimus placeat facere eligendi molestiae.','Quo quo pariatur recusandae saepe eius pariatur quo. Autem molestiae praesentium debitis. Eligendi cupiditate id a asperiores alias sed.','Quam perferendis aspernatur sit praesentium excepturi quo.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(75,'Dolorem illum inventore maxime veniam explicabo error quia.','Nihil tempore assumenda eaque autem. Ut fuga libero voluptatem doloribus. Veritatis dolor dolore beatae aut nihil.','Et nemo nobis dolorem voluptate aut dolores mollitia.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(76,'Consequatur placeat ratione cum provident nisi ut.','Nam voluptatem rem ut voluptate voluptas dolor. Ut ut praesentium fugit vel enim eos. Delectus ipsum et est fuga. Minima et architecto ipsam at sit ut.','Voluptas possimus ut est accusantium aut id.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(77,'Quia quae nesciunt blanditiis reiciendis.','Quaerat praesentium et provident voluptatem. Expedita aperiam numquam nostrum et praesentium omnis ab. Labore dolore dignissimos vel dolorem repudiandae blanditiis atque.','Voluptatem sed et aut.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(78,'Assumenda omnis facere totam enim ut et vitae.','Quibusdam voluptatem aspernatur maiores omnis. Laboriosam illum rerum nulla ut et. Ratione cupiditate voluptatem id excepturi.','Ad error minima non nulla earum.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(79,'Nihil rem adipisci molestias.','Quos id ducimus rerum eveniet. Sint eius dolores autem occaecati. Illo omnis eum quaerat est sed. Ut numquam odio quaerat dolorem ullam qui in.','Quis nulla voluptas minima eum neque eos.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(80,'Dolores accusantium esse ducimus aut.','Aliquam ducimus ullam eos quidem. Earum reprehenderit amet omnis impedit molestiae corrupti nam. Mollitia voluptatem dolore quaerat. Quis iure facere voluptatum mollitia. Rem dicta voluptatem architecto aliquid consequuntur.','Quis ut occaecati omnis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(81,'Sunt accusamus sint nihil eos minima omnis.','Neque rerum ipsam quia deleniti est omnis. Omnis laborum velit illo itaque voluptatem reiciendis veritatis ea. Voluptate aut rerum deleniti est et maxime. Quis tempore recusandae pariatur possimus doloribus.','Et qui in voluptatum laboriosam est nobis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(82,'Distinctio ullam cumque non officiis sed repellat quibusdam.','Rerum consequatur ducimus ut quidem explicabo qui. Voluptatibus iure sequi est quod voluptatibus velit ut aliquam. Quia sequi id autem ut. Omnis aut et dicta aperiam enim rem.','Ut autem id error tempore corrupti veritatis error.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(83,'Sequi consequatur sit voluptatem impedit aut laudantium.','Iusto eum quibusdam voluptatem quasi dicta. Eligendi aliquid rem voluptatibus qui expedita molestiae. Et corrupti cum est quibusdam consequatur. Dolorem cumque et cum molestiae ut optio et.','Porro qui qui nemo qui.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(84,'Dolor rerum ad quia dolores saepe harum.','Deleniti vitae est eligendi animi consequuntur sint adipisci. Quibusdam omnis debitis nemo quae saepe.','Id enim voluptas sed.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(85,'Soluta omnis veritatis animi eum aut et dicta sit.','Laudantium eveniet dolorum explicabo ea itaque. Nemo amet molestiae beatae quidem. Officiis nihil et quaerat ex.','Laborum consequatur optio eum facilis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(86,'Voluptas ab omnis ut aperiam quo ex.','Et qui perferendis repellat quo molestias. Eum ea aut voluptate quisquam molestias nisi iste. Cumque ut repudiandae perspiciatis iusto adipisci praesentium dolores.','Iusto quisquam voluptas est qui iste dolor.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(87,'Ut eius iusto in fuga.','Aut non aperiam velit velit. Aperiam perferendis accusamus praesentium ut. Ea sed sint incidunt.','Et aspernatur assumenda culpa nihil numquam.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(88,'Sapiente et debitis officiis assumenda quos dolorem aliquid labore.','Iusto voluptas veniam numquam vero. Beatae cumque id impedit similique maxime dicta voluptatem. Atque ad id quis possimus voluptatem. Magni libero ad laudantium.','Dolores dignissimos quibusdam qui porro sequi.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(89,'Laudantium explicabo et occaecati soluta autem rem itaque.','Voluptatem laborum omnis dolor est reiciendis earum sint. Labore qui perspiciatis aut fugiat ut reiciendis quos voluptates. Quae id laborum iste dolor quia exercitationem expedita asperiores.','Pariatur nam quo laborum numquam rerum alias dignissimos ut.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(90,'Vitae est assumenda dolor ut unde quas.','Amet dolor placeat saepe illo quaerat dolorem. Omnis accusantium aut quam exercitationem recusandae fugit sunt. Inventore qui aut impedit facere odio.','Et expedita porro qui est quas velit enim minus.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(91,'Qui hic nemo omnis fugit totam sequi.','Inventore hic et nisi. Sed voluptate sed veritatis. Sit non consequatur consequatur placeat ut dolores culpa.','Non autem occaecati eos blanditiis est nostrum cupiditate.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(92,'Ducimus et est sit iste rem esse voluptate.','Incidunt molestiae vero ea nam dolorem. Nulla rerum occaecati facere vel et autem quia. Aliquam error numquam eum. Sit suscipit consequuntur alias quae nostrum aut. Consequuntur neque accusamus qui quisquam fugiat sed fugit.','Rem qui asperiores ut totam magni est quidem.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(93,'Sunt et rerum quia consequatur eos consequuntur expedita perspiciatis.','Ut quidem deserunt dignissimos voluptatibus. Qui et ipsam voluptas autem et sapiente molestiae. Sed molestias totam iusto perferendis.','Et temporibus velit rerum eaque.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(94,'Voluptate temporibus reiciendis sint ratione.','Recusandae consequatur aut molestias dolorem dolores. Qui ex dolores quidem delectus eos qui recusandae dolor. Possimus quo corporis est nisi ipsam. Ea quas voluptatem soluta tempore quae.','Alias qui natus qui debitis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(95,'Doloremque commodi odit sequi rerum suscipit corporis sint.','Et a quibusdam velit explicabo minus ut enim. Est maxime odit optio debitis tenetur praesentium dolorum. Sint sint reiciendis expedita id. Facere nisi eveniet ipsa quaerat.','Laborum qui est in odit ex.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(96,'Aut eius et sunt temporibus totam.','Consectetur dolorem enim sit beatae. Ut et voluptas provident quia. Est explicabo qui repellendus qui culpa. Aspernatur eum cum ipsa. Quia eveniet magni omnis fuga labore velit architecto.','Blanditiis omnis eligendi nihil cum sed corrupti tenetur excepturi.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(97,'Et ut et ipsum ea est a.','Reprehenderit sequi voluptatem et repellat doloremque quae. Temporibus sapiente pariatur quibusdam est. Dignissimos quisquam et officia.','Fuga voluptate nemo blanditiis vitae perspiciatis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(98,'Consequatur soluta quia quo et ipsam inventore.','Possimus recusandae maiores et voluptate. Rerum itaque id non quas qui a. Quae perferendis illo ex qui consequuntur iste temporibus voluptatibus. Illum illo aperiam provident sit aliquam qui necessitatibus laborum.','Accusamus unde rerum tempora ullam.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(99,'Et et aut voluptatem sed.','Itaque repellendus iusto et illo quibusdam enim. Natus quia aut voluptatem molestiae. Ea excepturi cumque cum perspiciatis.','Ipsam voluptas facilis rem hic nisi illum omnis.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25'),
	(100,'Et et ab exercitationem velit aliquam reiciendis quaerat.','Vero doloribus vel possimus tenetur vel aut. Occaecati quo a et deleniti. Rerum distinctio sit aut accusantium. Natus praesentium excepturi cupiditate sed dolore.','Molestiae velit natus omnis facilis sint.',NULL,'2017-03-10 15:47:25','2017-03-10 15:47:25');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;

INSERT INTO `permission_role` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1),
	(52,1),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(67,1),
	(68,1),
	(69,1),
	(70,1),
	(71,1),
	(72,1),
	(73,1),
	(74,1),
	(75,1),
	(76,1),
	(77,1),
	(78,1),
	(79,1),
	(80,1),
	(81,1),
	(82,1),
	(83,1),
	(84,1),
	(85,1),
	(86,1),
	(87,1),
	(88,1),
	(89,1),
	(90,1),
	(91,1),
	(92,1),
	(93,1),
	(94,1),
	(95,1),
	(96,1),
	(97,1),
	(98,1),
	(99,1);

/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'elfinder.index','elfinder.index','Can elfinder.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(2,'elfinder.connector','elfinder.connector','Can elfinder.connector','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(3,'elfinder.popup','elfinder.popup','Can elfinder.popup','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(4,'elfinder.filepicker','elfinder.filepicker','Can elfinder.filepicker','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(5,'elfinder.tinymce','elfinder.tinymce','Can elfinder.tinymce','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(6,'elfinder.tinymce4','elfinder.tinymce4','Can elfinder.tinymce4','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(7,'elfinder.ckeditor','elfinder.ckeditor','Can elfinder.ckeditor','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(8,'impersonate','impersonate','Can impersonate','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(9,'user.index','user.index','Can user.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(10,'user.create','user.create','Can user.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(11,'user.store','user.store','Can user.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(12,'user.show','user.show','Can user.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(13,'user.edit','user.edit','Can user.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(14,'user.update','user.update','Can user.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(15,'user.destroy','user.destroy','Can user.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(16,'role.index','role.index','Can role.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(17,'role.create','role.create','Can role.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(18,'role.store','role.store','Can role.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(19,'role.show','role.show','Can role.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(20,'role.edit','role.edit','Can role.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(21,'role.update','role.update','Can role.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(22,'role.destroy','role.destroy','Can role.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(23,'position.index','position.index','Can position.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(24,'position.create','position.create','Can position.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(25,'position.store','position.store','Can position.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(26,'position.show','position.show','Can position.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(27,'position.edit','position.edit','Can position.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(28,'position.update','position.update','Can position.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(29,'position.destroy','position.destroy','Can position.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(30,'page.index','page.index','Can page.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(31,'page.create','page.create','Can page.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(32,'page.store','page.store','Can page.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(33,'page.show','page.show','Can page.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(34,'page.edit','page.edit','Can page.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(35,'page.update','page.update','Can page.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(36,'page.destroy','page.destroy','Can page.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(37,'document.index','document.index','Can document.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(38,'document.create','document.create','Can document.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(39,'document.store','document.store','Can document.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(40,'document.show','document.show','Can document.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(41,'document.edit','document.edit','Can document.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(42,'document.update','document.update','Can document.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(43,'document.destroy','document.destroy','Can document.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(44,'page-category.index','page-category.index','Can page-category.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(45,'page-category.create','page-category.create','Can page-category.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(46,'page-category.store','page-category.store','Can page-category.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(47,'page-category.show','page-category.show','Can page-category.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(48,'page-category.edit','page-category.edit','Can page-category.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(49,'page-category.update','page-category.update','Can page-category.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(50,'page-category.destroy','page-category.destroy','Can page-category.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(51,'page-tag.index','page-tag.index','Can page-tag.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(52,'page-tag.create','page-tag.create','Can page-tag.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(53,'page-tag.store','page-tag.store','Can page-tag.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(54,'page-tag.show','page-tag.show','Can page-tag.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(55,'page-tag.edit','page-tag.edit','Can page-tag.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(56,'page-tag.update','page-tag.update','Can page-tag.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(57,'page-tag.destroy','page-tag.destroy','Can page-tag.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(58,'document-category.index','document-category.index','Can document-category.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(59,'document-category.create','document-category.create','Can document-category.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(60,'document-category.store','document-category.store','Can document-category.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(61,'document-category.show','document-category.show','Can document-category.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(62,'document-category.edit','document-category.edit','Can document-category.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(63,'document-category.update','document-category.update','Can document-category.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(64,'document-category.destroy','document-category.destroy','Can document-category.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(65,'document-tag.index','document-tag.index','Can document-tag.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(66,'document-tag.create','document-tag.create','Can document-tag.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(67,'document-tag.store','document-tag.store','Can document-tag.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(68,'document-tag.show','document-tag.show','Can document-tag.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(69,'document-tag.edit','document-tag.edit','Can document-tag.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(70,'document-tag.update','document-tag.update','Can document-tag.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(71,'document-tag.destroy','document-tag.destroy','Can document-tag.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(72,'welcome_page.index','welcome_page.index','Can welcome_page.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(73,'welcome_page.create','welcome_page.create','Can welcome_page.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(74,'welcome_page.store','welcome_page.store','Can welcome_page.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(75,'welcome_page.show','welcome_page.show','Can welcome_page.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(76,'welcome_page.edit','welcome_page.edit','Can welcome_page.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(77,'welcome_page.update','welcome_page.update','Can welcome_page.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(78,'welcome_page.destroy','welcome_page.destroy','Can welcome_page.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(79,'file.index','file.index','Can file.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(80,'file.create','file.create','Can file.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(81,'file.store','file.store','Can file.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(82,'file.show','file.show','Can file.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(83,'file.edit','file.edit','Can file.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(84,'file.update','file.update','Can file.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(85,'file.destroy','file.destroy','Can file.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(86,'user.position.index','user.position.index','Can user.position.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(87,'user.position.create','user.position.create','Can user.position.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(88,'user.position.store','user.position.store','Can user.position.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(89,'user.position.show','user.position.show','Can user.position.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(90,'user.position.edit','user.position.edit','Can user.position.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(91,'user.position.update','user.position.update','Can user.position.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(92,'user.position.destroy','user.position.destroy','Can user.position.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(93,'permission.index','permission.index','Can permission.index','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(94,'permission.create','permission.create','Can permission.create','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(95,'permission.store','permission.store','Can permission.store','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(96,'permission.show','permission.show','Can permission.show','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(97,'permission.edit','permission.edit','Can permission.edit','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(98,'permission.update','permission.update','Can permission.update','2017-03-10 15:36:53','2017-03-10 15:36:53'),
	(99,'permission.destroy','permission.destroy','Can permission.destroy','2017-03-10 15:36:53','2017-03-10 15:36:53');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table positions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;

INSERT INTO `positions` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,'CEO','CEO of company',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(2,'Marketer','This is marketer',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(3,'Employee','This is employee',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(4,'hr','HR position',NULL,'2017-03-10 15:36:45','2017-03-10 15:36:45');

/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;

INSERT INTO `role_user` (`user_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,3),
	(4,1),
	(5,1),
	(6,1),
	(7,3),
	(8,3),
	(9,1),
	(10,2),
	(11,3),
	(12,2),
	(13,1),
	(14,2),
	(15,3),
	(16,3),
	(17,2),
	(18,1),
	(19,2),
	(20,3),
	(21,2),
	(22,2),
	(23,2),
	(24,3),
	(25,3),
	(26,1),
	(27,2),
	(28,3),
	(29,3),
	(30,1),
	(31,2),
	(32,3),
	(33,2),
	(34,1),
	(35,3);

/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Admin Role','This is Admin Role','2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(2,'user','User Role','This is user role','2017-03-10 15:36:45','2017-03-10 15:36:45'),
	(3,'employee','Employee Role','This is employee in the system','2017-03-10 15:36:45','2017-03-10 15:36:45');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table timezones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timezones`;

CREATE TABLE `timezones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;

INSERT INTO `timezones` (`id`, `timezone`, `created_at`, `updated_at`)
VALUES
	(1,'Africa/Abidjan (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(2,'Africa/Accra (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(3,'Africa/Addis Ababa (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(4,'Africa/Algiers (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(5,'Africa/Asmara (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(6,'Africa/Bamako (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(7,'Africa/Bangui (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(8,'Africa/Banjul (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(9,'Africa/Bissau (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(10,'Africa/Blantyre (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(11,'Africa/Brazzaville (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(12,'Africa/Bujumbura (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(13,'Africa/Cairo (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(14,'Africa/Casablanca (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(15,'Africa/Ceuta (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(16,'Africa/Conakry (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(17,'Africa/Dakar (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(18,'Africa/Dar es Salaam (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(19,'Africa/Djibouti (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(20,'Africa/Douala (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(21,'Africa/El Aaiun (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(22,'Africa/Freetown (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(23,'Africa/Gaborone (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(24,'Africa/Harare (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(25,'Africa/Johannesburg (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(26,'Africa/Juba (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(27,'Africa/Kampala (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(28,'Africa/Khartoum (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(29,'Africa/Kigali (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(30,'Africa/Kinshasa (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(31,'Africa/Lagos (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(32,'Africa/Libreville (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(33,'Africa/Lome (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(34,'Africa/Luanda (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(35,'Africa/Lubumbashi (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(36,'Africa/Lusaka (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(37,'Africa/Malabo (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(38,'Africa/Maputo (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(39,'Africa/Maseru (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(40,'Africa/Mbabane (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(41,'Africa/Mogadishu (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(42,'Africa/Monrovia (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(43,'Africa/Nairobi (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(44,'Africa/Ndjamena (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(45,'Africa/Niamey (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(46,'Africa/Nouakchott (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(47,'Africa/Ouagadougou (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(48,'Africa/Porto-Novo (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(49,'Africa/Sao Tome (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(50,'Africa/Tripoli (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(51,'Africa/Tunis (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(52,'Africa/Windhoek (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(53,'America/Adak (GMT-10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(54,'America/Anchorage (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(55,'America/Anguilla (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(56,'America/Antigua (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(57,'America/Araguaina (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(58,'America/Argentina/Buenos Aires (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(59,'America/Argentina/Catamarca (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(60,'America/Argentina/Cordoba (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(61,'America/Argentina/Jujuy (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(62,'America/Argentina/La Rioja (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(63,'America/Argentina/Mendoza (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(64,'America/Argentina/Rio Gallegos (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(65,'America/Argentina/Salta (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(66,'America/Argentina/San Juan (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(67,'America/Argentina/San Luis (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(68,'America/Argentina/Tucuman (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(69,'America/Argentina/Ushuaia (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(70,'America/Aruba (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(71,'America/Asuncion (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(72,'America/Atikokan (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(73,'America/Bahia (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(74,'America/Bahia Banderas (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(75,'America/Barbados (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(76,'America/Belem (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(77,'America/Belize (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(78,'America/Blanc-Sablon (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(79,'America/Boa Vista (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(80,'America/Bogota (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(81,'America/Boise (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(82,'America/Cambridge Bay (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(83,'America/Campo Grande (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(84,'America/Cancun (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(85,'America/Caracas (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(86,'America/Cayenne (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(87,'America/Cayman (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(88,'America/Chicago (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(89,'America/Chihuahua (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(90,'America/Costa Rica (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(91,'America/Creston (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(92,'America/Cuiaba (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(93,'America/Curacao (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(94,'America/Danmarkshavn (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(95,'America/Dawson (GMT-8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(96,'America/Dawson Creek (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(97,'America/Denver (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(98,'America/Detroit (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(99,'America/Dominica (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(100,'America/Edmonton (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(101,'America/Eirunepe (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(102,'America/El Salvador (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(103,'America/Fort Nelson (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(104,'America/Fortaleza (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(105,'America/Glace Bay (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(106,'America/Godthab (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(107,'America/Goose Bay (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(108,'America/Grand Turk (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(109,'America/Grenada (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(110,'America/Guadeloupe (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(111,'America/Guatemala (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(112,'America/Guayaquil (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(113,'America/Guyana (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(114,'America/Halifax (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(115,'America/Havana (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(116,'America/Hermosillo (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(117,'America/Indiana/Indianapolis (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(118,'America/Indiana/Knox (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(119,'America/Indiana/Marengo (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(120,'America/Indiana/Petersburg (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(121,'America/Indiana/Tell City (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(122,'America/Indiana/Vevay (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(123,'America/Indiana/Vincennes (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(124,'America/Indiana/Winamac (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(125,'America/Inuvik (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(126,'America/Iqaluit (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(127,'America/Jamaica (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(128,'America/Juneau (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(129,'America/Kentucky/Louisville (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(130,'America/Kentucky/Monticello (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(131,'America/Kralendijk (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(132,'America/La Paz (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(133,'America/Lima (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(134,'America/Los Angeles (GMT-8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(135,'America/Lower Princes (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(136,'America/Maceio (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(137,'America/Managua (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(138,'America/Manaus (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(139,'America/Marigot (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(140,'America/Martinique (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(141,'America/Matamoros (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(142,'America/Mazatlan (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(143,'America/Menominee (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(144,'America/Merida (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(145,'America/Metlakatla (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(146,'America/Mexico City (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(147,'America/Miquelon (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(148,'America/Moncton (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(149,'America/Monterrey (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(150,'America/Montevideo (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(151,'America/Montserrat (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(152,'America/Nassau (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(153,'America/New York (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(154,'America/Nipigon (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(155,'America/Nome (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(156,'America/Noronha (GMT-2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(157,'America/North Dakota/Beulah (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(158,'America/North Dakota/Center (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(159,'America/North Dakota/New Salem (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(160,'America/Ojinaga (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(161,'America/Panama (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(162,'America/Pangnirtung (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(163,'America/Paramaribo (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(164,'America/Phoenix (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(165,'America/Port-au-Prince (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(166,'America/Port of Spain (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(167,'America/Porto Velho (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(168,'America/Puerto Rico (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(169,'America/Rainy River (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(170,'America/Rankin Inlet (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(171,'America/Recife (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(172,'America/Regina (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(173,'America/Resolute (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(174,'America/Rio Branco (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(175,'America/Santarem (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(176,'America/Santiago (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(177,'America/Santo Domingo (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(178,'America/Sao Paulo (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(179,'America/Scoresbysund (GMT-1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(180,'America/Sitka (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(181,'America/St Barthelemy (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(182,'America/St Johns (GMT-4:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(183,'America/St Kitts (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(184,'America/St Lucia (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(185,'America/St Thomas (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(186,'America/St Vincent (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(187,'America/Swift Current (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(188,'America/Tegucigalpa (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(189,'America/Thule (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(190,'America/Thunder Bay (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(191,'America/Tijuana (GMT-8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(192,'America/Toronto (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(193,'America/Tortola (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(194,'America/Vancouver (GMT-8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(195,'America/Whitehorse (GMT-8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(196,'America/Winnipeg (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(197,'America/Yakutat (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(198,'America/Yellowknife (GMT-7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(199,'Antarctica/Casey (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(200,'Antarctica/Davis (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(201,'Antarctica/DumontDUrville (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(202,'Antarctica/Macquarie (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(203,'Antarctica/Mawson (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(204,'Antarctica/McMurdo (GMT+13:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(205,'Antarctica/Palmer (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(206,'Antarctica/Rothera (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(207,'Antarctica/Syowa (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(208,'Antarctica/Troll (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(209,'Antarctica/Vostok (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(210,'Arctic/Longyearbyen (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(211,'Asia/Aden (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(212,'Asia/Almaty (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(213,'Asia/Amman (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(214,'Asia/Anadyr (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(215,'Asia/Aqtau (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(216,'Asia/Aqtobe (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(217,'Asia/Ashgabat (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(218,'Asia/Atyrau (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(219,'Asia/Baghdad (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(220,'Asia/Bahrain (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(221,'Asia/Baku (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(222,'Asia/Bangkok (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(223,'Asia/Barnaul (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(224,'Asia/Beirut (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(225,'Asia/Bishkek (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(226,'Asia/Brunei (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(227,'Asia/Chita (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(228,'Asia/Choibalsan (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(229,'Asia/Colombo (GMT+5:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(230,'Asia/Damascus (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(231,'Asia/Dhaka (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(232,'Asia/Dili (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(233,'Asia/Dubai (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(234,'Asia/Dushanbe (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(235,'Asia/Famagusta (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(236,'Asia/Gaza (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(237,'Asia/Hebron (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(238,'Asia/Ho Chi Minh (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(239,'Asia/Hong Kong (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(240,'Asia/Hovd (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(241,'Asia/Irkutsk (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(242,'Asia/Jakarta (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(243,'Asia/Jayapura (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(244,'Asia/Jerusalem (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(245,'Asia/Kabul (GMT+4:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(246,'Asia/Kamchatka (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(247,'Asia/Karachi (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(248,'Asia/Kathmandu (GMT+5:45)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(249,'Asia/Khandyga (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(250,'Asia/Kolkata (GMT+5:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(251,'Asia/Krasnoyarsk (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(252,'Asia/Kuala Lumpur (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(253,'Asia/Kuching (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(254,'Asia/Kuwait (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(255,'Asia/Macau (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(256,'Asia/Magadan (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(257,'Asia/Makassar (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(258,'Asia/Manila (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(259,'Asia/Muscat (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(260,'Asia/Nicosia (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(261,'Asia/Novokuznetsk (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(262,'Asia/Novosibirsk (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(263,'Asia/Omsk (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(264,'Asia/Oral (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(265,'Asia/Phnom Penh (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(266,'Asia/Pontianak (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(267,'Asia/Pyongyang (GMT+8:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(268,'Asia/Qatar (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(269,'Asia/Qyzylorda (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(270,'Asia/Riyadh (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(271,'Asia/Sakhalin (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(272,'Asia/Samarkand (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(273,'Asia/Seoul (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(274,'Asia/Shanghai (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(275,'Asia/Singapore (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(276,'Asia/Srednekolymsk (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(277,'Asia/Taipei (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(278,'Asia/Tashkent (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(279,'Asia/Tbilisi (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(280,'Asia/Tehran (GMT+3:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(281,'Asia/Thimphu (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(282,'Asia/Tokyo (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(283,'Asia/Tomsk (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(284,'Asia/Ulaanbaatar (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(285,'Asia/Urumqi (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(286,'Asia/Ust-Nera (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(287,'Asia/Vientiane (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(288,'Asia/Vladivostok (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(289,'Asia/Yakutsk (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(290,'Asia/Yangon (GMT+6:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(291,'Asia/Yekaterinburg (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(292,'Asia/Yerevan (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(293,'Atlantic/Azores (GMT-1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(294,'Atlantic/Bermuda (GMT-4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(295,'Atlantic/Canary (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(296,'Atlantic/Cape Verde (GMT-1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(297,'Atlantic/Faroe (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(298,'Atlantic/Madeira (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(299,'Atlantic/Reykjavik (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(300,'Atlantic/South Georgia (GMT-2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(301,'Atlantic/St Helena (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(302,'Atlantic/Stanley (GMT-3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(303,'Australia/Adelaide (GMT+10:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(304,'Australia/Brisbane (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(305,'Australia/Broken Hill (GMT+10:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(306,'Australia/Currie (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(307,'Australia/Darwin (GMT+9:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(308,'Australia/Eucla (GMT+8:45)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(309,'Australia/Hobart (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(310,'Australia/Lindeman (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(311,'Australia/Lord Howe (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(312,'Australia/Melbourne (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(313,'Australia/Perth (GMT+8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(314,'Australia/Sydney (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(315,'Europe/Amsterdam (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(316,'Europe/Andorra (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(317,'Europe/Astrakhan (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(318,'Europe/Athens (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(319,'Europe/Belgrade (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(320,'Europe/Berlin (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(321,'Europe/Bratislava (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(322,'Europe/Brussels (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(323,'Europe/Bucharest (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(324,'Europe/Budapest (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(325,'Europe/Busingen (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(326,'Europe/Chisinau (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(327,'Europe/Copenhagen (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(328,'Europe/Dublin (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(329,'Europe/Gibraltar (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(330,'Europe/Guernsey (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(331,'Europe/Helsinki (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(332,'Europe/Isle of Man (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(333,'Europe/Istanbul (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(334,'Europe/Jersey (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(335,'Europe/Kaliningrad (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(336,'Europe/Kiev (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(337,'Europe/Kirov (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(338,'Europe/Lisbon (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(339,'Europe/Ljubljana (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(340,'Europe/London (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(341,'Europe/Luxembourg (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(342,'Europe/Madrid (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(343,'Europe/Malta (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(344,'Europe/Mariehamn (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(345,'Europe/Minsk (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(346,'Europe/Monaco (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(347,'Europe/Moscow (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(348,'Europe/Oslo (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(349,'Europe/Paris (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(350,'Europe/Podgorica (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(351,'Europe/Prague (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(352,'Europe/Riga (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(353,'Europe/Rome (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(354,'Europe/Samara (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(355,'Europe/San Marino (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(356,'Europe/Sarajevo (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(357,'Europe/Saratov (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(358,'Europe/Simferopol (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(359,'Europe/Skopje (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(360,'Europe/Sofia (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(361,'Europe/Stockholm (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(362,'Europe/Tallinn (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(363,'Europe/Tirane (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(364,'Europe/Ulyanovsk (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(365,'Europe/Uzhgorod (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(366,'Europe/Vaduz (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(367,'Europe/Vatican (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(368,'Europe/Vienna (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(369,'Europe/Vilnius (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(370,'Europe/Volgograd (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(371,'Europe/Warsaw (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(372,'Europe/Zagreb (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(373,'Europe/Zaporozhye (GMT+2:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(374,'Europe/Zurich (GMT+1:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(375,'Indian/Antananarivo (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(376,'Indian/Chagos (GMT+6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(377,'Indian/Christmas (GMT+7:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(378,'Indian/Cocos (GMT+6:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(379,'Indian/Comoro (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(380,'Indian/Kerguelen (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(381,'Indian/Mahe (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(382,'Indian/Maldives (GMT+5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(383,'Indian/Mauritius (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(384,'Indian/Mayotte (GMT+3:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(385,'Indian/Reunion (GMT+4:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(386,'Pacific/Apia (GMT+14:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(387,'Pacific/Auckland (GMT+13:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(388,'Pacific/Bougainville (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(389,'Pacific/Chatham (GMT+13:45)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(390,'Pacific/Chuuk (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(391,'Pacific/Easter (GMT-5:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(392,'Pacific/Efate (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(393,'Pacific/Enderbury (GMT+13:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(394,'Pacific/Fakaofo (GMT+13:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(395,'Pacific/Fiji (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(396,'Pacific/Funafuti (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(397,'Pacific/Galapagos (GMT-6:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(398,'Pacific/Gambier (GMT-9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(399,'Pacific/Guadalcanal (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(400,'Pacific/Guam (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(401,'Pacific/Honolulu (GMT-10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(402,'Pacific/Johnston (GMT-10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(403,'Pacific/Kiritimati (GMT+14:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(404,'Pacific/Kosrae (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(405,'Pacific/Kwajalein (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(406,'Pacific/Majuro (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(407,'Pacific/Marquesas (GMT-10:30)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(408,'Pacific/Midway (GMT-11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(409,'Pacific/Nauru (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(410,'Pacific/Niue (GMT-11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(411,'Pacific/Norfolk (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(412,'Pacific/Noumea (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(413,'Pacific/Pago Pago (GMT-11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(414,'Pacific/Palau (GMT+9:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(415,'Pacific/Pitcairn (GMT-8:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(416,'Pacific/Pohnpei (GMT+11:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(417,'Pacific/Port Moresby (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(418,'Pacific/Rarotonga (GMT-10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(419,'Pacific/Saipan (GMT+10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(420,'Pacific/Tahiti (GMT-10:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(421,'Pacific/Tarawa (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(422,'Pacific/Tongatapu (GMT+13:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(423,'Pacific/Wake (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(424,'Pacific/Wallis (GMT+12:00)','2017-03-10 15:36:46','2017-03-10 15:36:46'),
	(425,'UTC (GMT+0:00)','2017-03-10 15:36:46','2017-03-10 15:36:46');

/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(10) unsigned DEFAULT NULL,
  `superior_id` int(10) unsigned DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` enum('Mr.','Mrs.','Ms.','Prof.','Dr.','Miss') COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_personal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_office` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_work` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_personal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `work_week` enum('Mon-Fri','Sun-Thu') COLLATE utf8_unicode_ci NOT NULL,
  `timezone_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_work_unique` (`email_work`),
  UNIQUE KEY `users_email_personal_unique` (`email_personal`),
  KEY `users_position_id_index` (`position_id`),
  KEY `users_superior_id_index` (`superior_id`),
  KEY `users_timezone_id_index` (`timezone_id`),
  CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_superior_id_foreign` FOREIGN KEY (`superior_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `users_timezone_id_foreign` FOREIGN KEY (`timezone_id`) REFERENCES `timezones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `position_id`, `superior_id`, `first_name`, `last_name`, `title`, `username`, `phone_personal`, `phone_office`, `email_work`, `email_personal`, `password`, `salary`, `last_login`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `work_week`, `timezone_id`)
VALUES
	(1,1,NULL,'Ilia','Bojadzhiev','Mr.','admin',NULL,NULL,'ilia@startupmasters.eu','ilia@startupmasters.eu','$2y$10$aJZofzjih/T4Zhiju.tuhefkpvv3eMkrsy.sR9ilLqrPzJ1XYQAMm',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:46','2017-03-10 15:36:46','Mon-Fri',2),
	(2,2,1,'Alexander','Alexiev','Mr.','employee',NULL,NULL,'ilia1@startupmasters.eu','ilia@2startupmasters.eu','$2y$10$jVGQUYiyLqjlqDBm8DUTOeDuKZyWzWdJ4yhALLKGBZ6XI6r6MjYCK',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:46','2017-03-10 15:36:46','Mon-Fri',2),
	(3,3,1,'Rod','Lueilwitz','Miss','moore.zoe','680.300.3086','696.800.1459 x2562','hilbert.emmerich@gmail.com','mathilde.towne@macejkovic.org','$2y$10$vVdqQZNzoPmSwNHB786BkuDHGyvbA51FmkBu89HgIwZop4/Y7pJwq',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:46','2017-03-10 15:36:46','Mon-Fri',247),
	(4,3,1,'Alexanne','Weber','Miss','kutch.jazmin','530-645-4155 x6208','1-340-758-6613 x360','oschroeder@hansen.org','bernadette10@bergnaum.info','$2y$10$9F6D53qvBCzkeYapEKdhWuAy4Amo2tWP1dsOfre87EQ0.LeRHqRIG',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:47','2017-03-10 15:36:47','Mon-Fri',288),
	(5,3,3,'Georgianna','Bechtelar','Ms.','ellie.oconner','580-669-0278','943.916.3002','wwintheiser@yahoo.com','farmstrong@oconnell.info','$2y$10$7NeS6kI9NISblJBhgSadBOpBkWn8AMQEU1SisxrBKwqj5QThPSifO',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:47','2017-03-10 15:36:47','Mon-Fri',252),
	(6,3,5,'Iliana','Volkman','Mrs.','loyce60','598-668-2814','(994) 701-2645','clang@wolff.com','kling.nathan@okuneva.biz','$2y$10$PYHK2MBsVeJcskfy0MYS4O65v0JtOB.yEHMlKMaYbN4iImr0.YkSa',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:47','2017-03-10 15:36:47','Mon-Fri',391),
	(7,3,2,'Jaquelin','Cummings','Dr.','ischaden','1-286-462-6196 x6779','1-724-770-6446','grover91@gmail.com','rosalyn.christiansen@leuschke.com','$2y$10$SNg0zYfdbyI4qAL.ySxyBuxMQaQEZSDEzzfT2DrSVoe3g.b7s6TUu',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:47','2017-03-10 15:36:47','Mon-Fri',397),
	(8,3,4,'Adelia','Stracke','Prof.','alisa.pagac','883-395-3030 x52750','1-229-464-2083','kterry@bosco.info','nicholas.lind@koelpin.com','$2y$10$UiZLVrIgZEZP1othQWuQ1.xWSaJHBMxh/YfX.B6f7nCjWHsiZxEN.',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:47','2017-03-10 15:36:47','Mon-Fri',289),
	(9,3,1,'Lennie','Sauer','Dr.','zmorissette','745.585.9734 x52516','1-203-521-0656 x2424','wlesch@mcglynn.com','weissnat.christop@volkman.biz','$2y$10$jBqHUGQJKPFv.zDdxkbRXuYkGx2fAd5f9wGXHEo1X/pC..UjB4hRy',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:48','2017-03-10 15:36:48','Mon-Fri',97),
	(10,3,2,'Delia','Ortiz','Mr.','aletha.quigley','1-863-647-1273','1-394-469-0304 x119','katarina.wisoky@simonis.com','hmurray@wisozk.com','$2y$10$.DcGeYz0ZElo.SBQELa/IOdqYe2GhzpHlpB8c9Nshksq.4NJUbM3u',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:48','2017-03-10 15:36:48','Mon-Fri',392),
	(11,3,1,'Armand','Strosin','Prof.','moshe.mertz','785-247-2337 x48835','+1-227-803-2950','pacocha.kenyatta@hotmail.com','toy.runolfsdottir@wolf.info','$2y$10$dLxi.ioyBNaukLQeNmq99OhfljiqjN.JqgN5Jo4cJU2WvDcs3Waoy',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:48','2017-03-10 15:36:48','Mon-Fri',308),
	(12,3,2,'Jefferey','Zboncak','Miss','kenyatta83','849.890.3322 x4516','240.534.7515 x862','bosco.darryl@schimmel.net','eichmann.candace@schulist.com','$2y$10$16JA0ZSqIj.Ga0ZiE2ouSeQDp45wFYV5hYeMn5k7qo3QyJ8xrLVhG',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:48','2017-03-10 15:36:48','Mon-Fri',300),
	(13,3,7,'Julian','Mante','Dr.','zboncak.king','857-779-1610 x42001','+15237013159','karine.oconnell@gmail.com','ana53@fay.org','$2y$10$rLOrfWSZtM0iCngLsqLz2O4bcPvuqsO9kwIKqiiyUwz90DFKcVwKS',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:48','2017-03-10 15:36:48','Mon-Fri',330),
	(14,3,4,'Adam','Daniel','Ms.','dbode','+1.937.795.4132','(212) 581-7673 x127','kstroman@hand.info','deckow.brad@donnelly.biz','$2y$10$HnNjryB2pIRz35Kloy8V7.DwQpHDRPAdvq25wyGadzYNmIE59gmhW',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:49','2017-03-10 15:36:49','Mon-Fri',420),
	(15,3,13,'Allene','Streich','Mr.','crooks.jaiden','(826) 273-2462 x76731','1-313-312-3273','grimes.princess@gmail.com','carmelo38@pollich.info','$2y$10$LvZQRxFh/PFA7gjunfJoGeN.ITdGUVhJSW01RZrm5t/6B4.yiDSi2',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:49','2017-03-10 15:36:49','Mon-Fri',245),
	(16,3,14,'Kathryn','Ritchie','Prof.','wintheiser.amparo','1-574-505-5470','(990) 351-3859','joel.heathcote@hotmail.com','osvaldo.becker@cassin.com','$2y$10$jGcrx37HxOE0QpbVzT1HJOOqHPuj/RhrQjXBbEubfyMRJlbGEEj4O',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:49','2017-03-10 15:36:49','Mon-Fri',333),
	(17,3,1,'Marvin','Mraz','Prof.','kuphal.dulce','(409) 812-4947 x47076','907.516.7351','katheryn.rohan@gmail.com','filomena.heidenreich@dicki.info','$2y$10$9fsf.1Qg7TEUJqroCOa6CuoB6GEMScQ0LCvUtcHLsSlNgXlrB.5Y6',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:49','2017-03-10 15:36:49','Mon-Fri',329),
	(18,3,10,'Erwin','Fisher','Ms.','jenkins.maximo','531-776-5107','1-867-364-9230 x06721','seffertz@roberts.com','fgorczany@metz.org','$2y$10$W1PPfbL5vqdFK9KSc2UmpuIQvGRlD5MkZB/hGhJ5lxG68Y6JSL0pC',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:49','2017-03-10 15:36:49','Mon-Fri',348),
	(19,3,2,'Pearlie','Williamson','Prof.','dibbert.charlene','796-374-0610 x1678','+1 (390) 884-3207','natalie98@gmail.com','noemy.leffler@runte.com','$2y$10$pppdcWN5WqUOiR6NrbtUIuTt6BnuMLt/ognlOUBG5Me9gCH9tIR3G',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:49','2017-03-10 15:36:49','Mon-Fri',321),
	(20,3,11,'Anais','Beahan','Miss','kenya04','1-263-427-0044 x02995','1-215-960-1116 x338','bpfeffer@luettgen.info','casper.sydnee@champlin.org','$2y$10$OrHHckeUwHBvl9yT1lL8zefmLPQGdANMJrG7RYI41voV5UKITkAAG',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:50','2017-03-10 15:36:50','Mon-Fri',157),
	(21,3,16,'Christopher','Reynolds','Mr.','klein.demetrius','+1 (225) 548-4237','(270) 357-1334 x2276','raina24@rath.com','brett18@wiza.com','$2y$10$6kGxMBYxZbeMVnwHcPkn9uNtpUUFEJgwmmO6g86o7Vz2V5x0suX3a',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:50','2017-03-10 15:36:50','Mon-Fri',249),
	(22,3,21,'Demetris','Gutmann','Dr.','connelly.phoebe','1-308-366-0578 x57353','+1-612-268-7680','crona.palma@hotmail.com','rpollich@moore.com','$2y$10$aIJ7W1hqO8Gg8x4aKMf3O.MaUoZIjvqXYuKIjsiFcKBER/QUvJvpu',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:50','2017-03-10 15:36:50','Mon-Fri',277),
	(23,3,18,'Hailee','Johnston','Prof.','connelly.jordan','809-595-1606 x8535','1-549-571-3747 x9235','robel.sophia@stanton.com','bmonahan@weber.org','$2y$10$J6vC8wGEpsn9XjqY6Opv0eJ2NVlQPZNHx3E7v6RUxt95S7sGQzFGO',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:50','2017-03-10 15:36:50','Mon-Fri',144),
	(24,3,23,'Modesta','Becker','Ms.','jschamberger','553.725.9343 x0327','986-904-3220','zstokes@gmail.com','jacynthe.rohan@bayer.com','$2y$10$iQcjAXHPIfMOXfYXAFCfrOq18E0QnoCb8HepR.XgXEyHWgZA/5mY.',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:50','2017-03-10 15:36:50','Mon-Fri',142),
	(25,3,24,'Wilford','Rau','Dr.','alfonso.bode','(621) 699-6483 x1244','858.262.2076 x347','kihn.sabryna@deckow.com','jayda95@feest.com','$2y$10$UgKCZYOliUAfWXX6tIB/fOfc0/pkWts3GnnrSWRDLTLdpJ5A0aTZ2',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:51','2017-03-10 15:36:51','Mon-Fri',94),
	(26,3,16,'Kavon','Kirlin','Mr.','vschoen','1-530-902-0532','703-841-4201','vergie.littel@emard.com','donnell.hoeger@willms.biz','$2y$10$0o3o8nUyEG3DYWOR4Mohpuf.dbJDOjKudNGe1Ygb3auYzad5UHM5K',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:51','2017-03-10 15:36:51','Mon-Fri',342),
	(27,3,23,'Judah','Stark','Prof.','morar.josie','246.622.0221','1-914-446-4641','gbrown@abernathy.org','cheyanne.labadie@deckow.org','$2y$10$GnT7ZQCZWbqnq2wZP/NyW.VD6TmxkEGcPc6.BC9agLfwUjLmbO8uu',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:51','2017-03-10 15:36:51','Mon-Fri',212),
	(28,3,4,'Greyson','Bergstrom','Mr.','bblick','1-576-257-0211','+1 (617) 795-7450','ratke.aurelio@fisher.com','ebrakus@collier.com','$2y$10$DDFZluM8/5mo0sXF5ichPeHut.egmWvKlQyEIsjTQ46gmHFpEcjtC',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:51','2017-03-10 15:36:51','Mon-Fri',416),
	(29,3,17,'Selena','Champlin','Miss','kayley.crona','(716) 534-7432','467-205-2698 x543','raegan49@yahoo.com','alexandro80@simonis.com','$2y$10$6JFP7hZ7k/rfZrr4bBygqur//PCYwoFFQxYIQf43/T0ftoiVNAJK.',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:51','2017-03-10 15:36:51','Mon-Fri',407),
	(30,3,9,'Edwin','Dibbert','Ms.','kariane97','336.415.3027','+1-752-999-0590','cmedhurst@maggio.info','adrienne85@koelpin.net','$2y$10$hBCrHAp1mvDmr6QvZQyyre50/.t2yS//SJABitnTIltDSHtJNdGG6',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:52','2017-03-10 15:36:52','Mon-Fri',188),
	(31,3,20,'Kristofer','Bradtke','Mrs.','maryse15','(691) 886-9032 x48701','+1 (682) 776-6616','cielo59@pouros.com','lexie.bartoletti@treutel.com','$2y$10$0YrhlV6zHg1UkJlchMM5M.NIBa9YxqCxVm2K/hhnmFI8MNK0Erbwq',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:52','2017-03-10 15:36:52','Mon-Fri',201),
	(32,3,8,'Estelle','Gibson','Dr.','schmeler.lucio','371.360.9527','791-361-6533 x189','hans44@hotmail.com','marina69@cummerata.com','$2y$10$6jjlk5OsBaZGYQDTuoO8..jZcyrhXZulZO8e.j6En7ZaJEobgBhyC',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:52','2017-03-10 15:36:52','Mon-Fri',207),
	(33,3,31,'Clarissa','Hane','Dr.','marie16','809.570.5397','+1-406-827-9446','hayes.adelbert@bernier.com','lucius.klein@oreilly.net','$2y$10$JPCAWQC/HSejdiHaPCXcp.1iHFoJu.u2riw1LpPi7vTLVK6kVBqP2',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:52','2017-03-10 15:36:52','Mon-Fri',409),
	(34,3,21,'Wilber','McCullough','Prof.','tatyana.schaden','(242) 338-6000','230.277.8761','eryn02@yahoo.com','paucek.lura@bednar.com','$2y$10$ba92Hfu.sv7ktk3dbkYSN.r5MOPkEmB4nkdUmUOalf4qDErehdvS.',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:52','2017-03-10 15:36:52','Mon-Fri',113),
	(35,3,11,'Lew','Wiegand','Ms.','eloise94','+1.813.819.2731','+1.927.510.0438','scarlett.schowalter@hotmail.com','kessler.aliyah@goldner.com','$2y$10$MrF.35Opon1Bz9.oa7VNzu7F03MlrUSrnr5zFuetn6gFKFyDdl0oq',1000.00,NULL,NULL,NULL,'2017-03-10 15:36:53','2017-03-10 15:36:53','Mon-Fri',395);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table welcome_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `welcome_page`;

CREATE TABLE `welcome_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
