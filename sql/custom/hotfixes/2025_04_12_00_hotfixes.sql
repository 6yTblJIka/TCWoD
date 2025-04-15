DROP TABLE IF EXISTS `adventure_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adventure_journal` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` int unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Description` text,
  `ButtonText` text,
  `ButtonActionType` int unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID` int NOT NULL DEFAULT '0',
  `LFGDungeonID` int unsigned NOT NULL DEFAULT '0',
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `BattlemasterListID` int unsigned NOT NULL DEFAULT '0',
  `PriorityMin` int unsigned NOT NULL DEFAULT '0',
  `PriorityMax` int unsigned NOT NULL DEFAULT '0',
  `BonusPlayerConditionID1` int unsigned NOT NULL DEFAULT '0',
  `BonusPlayerConditionID2` int unsigned NOT NULL DEFAULT '0',
  `BonusValue1` int unsigned NOT NULL DEFAULT '0',
  `BonusValue2` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `ItemQuantity` int unsigned NOT NULL DEFAULT '0',
  `CurrencyType` int unsigned NOT NULL DEFAULT '0',
  `CurrencyQuantity` int unsigned NOT NULL DEFAULT '0',
  `RewardDescription` text,
  `UIMapID` int unsigned NOT NULL DEFAULT '0',
  `ContinuedDescription` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adventure_journal`
--

LOCK TABLES `adventure_journal` WRITE;
/*!40000 ALTER TABLE `adventure_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `adventure_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adventure_journal_locale`
--

DROP TABLE IF EXISTS `adventure_journal_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adventure_journal_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
  `ButtonText_lang` text,
  `RewardDescription_lang` text,
  `ContinuedDescription_lang` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adventure_journal_locale`
--

LOCK TABLES `adventure_journal_locale` WRITE;
/*!40000 ALTER TABLE `adventure_journal_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `adventure_journal_locale` ENABLE KEYS */;
UNLOCK TABLES;
