-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tempdb
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `test1_addresses`
--

DROP TABLE IF EXISTS `test1_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_fk_spbyesuufdmtcwbxtfhbfanbytkhgdgvgnnh` (`ownerId`),
  CONSTRAINT `test1_fk_dhfznfzohabutxdidxqrvynugsocgbzsjcxg` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_spbyesuufdmtcwbxtfhbfanbytkhgdgvgnnh` FOREIGN KEY (`ownerId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_announcements`
--

DROP TABLE IF EXISTS `test1_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_riwjggipcipdzxkglgagutsmxvgbqrbbhhwe` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `test1_idx_eyjaugheydxvnygtsadzuqpavodbagavfykx` (`dateRead`),
  KEY `test1_fk_ufvnsucyjeuspfopqjzlmzrnhhaqsloieozl` (`pluginId`),
  CONSTRAINT `test1_fk_lexsjqdnwaeyufdhriecithdhdrsktlmsqxy` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ufvnsucyjeuspfopqjzlmzrnhhaqsloieozl` FOREIGN KEY (`pluginId`) REFERENCES `test1_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_assetindexdata`
--

DROP TABLE IF EXISTS `test1_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_ajqlbhtukxewmzkueuqvgavfyixcztqhuolt` (`sessionId`,`volumeId`),
  KEY `test1_idx_mfmiwbaozzvefsxlegeppivaufnrnvyklroe` (`volumeId`),
  CONSTRAINT `test1_fk_mmchanpraitkwvzgnsjvcuxphmgprqrnfrgf` FOREIGN KEY (`sessionId`) REFERENCES `test1_assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_qklyidsgbhsdtyiabmfgobetzifpsvchfgxm` FOREIGN KEY (`volumeId`) REFERENCES `test1_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_assetindexingsessions`
--

DROP TABLE IF EXISTS `test1_assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8_unicode_ci,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_assets`
--

