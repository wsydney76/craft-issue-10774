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
  KEY `test1_fk_xzwiseamqwwijpxacltnplxsezigdtetvvwz` (`ownerId`),
  CONSTRAINT `test1_fk_ubjoqqmjuigosrqhljkxtkmwscybdquzlrrg` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_xzwiseamqwwijpxacltnplxsezigdtetvvwz` FOREIGN KEY (`ownerId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_anxpqjveonmovcavmzewwcjdbyffylqydyzd` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `test1_idx_ehdczatdebbpervzcgoyvyuwtafcnzaxphst` (`dateRead`),
  KEY `test1_fk_qyiqrgrgtpdeptinnebjilfnfxjdlbnrzhvr` (`pluginId`),
  CONSTRAINT `test1_fk_eilsvcmnmssdphumqgixnlnusicddlksivou` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_qyiqrgrgtpdeptinnebjilfnfxjdlbnrzhvr` FOREIGN KEY (`pluginId`) REFERENCES `test1_plugins` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_bbcichfxryvrjqgkkfrfzvrhugygkxgnlmez` (`volumeId`),
  KEY `test1_idx_bygkzhwkqxbgsoildfvlykwevlywxyikehoo` (`volumeId`),
  KEY `test1_fk_vvnfmjoeeetcgqmghugcveztsbvicfkxzvqt` (`sessionId`),
  CONSTRAINT `test1_fk_carpkoedcyjbkrxfmepcqnpzalmwdryqsfzg` FOREIGN KEY (`volumeId`) REFERENCES `test1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_vvnfmjoeeetcgqmghugcveztsbvicfkxzvqt` FOREIGN KEY (`sessionId`) REFERENCES `test1_assetindexingsessions` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_nzqjagmdhrysswfafjinooeuhahczmnecygj` (`filename`,`folderId`),
  KEY `test1_idx_aqzkulcueqpdabbdpveojtovxxojbhzulzzp` (`folderId`),
  KEY `test1_idx_abppmzxrvjuggmouxavotepzfofvpvvtffit` (`volumeId`),
  KEY `test1_fk_ohlqyqegourvgpkiwqfbvtwejvliovuvisqd` (`uploaderId`),
  CONSTRAINT `test1_fk_kcokiljpmgpumjqxinjdwsorhjfefdzqhfbf` FOREIGN KEY (`volumeId`) REFERENCES `test1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_mxobmvezgoniewjithyovbjurebdqiwlqnyz` FOREIGN KEY (`folderId`) REFERENCES `test1_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_nipuzfunynbjvguoouaurwyfjsmwvirvbcjf` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ohlqyqegourvgpkiwqfbvtwejvliovuvisqd` FOREIGN KEY (`uploaderId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL
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
  KEY `test1_idx_shrgoxulkadspusxtrnxorcahtigfhcrtqsn` (`groupId`),
  KEY `test1_fk_jcyvgyxvvypakxjovqlbtqzjicnplwunedwy` (`parentId`),
  CONSTRAINT `test1_fk_jcyvgyxvvypakxjovqlbtqzjicnplwunedwy` FOREIGN KEY (`parentId`) REFERENCES `test1_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_lpzksgrnjfacrymtyqlbxgbbygurauvpjtpp` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_slygcvbnqhzrliqyhpqxvihymxltdqmclnzn` FOREIGN KEY (`groupId`) REFERENCES `test1_categorygroups` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_zjdegwtgxeccljdmtvmbmxwburjzgiwmbpqw` (`name`),
  KEY `test1_idx_tgobkdulawpjyiyflrlvqdxjmnvqkzayrnkf` (`handle`),
  KEY `test1_idx_jcmtzaqnrujxdlochdgyxifaimsasfmhrxwb` (`structureId`),
  KEY `test1_idx_fraugfqfqhwlsusbynpfrousrhoaosxfhztq` (`fieldLayoutId`),
  KEY `test1_idx_tzihygfrjqxmoasuyoehclvrossgsxgcdzxv` (`dateDeleted`),
  CONSTRAINT `test1_fk_eaapnlqjdvsjzpdoznmcfmluadmfrxsfuoau` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_zgmefuudamhbrofcmzmrertrgkbwitltrzfc` FOREIGN KEY (`structureId`) REFERENCES `test1_structures` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_uozwarofhacegdrkaindwcyzcogqfyjohqkt` (`groupId`,`siteId`),
  KEY `test1_idx_wbihtjvqytblplfplxcklfhbuzcubcjeudqm` (`siteId`),
  CONSTRAINT `test1_fk_wskynnbmodinlrktomdonxzncgbresjnfzfm` FOREIGN KEY (`groupId`) REFERENCES `test1_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_zzokrnbkpauzqbxmcokoyololvrfdukmvslc` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  KEY `test1_idx_pdquthkwmvkhrkhtjsnxmvrmeskoijtrqxcv` (`elementId`,`siteId`,`dateUpdated`),
  KEY `test1_fk_szynmwlwuscaoakhyxaziwbrttkgpavctcyd` (`siteId`),
  KEY `test1_fk_opiesaxfxtzgxqsdlzogovefoopadirjtjxb` (`userId`),
  CONSTRAINT `test1_fk_opiesaxfxtzgxqsdlzogovefoopadirjtjxb` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_szynmwlwuscaoakhyxaziwbrttkgpavctcyd` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_wbggwzhdpxdhtfgixvodpbbkrklamnoawfke` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  KEY `test1_idx_yeinbydszpvgxjclsskckmkuvqqqfeaowoue` (`elementId`,`siteId`,`dateUpdated`),
  KEY `test1_fk_uvpsmmqdmlnaanphhuinjftupfoatzuzdzei` (`siteId`),
  KEY `test1_fk_xwferaatbihjsdlwnwuohujhmfuameqaqfxc` (`fieldId`),
  KEY `test1_fk_oxitykwwlrcserntiknbqkljelduwsqgbwnz` (`userId`),
  CONSTRAINT `test1_fk_nretidsacjhmhhwfwzlxtukzvwrrvlengjtk` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_oxitykwwlrcserntiknbqkljelduwsqgbwnz` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_uvpsmmqdmlnaanphhuinjftupfoatzuzdzei` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_xwferaatbihjsdlwnwuohujhmfuameqaqfxc` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  UNIQUE KEY `test1_idx_pgaaerinmqiljplyialhiakzcsgxdvufccns` (`elementId`,`siteId`),
  KEY `test1_idx_oxwoybgtxzzxyppyzbzplyjkcqkilmuussxv` (`siteId`),
  KEY `test1_idx_rhhlfqlqbycpebqudwmhdksswlhpnxjqdukn` (`title`),
  CONSTRAINT `test1_fk_albrtamzsuafrzmodphshrxmajgaxpgiefoz` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_jwcodbntivjaprrbyjcghbejfrceqbkgqcdi` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  KEY `test1_fk_fbewdgmfzyqsuozbveiwhlyxvwnpfwkftqam` (`userId`),
  CONSTRAINT `test1_fk_fbewdgmfzyqsuozbveiwhlyxvwnpfwkftqam` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_xgjubrbfnhmljteqvshxfamrrkumolgnzxds` (`key`,`fingerprint`)
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
  KEY `test1_idx_jgsshdiegpsfurrhufnshfcwrlciibnhwmel` (`creatorId`,`provisional`),
  KEY `test1_idx_dqddotjyfttzxxtpittkekmycpnyicgxpvnd` (`saved`),
  KEY `test1_fk_wqanvkzogndpxxkknbbiinvykvybvzubcgze` (`canonicalId`),
  CONSTRAINT `test1_fk_lfaskhibfzturbscojostaueptxmcktboyss` FOREIGN KEY (`creatorId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_wqanvkzogndpxxkknbbiinvykvybvzubcgze` FOREIGN KEY (`canonicalId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  KEY `test1_idx_pzsjyleibxsawgyspkvljpglolcvsczudqeo` (`dateDeleted`),
  KEY `test1_idx_qhwenbziqlbvwhpbgzccyqstlmvtutryoyzt` (`fieldLayoutId`),
  KEY `test1_idx_bgfmydmwdyfckinjsqnnjvbwpmqtkrrtbojv` (`type`),
  KEY `test1_idx_qrknrmkjvgbjvfpqaqrhllqjegkzekheyywa` (`enabled`),
  KEY `test1_idx_grdpmxsspthomzzhiukhryfbhbbpvauwlmpy` (`archived`,`dateCreated`),
  KEY `test1_idx_rubuebpyivmhzgxvwthqszxvngzqyaebxbfg` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `test1_idx_wafazebjpxlggogtwjllzegphvfbldrjzgsq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `test1_fk_xaahrbdkyphsbaldlhrflolpxnwzzegcpnjq` (`canonicalId`),
  KEY `test1_fk_juuycwjhkvvpnnycbpvlzmtaquichgtpbxbk` (`draftId`),
  KEY `test1_fk_mnqwywwdgvrpcvefspuewiffnrmfdoakqdeh` (`revisionId`),
  CONSTRAINT `test1_fk_haguotyvqakmdscuddststynmtfqxdgygzdo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_juuycwjhkvvpnnycbpvlzmtaquichgtpbxbk` FOREIGN KEY (`draftId`) REFERENCES `test1_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_mnqwywwdgvrpcvefspuewiffnrmfdoakqdeh` FOREIGN KEY (`revisionId`) REFERENCES `test1_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_xaahrbdkyphsbaldlhrflolpxnwzzegcpnjq` FOREIGN KEY (`canonicalId`) REFERENCES `test1_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `test1_idx_gypttmvpjoigvcsikyzlfmnhtzlrsshqpxhi` (`elementId`,`siteId`),
  KEY `test1_idx_lzdmizldjuocwmpmmyppajilmthgvdtwtocn` (`siteId`),
  KEY `test1_idx_xbvtboqatebaztxtxqsmccajrwbvehqmzbht` (`slug`,`siteId`),
  KEY `test1_idx_fwrkevzpbwxxqfppozkmktnwsuuhwmshdfol` (`enabled`),
  KEY `test1_idx_tbouqkbqrnzduqvcaiiwyoodupsqxdaqunoo` (`uri`,`siteId`),
  CONSTRAINT `test1_fk_knexucryovkvrzqtmfukcqrkaocnpgmytizv` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_tybkhfxikdomnrowmmnkrxkhieqpaogdnpfw` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  KEY `test1_idx_ianyinvzfwruljduwsgtqovbhnaynelstxuf` (`postDate`),
  KEY `test1_idx_ymnsjxqqcinbfvfilnyrbsnfahcxkqdmzkkj` (`expiryDate`),
  KEY `test1_idx_gfetuxuxhlunqfijsbzrbwaypntljkhncotf` (`authorId`),
  KEY `test1_idx_zeblswkjrszgzsbqprrlvwxmumlzfteyqfrr` (`sectionId`),
  KEY `test1_idx_dzcwcfmrkhyhugjzzojfreinfznnaonhpmvy` (`typeId`),
  KEY `test1_fk_grbfijunyibmlnxdnogbfgvoeeajnmkvolnm` (`parentId`),
  CONSTRAINT `test1_fk_boafyuoybfwypabptjphmkrejhyntexufqxu` FOREIGN KEY (`sectionId`) REFERENCES `test1_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_grbfijunyibmlnxdnogbfgvoeeajnmkvolnm` FOREIGN KEY (`parentId`) REFERENCES `test1_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_rhmgzpujvlhgvflwblxoglxtjfdhqewqnmxv` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_seltkwsehcfwtudngmsqhwbbxhxgqebovxdz` FOREIGN KEY (`typeId`) REFERENCES `test1_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_whwcddzdqvcgjqbtvrfioglfcwklyeiqrkic` FOREIGN KEY (`authorId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL
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
  KEY `test1_idx_wvvvaghenpssdjmljslctnmeddrdxvaizglj` (`name`,`sectionId`),
  KEY `test1_idx_cdluchbjrdysvovrqdrysentdtzkiqhtrroz` (`handle`,`sectionId`),
  KEY `test1_idx_zraouqqfqffxbywpucoynvwjbdkdlxjeybli` (`sectionId`),
  KEY `test1_idx_htrcptuwtecwdsealbworaylejgqktzmzyxi` (`fieldLayoutId`),
  KEY `test1_idx_izgfqfzomxrwslrlmmfsvjiebkrjvvvvrbhm` (`dateDeleted`),
  CONSTRAINT `test1_fk_cbxskhpnhuzxsizoydfhmpcwcongpuodrgmg` FOREIGN KEY (`sectionId`) REFERENCES `test1_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ftayarpxfmzaquhzdkijzrynadittpcbghrw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `test1_idx_kpooadendhksyfkwbcimjqrwdkexyjwsyipw` (`name`),
  KEY `test1_idx_eaqxxfltbfdidqdgnmmvyuvuohqteiiopoox` (`dateDeleted`,`name`)
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
  UNIQUE KEY `test1_idx_pmptoeonacnxsseqnzrqjqvjdusjopercegw` (`layoutId`,`fieldId`),
  KEY `test1_idx_nbehogjginzninrtkfdbgibfzodigabpoahg` (`sortOrder`),
  KEY `test1_idx_hvdmdvtmhuedfzkqhngqelnzflmkrixopnbl` (`tabId`),
  KEY `test1_idx_jlpkmhanalytxlybnojkuecesnueyjookvdf` (`fieldId`),
  CONSTRAINT `test1_fk_gpuygkggiiznsqkrgowynfiygsuxdvusgnzm` FOREIGN KEY (`tabId`) REFERENCES `test1_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_jopgsocxtzuzmaakjrhwpqbjxtmzwxphixol` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ldygaiviycirqzaoypffewetgkpoqhalatde` FOREIGN KEY (`layoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  KEY `test1_idx_rrbubrvuvjemrhublpoeripgntfkizttjaup` (`dateDeleted`),
  KEY `test1_idx_wvidpgkppypsqolokaztjdcelmehypfbrquw` (`type`)
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
  KEY `test1_idx_krgzmakskliffkhfxrnquiwimaqbzcgthzvw` (`sortOrder`),
  KEY `test1_idx_yuqhkmcmtaukkqqxxlcpnjaokduxmaaxxren` (`layoutId`),
  CONSTRAINT `test1_fk_ehiosxgtzojljomrssqdsinckqxfimlipbje` FOREIGN KEY (`layoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  KEY `test1_idx_tujhjuflihwptgnvdlyvgmwbaifxipgchwce` (`handle`,`context`),
  KEY `test1_idx_pgdfimlphulqkqvmrfjqzachffsleywdkvdv` (`groupId`),
  KEY `test1_idx_zdlmmiwzpmjdyicemzetporbhkychnnldbir` (`context`),
  CONSTRAINT `test1_fk_tkaxloykqvuhiizfwpcazvvermkdefaflxnl` FOREIGN KEY (`groupId`) REFERENCES `test1_fieldgroups` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_xohgrxcyhsqiaxqhaquuylwndiatnpdvidzf` (`name`),
  KEY `test1_idx_pflllqrctnrhubjxmrcnldolwxuxppawbvds` (`handle`),
  KEY `test1_idx_bbfkassmulifaagmnrpewmtpgfpudxeliksp` (`fieldLayoutId`),
  KEY `test1_idx_nuggzljapcmjcygovzjvdaxhaxjdtbbcprmj` (`sortOrder`),
  CONSTRAINT `test1_fk_hmyxcxnipnoyymlcbdwsabqyoytzghyuekjf` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_qstgfrmfknmydwchpfkmmwlfqrcxwsgszoxz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
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
  UNIQUE KEY `test1_idx_efzyidatfpkfdhhzzyrhqzgrzvoehqrfnyib` (`accessToken`),
  UNIQUE KEY `test1_idx_xaeyjcyaskvetnzfthazcjspzrxnuqhyegut` (`name`),
  KEY `test1_fk_quiohqnndsyvmpchvyuktypgesdpvtdegrwa` (`schemaId`),
  CONSTRAINT `test1_fk_quiohqnndsyvmpchvyuktypgesdpvtdegrwa` FOREIGN KEY (`schemaId`) REFERENCES `test1_gqlschemas` (`id`) ON DELETE SET NULL
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
  KEY `test1_idx_uicfizzvfwncokfdktjzaxqicltsgrwhkggj` (`assetId`,`format`,`transformString`),
  KEY `test1_idx_xpehccvnviginrucijhduhertloupfcutdcm` (`assetId`,`transformString`)
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
  KEY `test1_idx_swkdggnofmcxunmafkrcnhxftjkxywyvsghf` (`name`),
  KEY `test1_idx_lfxhgrzfonvjldzdoihbrrkyqlvzsccdqbrr` (`handle`)
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
  KEY `test1_idx_hpiznsapgglekdukaqoecirgvbnaelfpjudk` (`primaryOwnerId`),
  KEY `test1_idx_vkwptnafcscsfkoolmzydlttlzpypijcrcxw` (`fieldId`),
  KEY `test1_idx_wfsydsjagasvcfvtpaktjzkkyloyachzxyad` (`typeId`),
  CONSTRAINT `test1_fk_asuqhoaapoilnukfvumngtzdfklaezyznmrh` FOREIGN KEY (`typeId`) REFERENCES `test1_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_crjmzaqfidimverlidtdfyjmutwtppuehquc` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_sshfhdyplwhxgciqrfztpjygwvnaopzrjcbk` FOREIGN KEY (`primaryOwnerId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_zhlceecptucxdclvxbgghmifaiofmwrovxsi` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE
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
  KEY `test1_fk_xkpojhefyueyzsymjqloroebqaobcincabju` (`ownerId`),
  CONSTRAINT `test1_fk_ddpttdewplbjraaaozncxnkgejbnopxmhnnb` FOREIGN KEY (`blockId`) REFERENCES `test1_matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_xkpojhefyueyzsymjqloroebqaobcincabju` FOREIGN KEY (`ownerId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_sdalzaxxoixkoyqxrwqctyvvgyszeeadtovt` (`name`,`fieldId`),
  KEY `test1_idx_kwwijavzmgxffqwoylazqxkhuwcntfywecip` (`handle`,`fieldId`),
  KEY `test1_idx_jnvbcrrwznyhuowxheijuplatpemsdkorbkx` (`fieldId`),
  KEY `test1_idx_kutljmnktvrhddcwzlkbozskgdnnfwekrgrs` (`fieldLayoutId`),
  CONSTRAINT `test1_fk_flundxnpphoyzfoirjgvwwkulcgbcsknmxag` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_rqoxukjgvlcjhyohthrzvawrojjasihqyzqv` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_pwrqblqwwqzxyhlcznmoetxyuaogivcjdxjd` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `test1_idx_ukjlaoqcckzyxpoyspamgjcsaurgaizczdqm` (`handle`)
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
  KEY `test1_idx_fiauhnkvbjortfpiiiiceblfoxcsmhmlawnc` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `test1_idx_mnidshkhgbwapzllvcjkgkxsyxgdvbouktlo` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `test1_idx_oomtwbcvmtrsroiewmxnyftnqdanpolfqdob` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `test1_idx_ivfxkysawczziibjahtpanqaosmhwpnjhuyk` (`sourceId`),
  KEY `test1_idx_hkurqqzsanczrlxukegldquonpeekmymgxcd` (`targetId`),
  KEY `test1_idx_zzvtvlngvtmlqttejprittektarzfhemomre` (`sourceSiteId`),
  CONSTRAINT `test1_fk_abhkomqbclngpvbatqqrgfjjulxjqjfeueay` FOREIGN KEY (`targetId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_defthxlbllijuvdohdnuzmabejidzhhwscyk` FOREIGN KEY (`sourceSiteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_krvfmuftoydujdprhfbercpoxnvxncbfnbjn` FOREIGN KEY (`fieldId`) REFERENCES `test1_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_lcfzhozlnwrbzhmfymhyytrqtxpqmmvjvjay` FOREIGN KEY (`sourceId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_bbtzkaowopnjyxpzyfflizpctajrmxiclbzr` (`canonicalId`,`num`),
  KEY `test1_fk_ghokcucjwxwuenknvapuytngpwdcbmlwmchg` (`creatorId`),
  CONSTRAINT `test1_fk_ghokcucjwxwuenknvapuytngpwdcbmlwmchg` FOREIGN KEY (`creatorId`) REFERENCES `test1_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_oncsqyuyfwhjaqfuwiavwsbtaaisvtzpxlzv` FOREIGN KEY (`canonicalId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  FULLTEXT KEY `test1_idx_xakovtuhmxnprcysvbbenvmvegjhcdurdjle` (`keywords`)
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
  KEY `test1_idx_vuvnmdyihtjztbpkldxqwhvlpfxoqoiifmij` (`handle`),
  KEY `test1_idx_fjdoplwigxscgtevlefzfntvlxiwctefsugz` (`name`),
  KEY `test1_idx_wboawcygvwasfyzoinxanuazllhrpqxkidgl` (`structureId`),
  KEY `test1_idx_losrzqdkfkpmajbqwwglxeqoxfdayiuaozhq` (`dateDeleted`),
  CONSTRAINT `test1_fk_wehzpiakzdsjrndcvphcvnpveghsaysikzxo` FOREIGN KEY (`structureId`) REFERENCES `test1_structures` (`id`) ON DELETE SET NULL
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
  UNIQUE KEY `test1_idx_wuvumzpxdptvrlezmwguacrpperqnkhdwcda` (`sectionId`,`siteId`),
  KEY `test1_idx_dogydtwuokcteifyfcywucibskhohdictuaj` (`siteId`),
  CONSTRAINT `test1_fk_blvphepewxrnafzutnyfespxrswdvpaognxj` FOREIGN KEY (`siteId`) REFERENCES `test1_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test1_fk_bomatyvgrmhfoflyhgucofowmoowagaeharh` FOREIGN KEY (`sectionId`) REFERENCES `test1_sections` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_mpjoooammdhyifkyxzcdewsytkhamaelknhi` (`uid`),
  KEY `test1_idx_olmzfwypccnniioseswdvjkldxeaenvanyzo` (`token`),
  KEY `test1_idx_exrbqcxvivuwszwjmdsfegdhcvmlmfhqvlsm` (`dateUpdated`),
  KEY `test1_idx_depssviylojryhldwuzxefdtlunrjenqvitd` (`userId`),
  CONSTRAINT `test1_fk_tkdhoypdjyloqghwiobezpkcxsmmqruutcmc` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_uovxzrdngrkmxhrmvurpfbrxvyentcfhyysp` (`userId`,`message`),
  CONSTRAINT `test1_fk_mrzokuqvjgkbdzizyckjvyemqmxhcuqmhkrx` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_nskrqucylflamqhdkivodqfmbvxnvepdsdkc` (`name`)
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
  KEY `test1_idx_jfyzmvqovlhreezrtjyjwxogtqajqetukxnq` (`dateDeleted`),
  KEY `test1_idx_yiniqeweumdnurmgdmbwmnapxybzwzzickkm` (`handle`),
  KEY `test1_idx_krauigyozhvdzshytnwypsxzroxmngdcfgbn` (`sortOrder`),
  KEY `test1_fk_udmxlnasmuqhsocxzgvcdjhsrzuzpzbkovjf` (`groupId`),
  CONSTRAINT `test1_fk_udmxlnasmuqhsocxzgvcdjhsrzuzpzbkovjf` FOREIGN KEY (`groupId`) REFERENCES `test1_sitegroups` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_nalfrsnwtwumpslvywhmqgvumxnvhfjjurbs` (`structureId`,`elementId`),
  KEY `test1_idx_vjlmkkcpgpdwhampgovolqeqtoqllytkcpqe` (`root`),
  KEY `test1_idx_hthdtemizqurxxcxmtxofcslupsmfdzfcjee` (`lft`),
  KEY `test1_idx_dltztylaphcdpxcjgcodyhkovmziwpsgxcct` (`rgt`),
  KEY `test1_idx_tswoccpmwjmkpdecxprsvabyojozwrpvunid` (`level`),
  KEY `test1_idx_bzeebhtfonqndjywpcmgspjkxfthgdyzsrum` (`elementId`),
  CONSTRAINT `test1_fk_gypgqwbrequtxsdztpetkoxssophugsqtfct` FOREIGN KEY (`structureId`) REFERENCES `test1_structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ikhtwxvogkbjmnbtysnyuaujqnmmewlvjizv` FOREIGN KEY (`elementId`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_yqblgfpnkhpqxscijoxnyofqfpxsfpmhxykv` (`dateDeleted`)
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
  UNIQUE KEY `test1_idx_pgupxflpvihpztylanmyxcmxiiaecvirqxpm` (`key`,`language`),
  KEY `test1_idx_fpdbjssexelzqouyqtcdytlcnmhyokzvngbp` (`language`)
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
  KEY `test1_idx_ievkrhspplorpzjutxasazoweyldkednnrrb` (`name`),
  KEY `test1_idx_liznsoiqwlirezganphgwepekeeywiuskubq` (`handle`),
  KEY `test1_idx_gfrztvgbfburmlrfnhqtpxgywspukviugoza` (`dateDeleted`),
  KEY `test1_fk_xjtxjguzlnwvfreyfweajemtncjqkbpiiiwg` (`fieldLayoutId`),
  CONSTRAINT `test1_fk_xjtxjguzlnwvfreyfweajemtncjqkbpiiiwg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `test1_idx_somjgqzcifovsfyjicqdvrjhhlldbwnsepov` (`groupId`),
  CONSTRAINT `test1_fk_lloamopbonefbshegaoiqkrbocldtogzozjl` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_smgurluxtqbvudgjtpjvpadouksmjjjvrjet` FOREIGN KEY (`groupId`) REFERENCES `test1_taggroups` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_wgebwlvqlhifljhgnrlrrfwiizzijkhfklkg` (`token`),
  KEY `test1_idx_hirrxsojebgvleijqiiijnauhxnjuetxgzrc` (`expiryDate`)
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
  KEY `test1_idx_vrerkeywmpzemankigcznmjjeqhtsbmmgbup` (`handle`),
  KEY `test1_idx_bkucpzcwjkckmhihmxtmqexpnzrnxoqkvfwk` (`name`)
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
  UNIQUE KEY `test1_idx_aqupqwvqckfdhbuarvmqsedexyrcegunnzxz` (`groupId`,`userId`),
  KEY `test1_idx_tawydkuuzbkwkoatilawwhhwvlankwyajdve` (`userId`),
  CONSTRAINT `test1_fk_nhvcycidizqyczjdeubafopozxkcdoiobgsi` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_qdjtamkibeabsizwmjqpxfwlecmusnymhlur` FOREIGN KEY (`groupId`) REFERENCES `test1_usergroups` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_wngykvzpakskdigusitgvqpeinigkwiebldu` (`name`)
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
  UNIQUE KEY `test1_idx_vbulpfzezgdkbzzkquqgtowtznnsydqmykqy` (`permissionId`,`groupId`),
  KEY `test1_idx_pculnnpommxwzwvwaptvdfsfkjxbzrwsjfrp` (`groupId`),
  CONSTRAINT `test1_fk_qcvuiihimplqdklkprqbzxlabmxfbtluswzw` FOREIGN KEY (`groupId`) REFERENCES `test1_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_wyexzqofklsikslbicckbozqoxkdmiwkvotl` FOREIGN KEY (`permissionId`) REFERENCES `test1_userpermissions` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_daikyidxlfqnjzslriktdymdrxbhmnojwwvf` (`permissionId`,`userId`),
  KEY `test1_idx_gwmbguojgmslwqouofccnbikqbogplbonlna` (`userId`),
  CONSTRAINT `test1_fk_fzzknyshcvaurmpuswyhnmzlhawdcqcmmkdj` FOREIGN KEY (`permissionId`) REFERENCES `test1_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_ulkqwtsiyrjcwmbboamjgombxkxvwaxzaawi` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
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
  CONSTRAINT `test1_fk_hxfqaxnrhnnqsvjelgglqhyasmhwxkqgjvbe` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
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
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
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
  KEY `test1_idx_vngaqdlsfiyazkxvsrorpjadxgsgptdifaku` (`verificationCode`),
  KEY `test1_idx_maawwhwhcddvmfkhxxknfkkhzgowiowwkldv` (`email`),
  KEY `test1_idx_zlqafjhdpmosgdsuhyzcknrzzzdvotnizsxx` (`username`),
  KEY `test1_fk_dbocxdagaxrlcwhqbbbihqnivhzgrsxnalcf` (`photoId`),
  KEY `test1_idx_hulcmbqrqkkxqqodeffnutblxeyopfaffben` (`active`),
  KEY `test1_idx_jdvsapijqtecmyrkzykzuovomiybzhpgbrtd` (`locked`),
  KEY `test1_idx_jmyietjgnuvkklitotrlcyjttofkadnkebmp` (`pending`),
  KEY `test1_idx_dnsjnpijuiynzkjkorerevenmhxqlbhctwhd` (`suspended`),
  CONSTRAINT `test1_fk_dbocxdagaxrlcwhqbbbihqnivhzgrsxnalcf` FOREIGN KEY (`photoId`) REFERENCES `test1_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `test1_fk_dntxsyammlgsttefsbzbxqicznfhosycpudr` FOREIGN KEY (`id`) REFERENCES `test1_elements` (`id`) ON DELETE CASCADE
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
  UNIQUE KEY `test1_idx_swxocxydmzpjjizfualjxxffbmjfjroijpdj` (`name`,`parentId`,`volumeId`),
  KEY `test1_idx_mjxcgcstzgyikkagzzzdbbgctqjjadhqrlfa` (`parentId`),
  KEY `test1_idx_czhixowztcnxgudpuzjyedkwxgtqidkoimer` (`volumeId`),
  CONSTRAINT `test1_fk_hfxoxmzeqvvanavsfibxybzvmjnavhtayfbu` FOREIGN KEY (`volumeId`) REFERENCES `test1_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `test1_fk_twwczawvymhixtxzndurnnaoyiylxoyhuulw` FOREIGN KEY (`parentId`) REFERENCES `test1_volumefolders` (`id`) ON DELETE CASCADE
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
  KEY `test1_idx_ojspcxygfmtcxkpityqzenculoparxjochdj` (`name`),
  KEY `test1_idx_qazowauxwopsityhbeyxnuyxmjuaajfndbxm` (`handle`),
  KEY `test1_idx_skumzhfxhairhmceiyhqdjofatcicwwyzxkg` (`fieldLayoutId`),
  KEY `test1_idx_uxptwcwagzalsdgcsqtxwaczlnajcvgwrxed` (`dateDeleted`),
  CONSTRAINT `test1_fk_blgfqxnrjlcsemyahcgawjsomfbyvkcjpcaz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `test1_fieldlayouts` (`id`) ON DELETE SET NULL
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
  KEY `test1_idx_clidpszoshgsxsnhqyfihrvbqhjiavqejkox` (`userId`),
  CONSTRAINT `test1_fk_emxhtbqupirymlcgjabgjtvafpgzcojgsgnh` FOREIGN KEY (`userId`) REFERENCES `test1_users` (`id`) ON DELETE CASCADE
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

-- Dump completed on 2022-03-23 10:24:37
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
INSERT INTO `test1_changedattributes` VALUES (2,1,'slug','2022-03-23 09:18:12',0,1),(2,1,'title','2022-03-23 09:18:12',0,1),(2,1,'uri','2022-03-23 09:18:12',0,1);
/*!40000 ALTER TABLE `test1_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_changedfields`
--

LOCK TABLES `test1_changedfields` WRITE;
/*!40000 ALTER TABLE `test1_changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_changedfields` VALUES (2,1,1,'2022-03-23 09:18:15',0,1);
/*!40000 ALTER TABLE `test1_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_content`
--

LOCK TABLES `test1_content` WRITE;
/*!40000 ALTER TABLE `test1_content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_content` VALUES (1,1,1,NULL,'2022-03-23 09:14:51','2022-03-23 09:14:51','a4af8921-c933-4cc0-bc06-5eb42684e65c',NULL),(2,2,1,'The Title','2022-03-23 09:18:02','2022-03-23 09:18:17','d953347a-c192-4a25-9738-b7c5319bba2e','The Subtitle'),(3,3,1,'The Title','2022-03-23 09:18:17','2022-03-23 09:18:17','4ca68755-8392-4e06-8b44-6f4225d93c7a','The Subtitle');
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
INSERT INTO `test1_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-03-23 09:14:51','2022-03-23 09:14:51',NULL,NULL,'b697fef3-5db6-4bed-b2ca-f1e203ace9f2'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-03-23 09:18:02','2022-03-23 09:18:17',NULL,NULL,'79b27715-d753-451a-9f65-be508f3ac6f0'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-03-23 09:18:17','2022-03-23 09:18:17',NULL,NULL,'5371a6ba-6bfc-4599-aaea-3e8ed46825ac');
/*!40000 ALTER TABLE `test1_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_elements_sites`
--

LOCK TABLES `test1_elements_sites` WRITE;
/*!40000 ALTER TABLE `test1_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-03-23 09:14:51','2022-03-23 09:14:51','fa6348f1-9bc1-4dc5-86a0-47f347253098'),(2,2,1,'the-title','page/the-title',1,'2022-03-23 09:18:02','2022-03-23 09:18:12','95fd01e6-fd7e-4a04-b02d-5a6e2a642fee'),(3,3,1,'the-title','page/the-title',1,'2022-03-23 09:18:17','2022-03-23 09:18:17','1d4845e9-034c-4fff-a59d-da10bb928d89');
/*!40000 ALTER TABLE `test1_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_entries`
--

LOCK TABLES `test1_entries` WRITE;
/*!40000 ALTER TABLE `test1_entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_entries` VALUES (2,1,NULL,1,1,'2022-03-23 09:18:00',NULL,NULL,'2022-03-23 09:18:02','2022-03-23 09:18:02'),(3,1,NULL,1,1,'2022-03-23 09:18:00',NULL,NULL,'2022-03-23 09:18:17','2022-03-23 09:18:17');
/*!40000 ALTER TABLE `test1_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_entrytypes`
--

LOCK TABLES `test1_entrytypes` WRITE;
/*!40000 ALTER TABLE `test1_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2022-03-23 09:17:43','2022-03-23 09:17:43',NULL,'4a999130-ec31-4481-bbcb-8071860220aa');
/*!40000 ALTER TABLE `test1_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldgroups`
--

LOCK TABLES `test1_fieldgroups` WRITE;
/*!40000 ALTER TABLE `test1_fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldgroups` VALUES (1,'Common','2022-03-23 09:14:51','2022-03-23 09:14:51',NULL,'e2900beb-7302-4b94-aae5-721985c45ab7');
/*!40000 ALTER TABLE `test1_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldlayoutfields`
--

LOCK TABLES `test1_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `test1_fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `test1_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldlayouts`
--

LOCK TABLES `test1_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `test1_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-03-23 09:17:43','2022-03-23 09:17:43',NULL,'1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb');
/*!40000 ALTER TABLE `test1_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fieldlayouttabs`
--

LOCK TABLES `test1_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `test1_fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fieldlayouttabs` VALUES (3,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"warning\":null,\"width\":100,\"uid\":\"2a970ba8-10e6-491e-b55f-93d7cb0e7e57\"},{\"fieldUid\":\"61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"7b4d3ec0-9b88-40e0-bd6d-6bc3cb6f29ab\"}]',1,'2022-03-23 09:22:19','2022-03-23 09:22:19','080cc546-586f-47c7-a9de-289356d5d259');
/*!40000 ALTER TABLE `test1_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_fields`
--

LOCK TABLES `test1_fields` WRITE;
/*!40000 ALTER TABLE `test1_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_fields` VALUES (1,1,'Subtitle','subtitle','global','dhznaisy','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":60,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2022-03-23 09:17:28','2022-03-23 09:17:28','61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba');
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
INSERT INTO `test1_info` VALUES (1,'4.0.0-beta.3','4.0.0.7',0,'tbgutzjpiuyq','3@oyrvhpxyls','2022-03-23 09:14:51','2022-03-23 09:22:21','585cc80f-1344-413f-a1af-86433af8cc3c');
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
INSERT INTO `test1_migrations` VALUES (1,'craft','Install','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','173f7aae-3cc9-4206-afc8-d715efdcabe5'),(2,'craft','m150403_183908_migrations_table_changes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','3958a0ab-e20b-4a04-8a54-58598ed2dd15'),(3,'craft','m150403_184247_plugins_table_changes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','3e69ce25-e92c-43d9-bf0d-1bce61a1afd9'),(4,'craft','m150403_184533_field_version','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','19460c8c-5807-429c-8c60-e041efa9a216'),(5,'craft','m150403_184729_type_columns','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','117f62aa-7c07-492c-b3a7-ed8b7e2398fa'),(6,'craft','m150403_185142_volumes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','96dfc5ce-e82d-4bba-8f2e-8679c2e5268a'),(7,'craft','m150428_231346_userpreferences','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','087ec63b-2d51-41ba-b3e4-5eba039c8f64'),(8,'craft','m150519_150900_fieldversion_conversion','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','a75e5b6e-6fc1-459c-960d-25457492c8e6'),(9,'craft','m150617_213829_update_email_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','5c2fba91-2311-47ef-ba9f-1052b348ad63'),(10,'craft','m150721_124739_templatecachequeries','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','fab59740-cc50-4e04-b60e-89928b97c968'),(11,'craft','m150724_140822_adjust_quality_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ccb85808-a61b-42b7-8f08-c14da5fcd29a'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','74bd1662-1f08-4387-88a9-8e4644de41dd'),(13,'craft','m151002_095935_volume_cache_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','9d140b98-b2e7-498b-89b4-be5e146c9c1a'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','08d7d104-22e4-4cb5-a085-9388e25396be'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','79eabff3-8dcc-4274-8efa-e370f5d4adb1'),(16,'craft','m151209_000000_move_logo','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','76a115d7-c125-4d3f-a8f2-d3add558b23f'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','052f330d-6758-4cba-96a6-2b18e8f42c31'),(18,'craft','m151215_000000_rename_asset_permissions','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','91817944-6b76-4d11-9e2a-ed1eafa7baf9'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','74afd0db-da5f-4058-b3d5-d2fa90a7eeec'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','c61a79a2-96c3-4e96-937f-f19fcdf4af98'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','b7bf7a63-e72e-406a-83b6-7ac9870d589c'),(22,'craft','m160727_194637_column_cleanup','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4534f592-e0a3-4e9a-b88a-079cc5238c2e'),(23,'craft','m160804_110002_userphotos_to_assets','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','f3d53c13-e829-4635-99ef-a7dbf62fdbce'),(24,'craft','m160807_144858_sites','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','e59ed0f4-5a71-4e09-997b-868d42404085'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','aa26f070-be93-4f11-86fa-9a9270842152'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','72bdc432-3784-4cd0-9c9c-bea76f542a5e'),(27,'craft','m160912_230520_require_entry_type_id','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','2287a3f7-f9d5-4963-89ef-7c70c42610cf'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','8a6012a2-5c10-4714-be58-c037a8c91a6a'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','832463ca-9a68-41c2-84b6-3995ac76f748'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6f73b8a7-b620-4628-b08b-8548c3ff0a81'),(31,'craft','m160925_113941_route_uri_parts','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','f6b787a3-2173-4d25-b9bc-d1a703b250cc'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','33602540-2982-4c73-9fee-ff57c27f91ec'),(33,'craft','m161007_130653_update_email_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','321dd166-30f2-4de2-9671-1fcb11f54fca'),(34,'craft','m161013_175052_newParentId','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0007face-3bf7-406b-9e1d-40736dc2e7e5'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0eb7783d-f9e2-4255-b142-c996efa07f3b'),(36,'craft','m161021_182140_rename_get_help_widget','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','2a58ec78-5b88-4c30-b0f0-df26103f559c'),(37,'craft','m161025_000000_fix_char_columns','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','3e0f0d50-7dbe-40b0-8ba3-22b22ec0d008'),(38,'craft','m161029_124145_email_message_languages','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ce6eaaa2-be17-4be5-9702-91a4651c9fd6'),(39,'craft','m161108_000000_new_version_format','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','5d13ce6c-82d5-4638-bd34-65f2662d6b0c'),(40,'craft','m161109_000000_index_shuffle','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','5a99a0d1-bf77-40c1-9771-614a64c630cc'),(41,'craft','m161122_185500_no_craft_app','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','8ce700f0-3163-4952-ac2b-f0cf30102883'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','357a3041-10f1-43e8-b3e8-d28aefe70a56'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','9b42fc4b-7448-4ea3-ba78-89bd6c41c782'),(44,'craft','m170114_161144_udates_permission','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','45b65409-7c8e-4726-8316-faf03643889f'),(45,'craft','m170120_000000_schema_cleanup','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','86462e24-081b-4a6c-b454-753b3ff796e6'),(46,'craft','m170126_000000_assets_focal_point','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','1c8c421b-7471-4b09-99bb-ecda6e6b9015'),(47,'craft','m170206_142126_system_name','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','042f36ec-07f3-46f9-80d3-57a326384381'),(48,'craft','m170217_044740_category_branch_limits','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','9be4c5b3-1a91-4585-87cc-138cb349eab8'),(49,'craft','m170217_120224_asset_indexing_columns','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','668d06ce-13fa-467f-a1f5-72be00a83079'),(50,'craft','m170223_224012_plain_text_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','862c035a-59e5-4645-8d6a-e3fd0545f9e6'),(51,'craft','m170227_120814_focal_point_percentage','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','32c11c20-7955-4af8-b557-03be22c7fedd'),(52,'craft','m170228_171113_system_messages','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ca73f23d-4725-4a80-8634-74a4fa55a43e'),(53,'craft','m170303_140500_asset_field_source_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0280a127-e5c1-4441-9086-147017661055'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','205ee974-0c69-4bd2-8a5e-8abd8992ace9'),(55,'craft','m170523_190652_element_field_layout_ids','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ac4d1238-ae3d-4bdf-9ced-ea0a3ca09d27'),(56,'craft','m170621_195237_format_plugin_handles','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','225532e3-bd68-4d5d-84ad-479d169a2e3c'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','e4c5f042-081a-4cb5-9118-6e72406e5819'),(58,'craft','m170630_161028_deprecation_changes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4353f31d-cd38-4371-a006-00989896288d'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4418e7cc-3913-4b73-9bb8-411bece12e57'),(60,'craft','m170704_134916_sites_tables','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','13c099c0-19a6-4b00-b322-9213c4483403'),(61,'craft','m170706_183216_rename_sequences','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','96625838-6a94-480e-9634-9052c4b0b0c5'),(62,'craft','m170707_094758_delete_compiled_traits','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','08a0fc31-9ba6-4208-8a9c-1afeab6c30ca'),(63,'craft','m170731_190138_drop_asset_packagist','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','54e6a664-d25c-4b34-b2e8-89d5da7d3ca9'),(64,'craft','m170810_201318_create_queue_table','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','e13407cf-ff4f-4e10-a736-37182da2fb73'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','a1c84053-1dd1-4172-8acd-88f08d326b01'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','af1fe106-1680-4de7-a3fa-af65d6058f46'),(67,'craft','m171011_214115_site_groups','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4090a148-b61c-402e-84c1-8559ec5d576d'),(68,'craft','m171012_151440_primary_site','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','8aa7b203-cfcf-45df-b4cf-626ec266df50'),(69,'craft','m171013_142500_transform_interlace','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','cd74ddb5-12f5-40f0-b6f3-3b0b1f2ab92c'),(70,'craft','m171016_092553_drop_position_select','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4e64d9ee-a6f8-4dd7-a6a9-5d43f2d57475'),(71,'craft','m171016_221244_less_strict_translation_method','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','5c59385b-6d40-4b49-9730-39dc942042b2'),(72,'craft','m171107_000000_assign_group_permissions','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','08924201-944e-4645-b1eb-be5825b4a875'),(73,'craft','m171117_000001_templatecache_index_tune','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','5c7e0ca4-fab3-4087-9e80-3c03c960c315'),(74,'craft','m171126_105927_disabled_plugins','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','f918c193-516b-4aa5-915f-1ffe92085c27'),(75,'craft','m171130_214407_craftidtokens_table','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','26bc3519-2a7f-43f5-96a7-de0321b95e61'),(76,'craft','m171202_004225_update_email_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','41e70b35-dfd3-4bd9-ba9c-29d277be29e7'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','3397809c-4cbc-413f-8137-00d2d0c76b16'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','eaf0a6c6-6ee1-4bca-b64e-515ac5e7a3c4'),(79,'craft','m171218_143135_longtext_query_column','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','f2254178-0640-428b-a00e-19ad5a5c1a24'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','11b0e1c8-879b-42d9-a199-0515da73c927'),(81,'craft','m180113_153740_drop_users_archived_column','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','818a8edc-8055-48a1-83bd-e42a92fc8d10'),(82,'craft','m180122_213433_propagate_entries_setting','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','b2e6ded3-fcc4-471b-b4a0-43e2c59eb2e9'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','581d631a-f859-457f-ba17-1d59361f23eb'),(84,'craft','m180128_235202_set_tag_slugs','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','8c17200e-ea09-4d70-a72b-54b241f21dc5'),(85,'craft','m180202_185551_fix_focal_points','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','147802f5-21cc-4078-84a9-20e271b0d563'),(86,'craft','m180217_172123_tiny_ints','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6bfc13a3-92b5-49f7-b61e-b1fddaca4a01'),(87,'craft','m180321_233505_small_ints','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6e292079-c1a3-48e8-9c74-f621540395a8'),(88,'craft','m180404_182320_edition_changes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','fccff67d-3269-465c-bce2-0150d7ebc65d'),(89,'craft','m180411_102218_fix_db_routes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','084ea1ef-f79f-4dca-8df6-e5fa29b23722'),(90,'craft','m180416_205628_resourcepaths_table','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6f303a79-72c5-4fef-84fa-b65ea16e206b'),(91,'craft','m180418_205713_widget_cleanup','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','8026a1de-08ad-4dfd-9842-85f8b9f460ec'),(92,'craft','m180425_203349_searchable_fields','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','fc61ab36-eee3-4c98-95a8-5acc4b8ff486'),(93,'craft','m180516_153000_uids_in_field_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0dcb97d8-24df-4b33-b608-3669df96e318'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','91df669f-dec6-46de-bc90-f93696e093bd'),(95,'craft','m180518_173000_permissions_to_uid','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6842dc08-725d-4754-83ce-2797bfe94f7e'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','fea961c5-1f60-4412-b535-5c88503c0dc3'),(97,'craft','m180521_172900_project_config_table','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','af66cfca-ff3c-4611-a232-787f412960cd'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','2cedb21a-678a-49ca-b283-76ff09637027'),(99,'craft','m180731_162030_soft_delete_sites','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','74bb87c1-d640-45ca-8614-ca33f4848a18'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0a72cc82-422c-4ee4-bb77-f5c16da23468'),(101,'craft','m180810_214439_soft_delete_elements','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4b1e02dd-f650-4cd7-90aa-cb4a614e1c4e'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','537d2a9c-49fa-4299-9bfc-7992bbd962f6'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','830d26b3-0575-4b19-ac6a-22748cf35b79'),(104,'craft','m180904_112109_permission_changes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','a69bd3eb-1775-43c6-bee6-dcdc981207e0'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','67c237a7-5a5b-4a49-8652-2970ed358c90'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','3c0c2c5e-0b7a-413f-86e3-f08761a19586'),(107,'craft','m181016_183648_set_default_user_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','3337aaad-579d-41b7-b91a-ad46b14913c6'),(108,'craft','m181017_225222_system_config_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6a69de90-f032-41ef-8db7-85a84e4db4f1'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','aedfda60-05fc-46c3-9912-58ba5f330f1f'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ac761523-76a7-499a-93dc-bcc4484f2ad8'),(111,'craft','m181112_203955_sequences_table','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','e9061995-6a49-4a23-8e8a-8c59eb0f3ba6'),(112,'craft','m181121_001712_cleanup_field_configs','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0d667f25-b48c-45db-8bf3-8aaf8840e69f'),(113,'craft','m181128_193942_fix_project_config','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4c1e4a1b-abf2-4095-90fe-22a47da2cb7e'),(114,'craft','m181130_143040_fix_schema_version','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','acf6c45a-b111-4d0d-81bf-86e667045568'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','4abbde74-bdc3-4521-81dc-d811079ea0ce'),(116,'craft','m181217_153000_fix_structure_uids','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','393af5d1-5521-4713-9dea-53f47f14aaed'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','9a49327c-896f-40fd-85ba-42050c566a63'),(118,'craft','m190108_110000_cleanup_project_config','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','40e850e9-904b-45ef-a019-fe0ebb29cab5'),(119,'craft','m190108_113000_asset_field_setting_change','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','0ead13e1-dae4-457a-b89b-70dd0ba7bb90'),(120,'craft','m190109_172845_fix_colspan','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ce7468a4-7a59-4380-ad21-f11601e15324'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','23d5ad7f-8f8d-4111-9003-6c7cb965fc08'),(122,'craft','m190110_214819_soft_delete_volumes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','dc1a5163-ed81-437f-ac63-6554e48051d1'),(123,'craft','m190112_124737_fix_user_settings','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','6077b966-87f0-4cfe-ac88-09a7d0742df8'),(124,'craft','m190112_131225_fix_field_layouts','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','710a1796-5727-4f41-94fe-201dd0b15d03'),(125,'craft','m190112_201010_more_soft_deletes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','aa12a3c0-b67b-4b80-a501-2655c90587d2'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','b777b0e1-9d6b-4bdb-bd3b-b586fab7e441'),(127,'craft','m190121_120000_rich_text_config_setting','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','bb029096-d610-404b-809b-49ed982dcba1'),(128,'craft','m190125_191628_fix_email_transport_password','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','51707b4a-3465-4b86-beea-6f99b2a0ab7a'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','1e1380e9-bda8-4de4-94a8-668778871e0e'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','e275998a-8dba-4dc8-b841-7fa9aed4a124'),(131,'craft','m190218_143000_element_index_settings_uid','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','e2ff6701-e93d-40ff-bc97-76d9e2ea96c4'),(132,'craft','m190312_152740_element_revisions','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','b937c4f8-09a2-41fb-beec-31b505c89d64'),(133,'craft','m190327_235137_propagation_method','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','eb6b6655-ee7d-4744-8137-66bc6878d42a'),(134,'craft','m190401_223843_drop_old_indexes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','b409f677-65f5-4faa-80f6-275c7ef492c8'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','59937840-1ace-406b-99b1-ed37694bfa94'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','f45e4824-b18f-42a6-baf3-05c2a508cc52'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','679737fb-5c5b-4b83-9ccd-1a74cc12f7eb'),(138,'craft','m190504_150349_preview_targets','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','328dc513-aff4-47c1-86c4-3d0f6f3ee040'),(139,'craft','m190516_184711_job_progress_label','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','d4d50668-062b-4548-933b-46f48493ec4d'),(140,'craft','m190523_190303_optional_revision_creators','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','113354ea-1846-46fb-acce-3fdf3551c78f'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','bff4abab-4f0d-4ec7-9efe-a4891f53983c'),(142,'craft','m190605_223807_unsaved_drafts','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','04f3caa7-21f6-4db0-a3d7-0cb6a4d1ad4d'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','752c6d30-73dc-4302-b5f2-449fc7e00286'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','5876c96d-4253-45da-873e-ac6a5833cf8e'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','ccaff2b5-3771-43b0-b2f6-b22215bfca53'),(146,'craft','m190624_234204_matrix_propagation_method','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','8ebb0aa0-8666-4763-bcc4-1cc6b7971232'),(147,'craft','m190711_153020_drop_snapshots','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','1ac2ef25-7605-476e-a0bf-8c8f4b9c8690'),(148,'craft','m190712_195914_no_draft_revisions','2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:14:51','d7b38efc-3bda-4848-aef4-419730c56f50'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','02149a5f-2936-4c66-8568-36be1ceb7bc1'),(150,'craft','m190820_003519_flush_compiled_templates','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','6876c306-d6a0-4017-a44b-18496837da48'),(151,'craft','m190823_020339_optional_draft_creators','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','88adfc8e-d502-4175-a45e-faf8b32c4d89'),(152,'craft','m190913_152146_update_preview_targets','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','92807b2b-b179-433f-9cc3-a2b0425b98c0'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','f8cacfc7-1827-4171-bf47-99c1ae08487a'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','56a836da-f455-4bef-9e76-ce16ed1f6600'),(155,'craft','m191206_001148_change_tracking','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','79a5e856-30a0-4c0b-a880-fb2ce8741f45'),(156,'craft','m191216_191635_asset_upload_tracking','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','810f9564-1d1e-4f2f-9444-c04b15538ce4'),(157,'craft','m191222_002848_peer_asset_permissions','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','e94d9816-e796-436c-8477-d1cafa003a88'),(158,'craft','m200127_172522_queue_channels','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','fe3fbdce-ff47-49fd-8e69-0b409e5e8a0e'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','9af7033c-50fe-44fd-bc75-50147ba9bd71'),(160,'craft','m200213_172522_new_elements_index','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','9f261898-e438-4852-af40-8f1a78b2a0d5'),(161,'craft','m200228_195211_long_deprecation_messages','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','2ad0e237-b310-49ea-8945-492622f02b6b'),(162,'craft','m200306_054652_disabled_sites','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','8f13bbb3-ec6f-4d69-a9f3-ce60ecc7c246'),(163,'craft','m200522_191453_clear_template_caches','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','6db3b3d8-6399-4847-80ce-6a15f97b567f'),(164,'craft','m200606_231117_migration_tracks','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','ed7f1091-ae09-459a-9c02-2df1a87e975a'),(165,'craft','m200619_215137_title_translation_method','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','3bbf8bc0-633f-4cf1-826a-99d5d5802aac'),(166,'craft','m200620_005028_user_group_descriptions','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','6e338bbe-4325-458b-890b-a54b7fcd9b41'),(167,'craft','m200620_230205_field_layout_changes','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','4d235380-b578-4e76-ab17-d21177891a27'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','55fd7205-4987-49f1-852b-78e9b5feb186'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','3c222224-7412-4396-8fda-fd6d503cc050'),(170,'craft','m200630_183000_drop_configmap','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','03670a7e-8907-47d1-8c55-3e10f33af827'),(171,'craft','m200715_113400_transform_index_error_flag','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','24e1e024-eb26-4a8e-ae7e-d63e64e1f5bb'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','4998ec28-aedf-43bc-9eec-e55b849209b1'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','20185e9d-9072-449a-9bc6-0c4ede8c57b8'),(174,'craft','m200720_175543_drop_unique_constraints','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','9f6bbb58-654a-4eec-b93a-86bb82c06b66'),(175,'craft','m200825_051217_project_config_version','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','9db57902-dc09-4a12-bfa3-7d1fdc301a2d'),(176,'craft','m201116_190500_asset_title_translation_method','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','7c4156e4-d297-4f45-9efe-398ceaed706b'),(177,'craft','m201124_003555_plugin_trials','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','8e35acc2-c790-4bf3-a1d2-087ade4e2ebc'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','d40acbaf-46da-4083-9cd9-4d3170049c37'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','d1941b91-f838-4fb1-b860-caf0877ac7eb'),(180,'craft','m210214_202731_track_saved_drafts','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','51618769-7603-43ea-b5e6-7e8c815c09b3'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','e8345667-e4e8-454b-b1d6-335ed3bca9b7'),(182,'craft','m210302_212318_canonical_elements','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','660c21f4-0b98-4210-b332-4da0eb97a49c'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','5b68b34e-581e-4882-ae33-7ed93924da4c'),(184,'craft','m210329_214847_field_column_suffixes','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','7a06c23a-26e6-450f-838d-0ede3ae50fea'),(185,'craft','m210331_220322_null_author','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','294f4714-204d-497f-abd3-1715f04d10d0'),(186,'craft','m210405_231315_provisional_drafts','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','2a3a3121-2caa-4d86-a496-c2ca668b3d97'),(187,'craft','m210602_111300_project_config_names_in_config','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','1407a161-469c-4697-b671-4ea45f816e49'),(188,'craft','m210611_233510_default_placement_settings','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','412b6580-c040-4a17-9659-34ab48be07c1'),(189,'craft','m210613_145522_sortable_global_sets','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','7953f0c2-3246-4061-80fe-75b465eae4da'),(190,'craft','m210613_184103_announcements','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','a314fa47-df3c-48cf-899b-fa9d987b7cc0'),(191,'craft','m210829_000000_element_index_tweak','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','c07250ca-eedc-467a-89cf-ffc7b6379912'),(192,'craft','m220209_095604_add_indexes','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','7fc1ddac-fcd9-43e9-98e9-102d74dedda5'),(193,'craft','m220214_000000_truncate_sessions','2022-03-23 09:14:52','2022-03-23 09:14:52','2022-03-23 09:14:52','1262959b-2a8f-408f-8ec2-705579208558'),(194,'craft','m210121_145800_asset_indexing_changes','2022-03-23 09:22:16','2022-03-23 09:22:16','2022-03-23 09:22:16','18849619-ff80-4699-b9bc-359fcd07b3f7'),(195,'craft','m210624_222934_drop_deprecated_tables','2022-03-23 09:22:16','2022-03-23 09:22:16','2022-03-23 09:22:16','767f376f-bbc9-4c28-a26e-ecba7d550c99'),(196,'craft','m210724_180756_rename_source_cols','2022-03-23 09:22:16','2022-03-23 09:22:16','2022-03-23 09:22:16','eef11863-27c1-4329-a879-7e2e3cad94e5'),(197,'craft','m210809_124211_remove_superfluous_uids','2022-03-23 09:22:17','2022-03-23 09:22:17','2022-03-23 09:22:17','2b5dba02-5e77-467a-ab13-a50f21b4603c'),(198,'craft','m210817_014201_universal_users','2022-03-23 09:22:17','2022-03-23 09:22:17','2022-03-23 09:22:17','25415904-3352-4c97-8c40-bf7f5bcc3e11'),(199,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-03-23 09:22:17','2022-03-23 09:22:17','2022-03-23 09:22:17','aea215bc-a9c9-425f-b48b-71cca7eab34b'),(200,'craft','m211115_135500_image_transformers','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','11a22643-922a-4330-9681-f66de1d80a9b'),(201,'craft','m211201_131000_filesystems','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','02a1a970-4234-4db7-8240-6fb123e7c65e'),(202,'craft','m220103_043103_tab_conditions','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','ca0bcc01-1ac4-4437-b1cf-350297183a7c'),(203,'craft','m220104_003433_asset_alt_text','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','70fa7c4a-a066-47b5-9a15-48ffb02253f5'),(204,'craft','m220123_213619_update_permissions','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','dce7cc53-314e-40ea-a0a8-82e2b21c1699'),(205,'craft','m220126_003432_addresses','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','4ee2f8c8-e159-4c74-ae86-5544ee5ed17e'),(206,'craft','m220213_015220_matrixblocks_owners_table','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','63adf360-7522-4d1a-9d50-0cae01bfe6db'),(207,'craft','m220222_122159_full_names','2022-03-23 09:22:18','2022-03-23 09:22:18','2022-03-23 09:22:18','f82eaa6c-2886-4778-91f7-03965ed9a00e'),(208,'craft','m220223_180559_nullable_address_owner','2022-03-23 09:22:19','2022-03-23 09:22:19','2022-03-23 09:22:19','c30f0366-84de-4515-a1c4-6268eb99d302'),(209,'craft','m220225_165000_transform_filesystems','2022-03-23 09:22:19','2022-03-23 09:22:19','2022-03-23 09:22:19','bc864d5d-6168-47da-ae38-f4fb7a31ff4d'),(210,'craft','m220309_152006_rename_field_layout_elements','2022-03-23 09:22:19','2022-03-23 09:22:19','2022-03-23 09:22:19','fe3f66ff-a948-4ac8-90c6-53df2ce176c1'),(211,'craft','m220314_211928_field_layout_element_uids','2022-03-23 09:22:19','2022-03-23 09:22:19','2022-03-23 09:22:19','d0cf77dc-81d3-4ba4-b1fe-2d647cff9a86'),(212,'craft','m220316_123800_transform_fs_subpath','2022-03-23 09:22:19','2022-03-23 09:22:19','2022-03-23 09:22:19','cfe105be-1e83-44c9-bf0c-9a7d755d1713'),(213,'craft','m220317_174250_release_all_jobs','2022-03-23 09:22:19','2022-03-23 09:22:19','2022-03-23 09:22:19','373814cd-267f-4759-9202-d76ee8f5479c');
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
INSERT INTO `test1_projectconfig` VALUES ('dateModified','1648027337'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.heading','\"Heading\"'),('elementSources.craft\\elements\\Entry.1.type','\"heading\"'),('elementSources.craft\\elements\\Entry.2.key','\"section:5c9808eb-172a-43c0-8843-dfb056e3236a\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"drafts\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"field:61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('email.fromEmail','\"admin@test1.local\"'),('email.fromName','\"Test1\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.autocapitalize','true'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.autocomplete','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.autocorrect','true'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.class','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.disabled','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.id','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.instructions','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.label','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.max','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.min','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.name','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.orientation','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.placeholder','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.readonly','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.requirable','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.size','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.step','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.tip','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.title','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.warning','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.0.width','100'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.fieldUid','\"61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.instructions','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.label','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.required','false'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.tip','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.warning','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.elements.1.width','100'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.name','\"Content\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.fieldLayouts.1bfa38a7-dc13-4e5c-80c5-d82cf8d313cb.tabs.0.sortOrder','1'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.handle','\"default\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.hasTitleField','true'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.name','\"Default\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.section','\"5c9808eb-172a-43c0-8843-dfb056e3236a\"'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.sortOrder','1'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.titleFormat','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.titleTranslationKeyFormat','null'),('entryTypes.4a999130-ec31-4481-bbcb-8071860220aa.titleTranslationMethod','\"site\"'),('fieldGroups.e2900beb-7302-4b94-aae5-721985c45ab7.name','\"Common\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.columnSuffix','\"dhznaisy\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.contentColumnType','\"string(240)\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.fieldGroup','\"e2900beb-7302-4b94-aae5-721985c45ab7\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.handle','\"subtitle\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.instructions','\"\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.name','\"Subtitle\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.searchable','false'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.byteLimit','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.charLimit','60'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.code','\"\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.columnType','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.initialRows','\"4\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.multiline','\"\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.placeholder','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.settings.uiMode','\"normal\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.translationKeyFormat','null'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.translationMethod','\"none\"'),('fields.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba.type','\"craft\\\\fields\\\\PlainText\"'),('meta.__names__.0ce07eb2-b257-4e4d-a6db-73e8a2de9726','\"Test1\"'),('meta.__names__.4a999130-ec31-4481-bbcb-8071860220aa','\"Default\"'),('meta.__names__.4ff0b93e-899f-459d-b8f9-8da9c87bbde0','\"Test1\"'),('meta.__names__.5c9808eb-172a-43c0-8843-dfb056e3236a','\"Page\"'),('meta.__names__.61c5f4da-dc1f-4267-b1ac-ec8edf00d2ba','\"Subtitle\"'),('meta.__names__.e2900beb-7302-4b94-aae5-721985c45ab7','\"Common\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.defaultPlacement','\"end\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.enableVersioning','true'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.handle','\"page\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.name','\"Page\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.propagationMethod','\"all\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.enabledByDefault','true'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.hasUrls','true'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.template','\"page/_entry\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.siteSettings.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.uriFormat','\"page/{slug}\"'),('sections.5c9808eb-172a-43c0-8843-dfb056e3236a.type','\"channel\"'),('siteGroups.4ff0b93e-899f-459d-b8f9-8da9c87bbde0.name','\"Test1\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.handle','\"default\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.hasUrls','true'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.language','\"en-US\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.name','\"Test1\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.primary','true'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.siteGroup','\"4ff0b93e-899f-459d-b8f9-8da9c87bbde0\"'),('sites.0ce07eb2-b257-4e4d-a6db-73e8a2de9726.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Test1\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.0.0.7\"'),('system.timeZone','\"Europe/Berlin\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
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
INSERT INTO `test1_revisions` VALUES (1,2,1,1,'');
/*!40000 ALTER TABLE `test1_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_searchindex`
--

LOCK TABLES `test1_searchindex` WRITE;
/*!40000 ALTER TABLE `test1_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' admin test1 local '),(1,'slug',0,1,''),(2,'title',0,1,' the title '),(2,'slug',0,1,' the title ');
/*!40000 ALTER TABLE `test1_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sections`
--

LOCK TABLES `test1_sections` WRITE;
/*!40000 ALTER TABLE `test1_sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sections` VALUES (1,NULL,'Page','page','channel',1,'all','end',NULL,'2022-03-23 09:17:43','2022-03-23 09:17:43',NULL,'5c9808eb-172a-43c0-8843-dfb056e3236a');
/*!40000 ALTER TABLE `test1_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sections_sites`
--

LOCK TABLES `test1_sections_sites` WRITE;
/*!40000 ALTER TABLE `test1_sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sections_sites` VALUES (1,1,1,1,'page/{slug}','page/_entry',1,'2022-03-23 09:17:43','2022-03-23 09:17:43','46ee966d-a448-46b9-a3c0-c320766023a1');
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
INSERT INTO `test1_sitegroups` VALUES (1,'Test1','2022-03-23 09:14:51','2022-03-23 09:14:51',NULL,'4ff0b93e-899f-459d-b8f9-8da9c87bbde0');
/*!40000 ALTER TABLE `test1_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `test1_sites`
--

LOCK TABLES `test1_sites` WRITE;
/*!40000 ALTER TABLE `test1_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test1_sites` VALUES (1,1,1,1,'Test1','default','en-US',1,'$PRIMARY_SITE_URL',1,'2022-03-23 09:14:51','2022-03-23 09:14:51',NULL,'0ce07eb2-b257-4e4d-a6db-73e8a2de9726');
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
INSERT INTO `test1_users` VALUES (1,'admin',NULL,NULL,NULL,NULL,'admin@test1.local','$2y$13$3tXMlS8emhtqt5gC63fs/uu3d8BpJxu2npYqLj.wYnXi8TiTgWdLG',1,1,0,0,0,'2022-03-23 09:15:54',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-03-23 09:14:51','2022-03-23 09:14:51','2022-03-23 09:22:17');
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
INSERT INTO `test1_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-03-23 09:15:55','2022-03-23 09:15:55','96a21c3f-7fab-4587-a3cb-a67b4a84ffe6'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-03-23 09:15:55','2022-03-23 09:15:55','2917e248-904d-40e9-b288-6a667641bc30'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-03-23 09:15:55','2022-03-23 09:15:55','4bd84cd0-6431-47bd-907d-cb27f1116d6b'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-03-23 09:15:55','2022-03-23 09:15:55','159d7ac8-c52d-41ec-b88d-a1dde5023226');
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

-- Dump completed on 2022-03-23 10:24:38