DROP TABLE IF EXISTS `test1_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8_unicode_ci,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_wtzcywnvsxvtejhrjqrbpxyylzkkmcggnfwc` (`filename`,`folderId`),
  KEY `test1_idx_qyjdyozunuedtpugsknmzomvvizposepwwyu` (`folderId`),
  KEY `test1_idx_gdwqhqilgqtcckanilfrmkgcglsoprgsynad` (`volumeId`),
  KEY `test1_fk_mhlaroavntzfolklwrzpakxxmituyvkhmpqz` (`uploaderId`),
  CONSTRAINT `test1_fk_ejzqqbijyrivtbfggrleqffyjfvlyfbrrfdc` FOREIGN KEY (`volumeId`) REFERENCES `test1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_mhlaroavntzfolklwrzpakxxmituyvkhmpqz` FOREIGN KEY (`uploaderId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_mhrvmzrynwqsfcpifmixhrkydrgpntomyxbz` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_xwspaqtrusfprbyhzcuzkgrtskuhapiahedl` FOREIGN KEY (`folderId`) REFERENCES `test1_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_categories`
--

DROP TABLE IF EXISTS `test1_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_gofqrhnonmjjefwguentqzokhucinzqhpwuo` (`groupId`),
  KEY `test1_fk_kqnomemhsvundhprthqctqgyfejctzpxoeti` (`parentId`),
  CONSTRAINT `test1_fk_kqnomemhsvundhprthqctqgyfejctzpxoeti` FOREIGN KEY (`parentId`) REFERENCES `test1_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_qhpailfpgyatadtmivwxpkrwmnquwakgwaxi` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_vcvyxvnlljlgefqbaqeqjvfbhpbpudwxfomq` FOREIGN KEY (`groupId`) REFERENCES `test1_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_categorygroups`
--

DROP TABLE IF EXISTS `test1_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_arovttnpgvxpyelwviiegczlvtfvhnsqymvv` (`name`),
  KEY `test1_idx_wazpkfrieaubkysxlqchoepmcfmolfxslwds` (`handle`),
  KEY `test1_idx_uyoszabbawncdbbxbhevhydrkieibsomuzvk` (`structureId`),
  KEY `test1_idx_lsioklcwuzpqwhfxqivnblssptsztakptkap` (`fieldLayoutId`),
  KEY `test1_idx_mbsaqhbyirrwlbrtqdcgvhtwalvaisufsdwe` (`dateDeleted`),
  CONSTRAINT `test1_fk_awiammlgxuqabvihnfvcturzvukvstihswyd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_yiwpnfsdstnqyosdlxtcdvubcyamysgzuekf` FOREIGN KEY (`structureId`) REFERENCES `test1_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_categorygroups_sites`
--

DROP TABLE IF EXISTS `test1_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_wfexyxgzxdgnxgeoqwgealovqwwxacxkpkrc` (`groupId`,`siteId`),
  KEY `test1_idx_vhpeecnroluceiocygnffrmueazvobcxpldj` (`siteId`),
  CONSTRAINT `test1_fk_dbfzguqnsrhijmhzfarivqkctgnefosjjtry` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_hqtxedaittiaekgrsbpipfqwblnhugpprwrn` FOREIGN KEY (`groupId`) REFERENCES `test1_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_changedattributes`
--

DROP TABLE IF EXISTS `test1_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `test1_idx_buvcuxrbhebaakbopvryulspdggmaylulprh` (`elementId`,`siteId`,`dateUpdated`),
  KEY `test1_fk_ybxnpjbrayzqcpuqjufxpuikxellvgiiroag` (`siteId`),
  KEY `test1_fk_mhqwbibfkjanusibcjtzlwoqdvbnpxajyell` (`userId`),
  CONSTRAINT `test1_fk_mhqwbibfkjanusibcjtzlwoqdvbnpxajyell` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_mrojbbdrnevcyycewyccjjxuugzyuqphnsfc` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_ybxnpjbrayzqcpuqjufxpuikxellvgiiroag` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_changedfields`
--

DROP TABLE IF EXISTS `test1_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `test1_idx_wxpidjtaoclvtikiicufycecymlregwzzptg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `test1_fk_jfjorwmbgaetwficvxaxoqalbglkesghxboc` (`siteId`),
  KEY `test1_fk_mslvzmkueagrnwufbjxidaihxhpeajprodic` (`fieldId`),
  KEY `test1_fk_ouqrorwjrrwjzdbrwqbegiegrudshqcoutmk` (`userId`),
  CONSTRAINT `test1_fk_fecvbjdkfnskwwnyaunrulnhpbmgqdlknglf` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_jfjorwmbgaetwficvxaxoqalbglkesghxboc` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_mslvzmkueagrnwufbjxidaihxhpeajprodic` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_ouqrorwjrrwjzdbrwqbegiegrudshqcoutmk` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_content`
--

DROP TABLE IF EXISTS `test1_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_subtitle_dhznaisy` varchar(240) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_blxkzgigusxmxvgrjpajalcbuljktftpekys` (`elementId`,`siteId`),
  KEY `test1_idx_audwuhbzotztqzkpbfverqzpdmbeskbkxlqz` (`siteId`),
  KEY `test1_idx_blqydatqtqnegvzgobqlqiaqqsxcrudizpfy` (`title`),
  CONSTRAINT `test1_fk_bxfkznwgumivkefvvnyegnseqmtgeecwciei` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_xhftwgebqwmfyahzntixjfqexeqhjahwegib` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_craftidtokens`
--

DROP TABLE IF EXISTS `test1_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_fk_pwqawwhexevaorgayimhyqodrymvseivctby` (`userId`),
  CONSTRAINT `test1_fk_pwqawwhexevaorgayimhyqodrymvseivctby` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_deprecationerrors`
--

DROP TABLE IF EXISTS `test1_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_tknfpiilxbiqfccvmkelkwuvwjawhtjbtcdj` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_drafts`
--

DROP TABLE IF EXISTS `test1_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `test1_idx_lzuczzrjptvvefxxmbmfwlcaszqgldrhlgdl` (`creatorId`,`provisional`),
  KEY `test1_idx_mnkdygwvdamxgomrmkkcyosunkjbyrultqkv` (`saved`),
  KEY `test1_fk_mpjsmghpubrqiiampzljqvmgxbceqktflheg` (`canonicalId`),
  CONSTRAINT `test1_fk_mpjsmghpubrqiiampzljqvmgxbceqktflheg` FOREIGN KEY (`canonicalId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_rbyrqlbhtitqjujzrsuuvzgilkiytzfonzrg` FOREIGN KEY (`creatorId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_elements`
--

DROP TABLE IF EXISTS `test1_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_gcecuxdiitwmehsgtbctvatjmhjmdjsxditn` (`dateDeleted`),
  KEY `test1_idx_lzovjcyecfoppubdzsmjiyvmwthlkwcffsuj` (`fieldLayoutId`),
  KEY `test1_idx_zdhzdiceilutamihwnpnskyjjszkovenknaf` (`type`),
  KEY `test1_idx_wvnnzayswlxqnwteisbpizkzmzkvphnrakhl` (`enabled`),
  KEY `test1_idx_llelgtcmltttxatopqomhucynmsptdqwdevq` (`archived`,`dateCreated`),
  KEY `test1_idx_bfsmzefpmpofskmvvtjtjbgfrsvjxdtfrqcv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `test1_idx_abuuezsifcnotxoplmhpqtdtqmkebwdlsrdk` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `test1_fk_jdjsgozffxuetmzmyqdiywjxddwtrnqnxmjp` (`canonicalId`),
  KEY `test1_fk_qzkqvrjmuptotqzlfhnxmgbbcycgppcdfalv` (`draftId`),
  KEY `test1_fk_kklbernfwljfllssveoxkwdmpzntrpjvyoju` (`revisionId`),
  CONSTRAINT `test1_fk_jdjsgozffxuetmzmyqdiywjxddwtrnqnxmjp` FOREIGN KEY (`canonicalId`) REFERENCES `test1_elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_kklbernfwljfllssveoxkwdmpzntrpjvyoju` FOREIGN KEY (`revisionId`) REFERENCES `test1_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_qzkqvrjmuptotqzlfhnxmgbbcycgppcdfalv` FOREIGN KEY (`draftId`) REFERENCES `test1_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_yvwalblsmwxjbalnbzmsxerrqikeanstxvlg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_elements_sites`
--

DROP TABLE IF EXISTS `test1_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_jgcdnfdvsuhaqlcpnljqizjzalslfpucryui` (`elementId`,`siteId`),
  KEY `test1_idx_ngyzrjhixukftslelicfjhfifllwwqukmjcf` (`siteId`),
  KEY `test1_idx_tvytktfhslkbgowkzqlsyzyxxrkpymvqzzsp` (`slug`,`siteId`),
  KEY `test1_idx_csxlhepmopfbofeeoiysjkbjzdpnfirvhpyw` (`enabled`),
  KEY `test1_idx_kevjxykqqtkfwvpgtkgvfjcgxjptlaftrpmb` (`uri`,`siteId`),
  CONSTRAINT `test1_fk_faybthwseowfckhyewdfomubfwwunniucaor` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_vranzfddormqlirbxofxttynvyrdciypjaay` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_entries`
--

DROP TABLE IF EXISTS `test1_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_aiywrdbtwzxwrhvyjqvarycwusnjiaqbiqdu` (`postDate`),
  KEY `test1_idx_jnjrwgrpehulaspobibhbrstynzhgdxkmryd` (`expiryDate`),
  KEY `test1_idx_wlzafycdtxudinfdiponmbssefbwzgdnshpo` (`authorId`),
  KEY `test1_idx_zdzglferznykhajdlzfmgelbqmsyosdwsydt` (`sectionId`),
  KEY `test1_idx_wigdebcmkemftccurhfrigjhtnprhnentmjh` (`typeId`),
  KEY `test1_fk_isdguacrqaltqzkuqluufzvydxtixyaztgrt` (`parentId`),
  CONSTRAINT `test1_fk_ebvyfztqzramxzgeqhbpdtithfyryudvgrep` FOREIGN KEY (`sectionId`) REFERENCES `test1_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_isdguacrqaltqzkuqluufzvydxtixyaztgrt` FOREIGN KEY (`parentId`) REFERENCES `test1_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_pcmjrtueyhgyjbcxemhijoibpzpzkeblnkmi` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_pcqgcpfzuqjiqsfkiozlnsnnimfjphdtvchk` FOREIGN KEY (`authorId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_tbttrkehobodvtdhaujnseeoxwzetbebztrt` FOREIGN KEY (`typeId`) REFERENCES `test1_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_entrytypes`
--

DROP TABLE IF EXISTS `test1_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_wmngzpvwkmeqpeuynypuocsmyedgwfbmlowl` (`name`,`sectionId`),
  KEY `test1_idx_ymspcqbuvuzxwqhomnmxzdcvwpmtmlemwobp` (`handle`,`sectionId`),
  KEY `test1_idx_fwbjokzusqcwslguxnsybwjewjbqzgjzdmed` (`sectionId`),
  KEY `test1_idx_iqlmgwqvossuyivjlcifpsqvawurxubcxekj` (`fieldLayoutId`),
  KEY `test1_idx_splmthvqrkfgygawpehnsldqsdzqtdqkueqy` (`dateDeleted`),
  CONSTRAINT `test1_fk_kevwhqzuhlfbffszdoamrztwwippgxodyurm` FOREIGN KEY (`sectionId`) REFERENCES `test1_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ufwohsqxoqgiqssvrwsioqyrzomugrbgzixf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_fieldgroups`
--

DROP TABLE IF EXISTS `test1_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_layclzhhxudabrcmkeqyfpwcfpxnaldqslad` (`name`),
  KEY `test1_idx_qlwqgsczexyzsfbeqhppglijdsotnncwatbf` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_fieldlayoutfields`
--

DROP TABLE IF EXISTS `test1_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_oobiceyrquukvqzybaptltxstmivvoievwif` (`layoutId`,`fieldId`),
  KEY `test1_idx_fjneigsuovidxbuzmjaxmhdaoveubvrfnfsx` (`sortOrder`),
  KEY `test1_idx_ijbeipbseidmpufjjywqcgcfmdlsgogowcsy` (`tabId`),
  KEY `test1_idx_tjdalhjqumbjiqfspdmniicxiahrzbjcqprm` (`fieldId`),
  CONSTRAINT `test1_fk_jimaszpgbuwegugnpocivndgfxrktqaklqjb` FOREIGN KEY (`tabId`) REFERENCES `test1_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_mwcijmnrboowsssfudwagjhceqfqccjakxfs` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_uxfbfgdmjltsjehxwfdeieitjwrterpuizdr` FOREIGN KEY (`layoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_fieldlayouts`
--

DROP TABLE IF EXISTS `test1_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_atzwdwqbhcetdyjzfljawpraivbgkgmlunmz` (`dateDeleted`),
  KEY `test1_idx_qnnkqpryzkwxvnitlaoveesvprvfyuwzkpct` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_fieldlayouttabs`
--

DROP TABLE IF EXISTS `test1_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_cxnmuhcjxlcvvnjikhrlrvmydwotdmivfnfr` (`sortOrder`),
  KEY `test1_idx_kiopduirnjtfafwwsoibcyjzssnnsklyvhhu` (`layoutId`),
  CONSTRAINT `test1_fk_snofwsllcokuhnnglrsjokalyqsaaevlroml` FOREIGN KEY (`layoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_fields`
--

DROP TABLE IF EXISTS `test1_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_qjbyqxcjcwskciiajqkawrbpnollxcvyeojn` (`handle`,`context`),
  KEY `test1_idx_tlwnywjvleambnfmyazkyddgfljsnofhoofh` (`groupId`),
  KEY `test1_idx_muzfgnikpbbdwktgeksmivismthambbvdixz` (`context`),
  CONSTRAINT `test1_fk_ihtabyrvrfibembfmkksbczhavmlquuaogbp` FOREIGN KEY (`groupId`) REFERENCES `test1_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_globalsets`
--

DROP TABLE IF EXISTS `test1_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_olkzplxsvqmimeylpmpcavgxciblxoszgkck` (`name`),
  KEY `test1_idx_yftbfxiwyjcykdvpbpricpawdfzfnnwdgxlc` (`handle`),
  KEY `test1_idx_tlediulkqxmmpoxikntcbyqusnyvofbrjrsu` (`fieldLayoutId`),
  KEY `test1_idx_kepywidcwowjlumromogrzbiiyicjseznsrr` (`sortOrder`),
  CONSTRAINT `test1_fk_alpbcnivxuvkoczjnezcilpnpsxkmvgigjzw` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ryeyemttosawtphcwgrvikdtmubzrdocnyrb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_gqlschemas`
--

DROP TABLE IF EXISTS `test1_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_gqltokens`
--

DROP TABLE IF EXISTS `test1_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_rupmxnqxanjkpnyntlyodqqbmgmwevtnqoka` (`accessToken`),
  UNIQUE KEY `test1_idx_yohnxzjbdejldyycmmanaayfwezdbyutoeap` (`name`),
  KEY `test1_fk_zjuhahbbjszbdnodnbyuvkbtgtuplnepcazw` (`schemaId`),
  CONSTRAINT `test1_fk_zjuhahbbjszbdnodnbyuvkbtgtuplnepcazw` FOREIGN KEY (`schemaId`) REFERENCES `test1_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_imagetransformindex`
--

DROP TABLE IF EXISTS `test1_imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_dvwaezzdaeahxtgnbhwfysjfxkvmnokhtevd` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_imagetransforms`
--

DROP TABLE IF EXISTS `test1_imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_jtslejiwutwlhmxzcohvxxuiyonzkvdfcwpj` (`name`),
  KEY `test1_idx_fuylewnevcoyfnghnfdivcnsoscyuluyaxiq` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_info`
--

DROP TABLE IF EXISTS `test1_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_matrixblocks`
--

DROP TABLE IF EXISTS `test1_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_rqbqjnexzwujeivmbsahrswynfohmxgvamct` (`primaryOwnerId`),
  KEY `test1_idx_bnqbwgjirzjieirhnccfyxokpavttyamyqyn` (`fieldId`),
  KEY `test1_idx_sriommdcocwzcaocvnxsyacoxrdusfkyvpbl` (`typeId`),
  CONSTRAINT `test1_fk_gkhzkkoflwnwikfuttrcxiucsutqrfnduymi` FOREIGN KEY (`typeId`) REFERENCES `test1_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_mptslksdegbhkzxvzbaiulnpctimvelprwor` FOREIGN KEY (`primaryOwnerId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_pymbuyjeeiedhobbbtdpnjprbxnovtaihaoi` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_zcxhlyhymjbdxobkuwfanlzsucyjtyoapflb` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_matrixblocks_owners`
--

DROP TABLE IF EXISTS `test1_matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `test1_fk_rzhnrqnkdwlxpmljrlyqdpmifjjhoqcpevcv` (`ownerId`),
  CONSTRAINT `test1_fk_poylywnhnlszzrxhxuvxnzdlquwtqqxitzyu` FOREIGN KEY (`blockId`) REFERENCES `test1_matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_rzhnrqnkdwlxpmljrlyqdpmifjjhoqcpevcv` FOREIGN KEY (`ownerId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_matrixblocktypes`
--

DROP TABLE IF EXISTS `test1_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_lmvqcwpvdbwqkstakkfvusjtptlzunxfqmzq` (`name`,`fieldId`),
  KEY `test1_idx_oytrgaokrxcmoplyqurdbdjmdhncxgsakjem` (`handle`,`fieldId`),
  KEY `test1_idx_ahbmdpkcpeuyeiidaesqzhshuvgbcgffgmgt` (`fieldId`),
  KEY `test1_idx_gfsgyiojvphbonsnoiftzojgnbgnjnnynbps` (`fieldLayoutId`),
  CONSTRAINT `test1_fk_rklrnokxdzkfeqbslpjqamhggxnroxwtqpvx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_zvcmxoyueoeeixznyczcvpjbuuhnzltvrqgm` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_migrations`
--

DROP TABLE IF EXISTS `test1_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_xvpkylbgpybkkayvxivdhdfwqlgzadfsliwm` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_plugins`
--

DROP TABLE IF EXISTS `test1_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_jhufpxeezwaaztmkmbmgzrkucpeowplueuvi` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_projectconfig`
--

DROP TABLE IF EXISTS `test1_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_queue`
--

DROP TABLE IF EXISTS `test1_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `test1_idx_isysuwdfutknqliyyocjnkyizcctrfyreets` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `test1_idx_drlpaddxriwocogkrgmvpkgoomcumngifadk` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_relations`
--

DROP TABLE IF EXISTS `test1_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_sbjigfthnwxliewkcyrtwpudjrhfhmgbxitu` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `test1_idx_cgygxczegtnraaedoxnxjehktltkvbcwhvcw` (`sourceId`),
  KEY `test1_idx_kqmozjfjexszpmhoefwyqnverbclqafefkuo` (`targetId`),
  KEY `test1_idx_qmvaqhujhqfiovtfmkkeoirfcgfjdrohwiry` (`sourceSiteId`),
  CONSTRAINT `test1_fk_gdvbjlgzewraczofefwhourfmwnrfhdcwuct` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_kseshicfsqwgesmtcjtxlmgxyulvyrolcfti` FOREIGN KEY (`sourceSiteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_prlctyqhezolhlkjegtbznqhywnxbewfnygp` FOREIGN KEY (`sourceId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_vjrlsgdacmlveuvzprurttlnkhncyvgudoyf` FOREIGN KEY (`targetId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_resourcepaths`
--

DROP TABLE IF EXISTS `test1_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_revisions`
--

DROP TABLE IF EXISTS `test1_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_sulyokidjgurjmoforpkrhihrerbtjnupvvi` (`canonicalId`,`num`),
  KEY `test1_fk_nbcwvngrypcpcvrveiheocrifebgahhkjzny` (`creatorId`),
  CONSTRAINT `test1_fk_cpaeujtumgzfirnihxsuwqlscgnmqsktggck` FOREIGN KEY (`canonicalId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_nbcwvngrypcpcvrveiheocrifebgahhkjzny` FOREIGN KEY (`creatorId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_searchindex`
--

DROP TABLE IF EXISTS `test1_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `test1_idx_qjjudbovqgxgbwryzqlajvdhdvertezxstbr` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_sections`
--

DROP TABLE IF EXISTS `test1_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_opjakotygsfthzhmziwezfzstiauxzzquucd` (`handle`),
  KEY `test1_idx_rqxamicvqqrbwegkysyyrsqkmvwlxccnmvwu` (`name`),
  KEY `test1_idx_xtiwfzroijhvbsbixeutfkjfrxlfpvhoisww` (`structureId`),
  KEY `test1_idx_zhqfronitvtxhfcbxcweffwmfhjstpezznoo` (`dateDeleted`),
  CONSTRAINT `test1_fk_zcbqentyzsqelhjwaauicscnnltzpuzifbrq` FOREIGN KEY (`structureId`) REFERENCES `test1_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_sections_sites`
--

DROP TABLE IF EXISTS `test1_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_qugxewqqygdygpejlucdadfleorwvnapckpk` (`sectionId`,`siteId`),
  KEY `test1_idx_txeqmdkyjfdnjzwdoypqgrldofxerawzopcj` (`siteId`),
  CONSTRAINT `test1_fk_dcyiyekuejreyppyfpgcugosolzrqdvkrleu` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_ybekyrfokwlpooyksnjjcdbybghtgvjkyahb` FOREIGN KEY (`sectionId`) REFERENCES `test1_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_sequences`
--

DROP TABLE IF EXISTS `test1_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_sessions`
--

DROP TABLE IF EXISTS `test1_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_yewibbbngumfcnemoxdwjqhbardtvguhehpp` (`uid`),
  KEY `test1_idx_tqbzfzzzomyftydzqxepwoivnrtydojvuexm` (`token`),
  KEY `test1_idx_srkwaavlkdbwpzkvumxtcsunzlvicuxkujqu` (`dateUpdated`),
  KEY `test1_idx_atbmtimwzscrvfwlpvdmmpbyvqqpoxcsoqcy` (`userId`),
  CONSTRAINT `test1_fk_ibuteqtkrndseguvkznjjwxpfntseynkxfzr` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_shunnedmessages`
--

DROP TABLE IF EXISTS `test1_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_wvvjyakvgzodzyezfrrezhcrddnzgsxruila` (`userId`,`message`),
  CONSTRAINT `test1_fk_lnkuhsxurpvxjdlpsgbpgffznqqiqxwpjikq` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_sitegroups`
--

DROP TABLE IF EXISTS `test1_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_ygotqalczmnujviecdvzhbxlwvzbgdasfehy` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_sites`
--

DROP TABLE IF EXISTS `test1_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_jsnyzfjwkncyspxfhahgbirdnybjlnwodqma` (`dateDeleted`),
  KEY `test1_idx_ilyipckeeetkslwjtotxcizyfdcwddjyxclb` (`handle`),
  KEY `test1_idx_mjjpwlqjrucazqgaggfwalpxlzckzfdgqcul` (`sortOrder`),
  KEY `test1_fk_tgasdvcbhbjpcoyprhwnfgvlphkbykmxlvpb` (`groupId`),
  CONSTRAINT `test1_fk_tgasdvcbhbjpcoyprhwnfgvlphkbykmxlvpb` FOREIGN KEY (`groupId`) REFERENCES `test1_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_structureelements`
--

DROP TABLE IF EXISTS `test1_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_mnkdfrwxocryknmqmcghgzanbuppauagcqbg` (`structureId`,`elementId`),
  KEY `test1_idx_qncvrleusenlsshnqsaibllrsvkodlbsqkdq` (`root`),
  KEY `test1_idx_waqkvjcwwqwezstvsehtzwzsuyayeyfwylby` (`lft`),
  KEY `test1_idx_bnhfvcfumqmxqfwwphhmkwbrfgbjzemklxfg` (`rgt`),
  KEY `test1_idx_auchdnomelwldcdjlagyygyagsfyqmbnjjpe` (`level`),
  KEY `test1_idx_ggqwmohfsopmfnmeekvocuxsbxsnuwbmocgz` (`elementId`),
  CONSTRAINT `test1_fk_sejrlglndqhgsrjlmaurgtlgifmfaehdoxda` FOREIGN KEY (`structureId`) REFERENCES `test1_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_vbhpczdvgakyseuvkzsiqbywclzesdybboci` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_structures`
--

DROP TABLE IF EXISTS `test1_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_bmysbuiwnzfwvueoovskacnocehfsjrnjooa` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_systemmessages`
--

DROP TABLE IF EXISTS `test1_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_grccpooauxplrukvyamwbghmughmegqjeeuh` (`key`,`language`),
  KEY `test1_idx_xgfrfpgakybscprmvvzoavtixmxtadbuecos` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_taggroups`
--

DROP TABLE IF EXISTS `test1_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_muyxjfdbegtyxecjjfalazsjqcbhrlhcitkx` (`name`),
  KEY `test1_idx_hfqibkfpnxzvlsgexvonaneotzspdkuosmkr` (`handle`),
  KEY `test1_idx_hikyomuzxzwgpcjpuqcekttgbfodztxsfifa` (`dateDeleted`),
  KEY `test1_fk_pgzfshajwuhzkdxxoirnvxpmulbppflnwiyx` (`fieldLayoutId`),
  CONSTRAINT `test1_fk_pgzfshajwuhzkdxxoirnvxpmulbppflnwiyx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_tags`
--

DROP TABLE IF EXISTS `test1_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_jtxkbiizsyskoxtpefgjusrfmeqrmfdjoqpw` (`groupId`),
  CONSTRAINT `test1_fk_socbcufyhyflszaxpwfxvrlozaksxnrxmttb` FOREIGN KEY (`groupId`) REFERENCES `test1_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_wxdcstaoiahxhzgvomxskgjxdjwfpvgvfugv` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_tokens`
--

DROP TABLE IF EXISTS `test1_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_fwjybhkqfrhwiwlniwrgatqmlkwskvkfhqlo` (`token`),
  KEY `test1_idx_pnetqnbxcptaighxrlwxjdsamcdbtrdnxhqi` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_usergroups`
--

DROP TABLE IF EXISTS `test1_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_fatvnqfgmkrgvjgsbujuwelktrlcfonzrzqe` (`handle`),
  KEY `test1_idx_tiwvvxpearjjectnyeytdfhlgmljvrddqzdn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_usergroups_users`
--

DROP TABLE IF EXISTS `test1_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_aojneuuchhsenwxyfuzaxhuxigtokxtnriks` (`groupId`,`userId`),
  KEY `test1_idx_xfhepjcdprdcjmoabgclrcolxqndesfhbhrp` (`userId`),
  CONSTRAINT `test1_fk_aqvepfyjonlfbmxzfxgeszfxvfevaypukqfv` FOREIGN KEY (`groupId`) REFERENCES `test1_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_csymrpftmrxvcrxkwosuprkkjxkbteqicdce` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_userpermissions`
--

DROP TABLE IF EXISTS `test1_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_rzsubhffeilahkkcdijvoiyjmcvlzlltlakg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `test1_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_fjmfpsejfzegcluofbxisurhvefdeeskcngp` (`permissionId`,`groupId`),
  KEY `test1_idx_hbguidnuqcwxuhqyblnjgqxwddlrdaypkoxw` (`groupId`),
  CONSTRAINT `test1_fk_glpgziqlpxvzjujakhppbjwyjitibkytxdtu` FOREIGN KEY (`permissionId`) REFERENCES `test1_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_zhfkkapxqpargggqyqliqjasibfxqcfyrmch` FOREIGN KEY (`groupId`) REFERENCES `test1_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_userpermissions_users`
--

DROP TABLE IF EXISTS `test1_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_lozgbonvxmxpaqhmtxpuqpdwazkuvabjyfdu` (`permissionId`,`userId`),
  KEY `test1_idx_nlwoxmdhoqxvtpeadnfbpwvkhijmmytfogkf` (`userId`),
  CONSTRAINT `test1_fk_nfmeocairnqamtdbjrikbszawazaieqnynua` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_wpzpboxcyguurhlqdopddxqnhesrktdqyokq` FOREIGN KEY (`permissionId`) REFERENCES `test1_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_userpreferences`
--

DROP TABLE IF EXISTS `test1_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `test1_fk_bzsmllnnzgxvvodbxqwryzecawolfpmaftqw` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_users`
--

DROP TABLE IF EXISTS `test1_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_idx_ovwpexafmtnotmlpokkzbkhsfqtnugidanfa` (`active`),
  KEY `test1_idx_fhycbhovqcnludxhesgiweebhgxmgekdnmak` (`locked`),
  KEY `test1_idx_tqrjogjuackbjonnrrpaygyldmlagrkmbgoo` (`pending`),
  KEY `test1_idx_xraegpnaljkgxzddehtjydvpabbgrjumchak` (`suspended`),
  KEY `test1_idx_pjcgyrexnrwnkixvrpldblwhygtuqgbstlkq` (`verificationCode`),
  KEY `test1_idx_klkkombzrdnorfwkyfvtqpdybvnjlcirmabf` (`email`),
  KEY `test1_idx_wbalwcojtwszjzaumdzgepcajtgrkyxqqvag` (`username`),
  KEY `test1_fk_miircdlurcieikyujwxfwtbvqeoffusfcozh` (`photoId`),
  CONSTRAINT `test1_fk_diijmgqflxhamjndqrtfzxbwqtyospxsujbl` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_miircdlurcieikyujwxfwtbvqeoffusfcozh` FOREIGN KEY (`photoId`) REFERENCES `test1_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_volumefolders`
--

DROP TABLE IF EXISTS `test1_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test1_idx_leezitywewwzuraaqilsaoqcrpgmjozpmglj` (`name`,`parentId`,`volumeId`),
  KEY `test1_idx_oqlzvizyhyvewocrowlawocfhkarzajmnqlp` (`parentId`),
  KEY `test1_idx_eqpmqozrgohcvljwvozpdqiafuppfrbbhmov` (`volumeId`),
  CONSTRAINT `test1_fk_farfxveezmtbowdkfdnaqmfazocmzmjrihiy` FOREIGN KEY (`volumeId`) REFERENCES `test1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_nspxjgbcptfdwhjfottmqeivkdcgfhvrisej` FOREIGN KEY (`parentId`) REFERENCES `test1_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_volumes`
--

DROP TABLE IF EXISTS `test1_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transformFs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_eqzuthmxadlzatkokfolrrldaiszovuhbdkf` (`name`),
  KEY `test1_idx_imlvxulcxhydytcqrhiatavhlchdxlcherts` (`handle`),
  KEY `test1_idx_afcrbmuhcvlppzzmtbrcwacexohozoievgsj` (`fieldLayoutId`),
  KEY `test1_idx_qghjdpwixcfiwcrbtkzsiudylufiaodbpyns` (`dateDeleted`),
  CONSTRAINT `test1_fk_tgxwysefajjbeazoodtwbjfzmfkxjcpodhdd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test1_widgets`
--

DROP TABLE IF EXISTS `test1_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `test1_idx_mfwrxzbckmawvledhzfwksywtastynylrenn` (`userId`),
  CONSTRAINT `test1_fk_gupwofjmiidaighoyojtzlibiqdfclvosskx` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'tempdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 10:42:59
-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tempdb
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `test1_addresses`
--

LOCK TABLES `test1_addresses` WRITE;
/*!40000 ALTER TABLE `test1_addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_announcements`
--

LOCK TABLES `test1_announcements` WRITE;
/*!40000 ALTER TABLE `test1_announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_assetindexingsessions`
--

LOCK TABLES `test1_assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `test1_assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_assets`
--

LOCK TABLES `test1_assets` WRITE;
/*!40000 ALTER TABLE `test1_assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_categories`
--

LOCK TABLES `test1_categories` WRITE;
/*!40000 ALTER TABLE `test1_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_categorygroups`
--

LOCK TABLES `test1_categorygroups` WRITE;
/*!40000 ALTER TABLE `test1_categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_categorygroups_sites`
--

LOCK TABLES `test1_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `test1_categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_changedattributes`
--

LOCK TABLES `test1_changedattributes` WRITE;
/*!40000 ALTER TABLE `test1_changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_changedfields`
--

LOCK TABLES `test1_changedfields` WRITE;
/*!40000 ALTER TABLE `test1_changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_content`
--

LOCK TABLES `test1_content` WRITE;
/*!40000 ALTER TABLE `test1_content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_content` VALUES (1,1,1,NULL,'2022-03-23 09:34:38','2022-03-23 09:34:38','64581c66-3e5c-4782-9048-01d67e030ea0',NULL);
/*!40000 ALTER TABLE `test1_content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_craftidtokens`
--

LOCK TABLES `test1_craftidtokens` WRITE;
/*!40000 ALTER TABLE `test1_craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_deprecationerrors`
--

LOCK TABLES `test1_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `test1_deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_drafts`
--

LOCK TABLES `test1_drafts` WRITE;
/*!40000 ALTER TABLE `test1_drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_elements`
--

LOCK TABLES `test1_elements` WRITE;
/*!40000 ALTER TABLE `test1_elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-03-23 09:34:38','2022-03-23 09:34:38',NULL,NULL,'1f1a12be-2742-4167-9b63-e958fc82847d');
/*!40000 ALTER TABLE `test1_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_elements_sites`
--

LOCK TABLES `test1_elements_sites` WRITE;
/*!40000 ALTER TABLE `test1_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-03-23 09:34:38','2022-03-23 09:34:38','26180af0-44da-46e2-9992-0170eb2ad847');
/*!40000 ALTER TABLE `test1_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_entries`
--

LOCK TABLES `test1_entries` WRITE;
/*!40000 ALTER TABLE `test1_entries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_entrytypes`
--

LOCK TABLES `test1_entrytypes` WRITE;
/*!40000 ALTER TABLE `test1_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2022-03-23 09:34:38','2022-03-23 09:34:38',NULL,'4a999130-ec31-4481-bbcb-8071860220aa');
/*!40000 ALTER TABLE `test1_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldgroups`
--

LOCK TABLES `test1_fieldgroups` WRITE;
/*!40000 ALTER TABLE `test1_fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldgroups` VALUES (1,'Common','2022-03-23 09:34:37','2022-03-23 09:34:37',NULL,'e2900beb-7302-4b94-aae5-721985c45ab7');
/*!40000 ALTER TABLE `test1_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldlayoutfields`
--

LOCK TABLES `test1_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `test1_fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldlayoutfields` VALUES (2,1,2,1,0,1,'2022-03-23 09:34:38','2022-03-23 09:34:38','1fb6a75c-d54d-41df-8d1a-6a39111d45f6');
/*!40000 ALTER TABLE `test1_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldlayouts`
--

LOCK TABLES `test1_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `test1_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-03-23 09:34:38','2022-03-23 09:34:38',NULL,'1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb');
/*!40000 ALTER TABLE `test1_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldlayouttabs`
--

LOCK TABLES `test1_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `test1_fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldlayouttabs` VALUES (2,1,'Content','[]','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"bd9a714f-20cd-4aed-a53f-277bbfc8ce6c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"d8ec8ca8-d619-4aa6-8e7e-7f18f09cdaec\",\"fieldUid\":\"61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba\"}]',1,'2022-03-23 09:34:38','2022-03-23 09:34:38','d3e31cae-dfa6-43d0-b99d-0be95af47507');
/*!40000 ALTER TABLE `test1_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fields`
--

LOCK TABLES `test1_fields` WRITE;
/*!40000 ALTER TABLE `test1_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fields` VALUES (1,1,'Subtitle','subtitle','global','dhznaisy','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":60,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-03-23 09:34:37','2022-03-23 09:34:37','61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba');
/*!40000 ALTER TABLE `test1_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_globalsets`
--

LOCK TABLES `test1_globalsets` WRITE;
/*!40000 ALTER TABLE `test1_globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_gqlschemas`
--

LOCK TABLES `test1_gqlschemas` WRITE;
/*!40000 ALTER TABLE `test1_gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_gqltokens`
--

LOCK TABLES `test1_gqltokens` WRITE;
/*!40000 ALTER TABLE `test1_gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_imagetransforms`
--

LOCK TABLES `test1_imagetransforms` WRITE;
/*!40000 ALTER TABLE `test1_imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_info`
--

LOCK TABLES `test1_info` WRITE;
/*!40000 ALTER TABLE `test1_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_info` VALUES (1,'4.0.0-beta.3','4.0.0.7',0,'tjbrbpwkhvww','3@iwjssjhqhl','2022-03-23 09:34:37','2022-03-23 09:34:38','84a2a3f9-0cef-4bb8-a765-aa120846c2ff');
/*!40000 ALTER TABLE `test1_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_matrixblocks`
--

LOCK TABLES `test1_matrixblocks` WRITE;
/*!40000 ALTER TABLE `test1_matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_matrixblocks_owners`
--

LOCK TABLES `test1_matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `test1_matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_matrixblocktypes`
--

LOCK TABLES `test1_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `test1_matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_migrations`
--

LOCK TABLES `test1_migrations` WRITE;
/*!40000 ALTER TABLE `test1_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_migrations` VALUES (1,'craft','Install','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','3dcb006c-b1dc-4361-bf0f-789a535df494'),(2,'craft','m210121_145800_asset_indexing_changes','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','54d31924-6484-40a9-8a1e-8cee4d901516'),(3,'craft','m210624_222934_drop_deprecated_tables','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','6ee14298-4cee-4309-9407-171ccdaef68e'),(4,'craft','m210724_180756_rename_source_cols','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','8b840804-f5d7-4e7b-8366-37910a8ad471'),(5,'craft','m210809_124211_remove_superfluous_uids','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','b4ae98af-bd2d-45e7-8411-348bcf6f90ab'),(6,'craft','m210817_014201_universal_users','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','9261e43e-7db6-44a2-9c2a-208589f0fb70'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','5213a2e2-68fd-4486-a5c9-2b09c9467d23'),(8,'craft','m211115_135500_image_transformers','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','931f7817-a7dd-4560-8603-e3cff5b52a57'),(9,'craft','m211201_131000_filesystems','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','937fa321-c1a6-472c-a793-6df8987c607e'),(10,'craft','m220103_043103_tab_conditions','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','c6a583f0-6d0d-467f-8ea9-1909e1050962'),(11,'craft','m220104_003433_asset_alt_text','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','c071d8b1-b573-434e-a00f-576d94f1bbb5'),(12,'craft','m220123_213619_update_permissions','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','2a85090a-c527-4ad7-8685-67ff04ad1a44'),(13,'craft','m220126_003432_addresses','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','0e17f190-421c-49dd-b6f3-cceda2f3fa23'),(14,'craft','m220209_095604_add_indexes','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','c0529eda-64a8-4e1a-a5d4-70fe08cb60e1'),(15,'craft','m220213_015220_matrixblocks_owners_table','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','a6459789-b561-4d6d-98ac-929a09dd312e'),(16,'craft','m220214_000000_truncate_sessions','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','8f065faa-8d3a-4d3f-acce-befb82381cb8'),(17,'craft','m220222_122159_full_names','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','a7e84e32-6271-437b-9e2b-25e1f02468d9'),(18,'craft','m220223_180559_nullable_address_owner','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','c7533190-104f-4f8f-814a-b58f0bab6050'),(19,'craft','m220225_165000_transform_filesystems','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','a8111efc-bcc6-4e99-a73c-32bd16b3a97c'),(20,'craft','m220309_152006_rename_field_layout_elements','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','9a41d1d7-3bec-4acb-81e6-5428df81985b'),(21,'craft','m220314_211928_field_layout_element_uids','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','c4368001-d573-4809-a893-943cff156aac'),(22,'craft','m220316_123800_transform_fs_subpath','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','ca70cd96-d413-4d62-9fac-13c1f3b94cd7'),(23,'craft','m220317_174250_release_all_jobs','2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:34:38','e84725ea-a3c2-4818-bc97-81c970cdf082');
/*!40000 ALTER TABLE `test1_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_plugins`
--

LOCK TABLES `test1_plugins` WRITE;
/*!40000 ALTER TABLE `test1_plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_projectconfig`
--

LOCK TABLES `test1_projectconfig` WRITE;
/*!40000 ALTER TABLE `test1_projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_projectconfig` VALUES ('dateModified','1648028078'),('email.fromEmail','\"admin@test1.local\"'),('email.fromName','\"Test1\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.autocapitalize','true'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.autocomplete','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.autocorrect','true'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.class','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.disabled','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.id','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.instructions','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.label','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.max','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.min','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.name','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.orientation','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.placeholder','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.readonly','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.requirable','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.size','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.step','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.tip','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.title','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.warning','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.width','100'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.fieldUid','\"61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.instructions','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.label','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.required','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.tip','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.warning','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.width','100'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.name','\"Content\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.sortOrder','1'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.handle','\"default\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.hasTitleField','true'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.name','\"Default\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.section','\"5c9808eb-172a-43c0-8843-dfb056e3236a\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.sortOrder','1'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.titleFormat','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.titleTranslationKeyFormat','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.titleTranslationMethod','\"site\"'),('fieldGroups.e2900beb-7302-4b94-aae5-721985c45ab7.name','\"Common\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.columnSuffix','\"dhznaisy\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.contentColumnType','\"string(240)\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.fieldGroup','\"e2900beb-7302-4b94-aae5-721985c45ab7\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.handle','\"subtitle\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.instructions','\"\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.name','\"Subtitle\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.searchable','false'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.byteLimit','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.charLimit','60'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.code','\"\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.columnType','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.initialRows','\"4\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.multiline','\"\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.placeholder','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.uiMode','\"normal\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.translationKeyFormat','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.translationMethod','\"none\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.type','\"craft\\\\fields\\\\PlainText\"'),('meta.__names__.0ce07eb2-b257-4e4d-a6db-73e8a2de9726','\"Test1\"'),('meta.__names__.4a999130-ec31-4481-bbcb-8071860220aa','\"Default\"'),('meta.__names__.4ff0b93e-899f-459d-b8f9-8da9c87bbde0','\"Test1\"'),('meta.__names__.5c9808eb-172a-43c0-8843-dfb056e3236a','\"Page\"'),('meta.__names__.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba','\"Subtitle\"'),('meta.__names__.e2900beb-7302-4b94-aae5-721985c45ab7','\"Common\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.defaultPlacement','\"end\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.enableVersioning','true'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.handle','\"page\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.name','\"Page\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.propagationMethod','\"all\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.enabledByDefault','true'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.hasUrls','true'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.template','\"page/_entry\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.uriFormat','\"page/{slug}\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.type','\"channel\"'),('siteGroups.4ff0b93e-899f-459d-b8f9-8da9c87bbde0.name','\"Test1\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.enabled','true'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.handle','\"default\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.hasUrls','true'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.language','\"en-US\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.name','\"Test1\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.primary','true'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.siteGroup','\"4ff0b93e-899f-459d-b8f9-8da9c87bbde0\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Test1\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.0.0.7\"'),('system.timeZone','\"Europe/Berlin\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `test1_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_queue`
--

LOCK TABLES `test1_queue` WRITE;
/*!40000 ALTER TABLE `test1_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_relations`
--

LOCK TABLES `test1_relations` WRITE;
/*!40000 ALTER TABLE `test1_relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_revisions`
--

LOCK TABLES `test1_revisions` WRITE;
/*!40000 ALTER TABLE `test1_revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_searchindex`
--

LOCK TABLES `test1_searchindex` WRITE;
/*!40000 ALTER TABLE `test1_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_searchindex` VALUES (1,'username',0,1,' admin '),(1,'fullname',0,1,''),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'email',0,1,' admin test1 local '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `test1_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sections`
--

LOCK TABLES `test1_sections` WRITE;
/*!40000 ALTER TABLE `test1_sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sections` VALUES (1,NULL,'Page','page','channel',1,'all','end',NULL,'2022-03-23 09:34:38','2022-03-23 09:34:38',NULL,'5c9808eb-172a-43c0-8843-dfb056e3236a');
/*!40000 ALTER TABLE `test1_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sections_sites`
--

LOCK TABLES `test1_sections_sites` WRITE;
/*!40000 ALTER TABLE `test1_sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sections_sites` VALUES (1,1,1,1,'page/{slug}','page/_entry',1,'2022-03-23 09:34:38','2022-03-23 09:34:38','546a8203-395a-4977-bf95-82e5c120f7ee');
/*!40000 ALTER TABLE `test1_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sequences`
--

LOCK TABLES `test1_sequences` WRITE;
/*!40000 ALTER TABLE `test1_sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_shunnedmessages`
--

LOCK TABLES `test1_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `test1_shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sitegroups`
--

LOCK TABLES `test1_sitegroups` WRITE;
/*!40000 ALTER TABLE `test1_sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sitegroups` VALUES (1,'Test1','2022-03-23 09:34:37','2022-03-23 09:34:37',NULL,'4ff0b93e-899f-459d-b8f9-8da9c87bbde0');
/*!40000 ALTER TABLE `test1_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sites`
--

LOCK TABLES `test1_sites` WRITE;
/*!40000 ALTER TABLE `test1_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sites` VALUES (1,1,1,1,'Test1','default','en-US',1,'$PRIMARY_SITE_URL',1,'2022-03-23 09:34:37','2022-03-23 09:34:37',NULL,'0ce07eb2-b257-4e4d-a6db-73e8a2de9726');
/*!40000 ALTER TABLE `test1_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_structureelements`
--

LOCK TABLES `test1_structureelements` WRITE;
/*!40000 ALTER TABLE `test1_structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_structures`
--

LOCK TABLES `test1_structures` WRITE;
/*!40000 ALTER TABLE `test1_structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_systemmessages`
--

LOCK TABLES `test1_systemmessages` WRITE;
/*!40000 ALTER TABLE `test1_systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_taggroups`
--

LOCK TABLES `test1_taggroups` WRITE;
/*!40000 ALTER TABLE `test1_taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_tags`
--

LOCK TABLES `test1_tags` WRITE;
/*!40000 ALTER TABLE `test1_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_tokens`
--

LOCK TABLES `test1_tokens` WRITE;
/*!40000 ALTER TABLE `test1_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_usergroups`
--

LOCK TABLES `test1_usergroups` WRITE;
/*!40000 ALTER TABLE `test1_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_usergroups_users`
--

LOCK TABLES `test1_usergroups_users` WRITE;
/*!40000 ALTER TABLE `test1_usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_userpermissions`
--

LOCK TABLES `test1_userpermissions` WRITE;
/*!40000 ALTER TABLE `test1_userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_userpermissions_usergroups`
--

LOCK TABLES `test1_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `test1_userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_userpermissions_users`
--

LOCK TABLES `test1_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `test1_userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_userpreferences`
--

LOCK TABLES `test1_userpreferences` WRITE;
/*!40000 ALTER TABLE `test1_userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `test1_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_users`
--

LOCK TABLES `test1_users` WRITE;
/*!40000 ALTER TABLE `test1_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'admin@test1.local','$2y$13$1HPRlcsg3AiKn4ToisXr2.cdCHr7ybtcfjq7qe.A5dma9W5cQ9Knq','2022-03-23 09:35:03',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-03-23 09:34:38','2022-03-23 09:34:38','2022-03-23 09:35:03');
/*!40000 ALTER TABLE `test1_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_volumefolders`
--

LOCK TABLES `test1_volumefolders` WRITE;
/*!40000 ALTER TABLE `test1_volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_volumes`
--

LOCK TABLES `test1_volumes` WRITE;
/*!40000 ALTER TABLE `test1_volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_widgets`
--

LOCK TABLES `test1_widgets` WRITE;
/*!40000 ALTER TABLE `test1_widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-03-23 09:35:03','2022-03-23 09:35:03','2a754c63-ae3a-48cc-84af-4ba19bfd253d'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-03-23 09:35:03','2022-03-23 09:35:03','f253e996-1cf6-401e-aed4-ba11e055c12e'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-03-23 09:35:03','2022-03-23 09:35:03','4cdba6e1-2b7e-4a15-be8c-a049278cabbc'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-03-23 09:35:03','2022-03-23 09:35:03','446b2f2f-1f75-49ba-bf3f-b408dabceea2');
/*!40000 ALTER TABLE `test1_widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'tempdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 10:43:00
