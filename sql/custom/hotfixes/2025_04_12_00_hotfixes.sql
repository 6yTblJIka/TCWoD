/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Struktúra mentése tábla hotfixes. adventure_journal
CREATE TABLE IF NOT EXISTS `adventure_journal` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Description` text,
  `ButtonText` text,
  `ButtonActionType` int NOT NULL DEFAULT '0',
  `TextureFileDataID` int NOT NULL DEFAULT '0',
  `LFGDungeonID` int NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `BattlemasterListID` int NOT NULL DEFAULT '0',
  `PriorityMin` int NOT NULL DEFAULT '0',
  `PriorityMax` int NOT NULL DEFAULT '0',
  `BonusPlayerConditionID1` int NOT NULL DEFAULT '0',
  `BonusPlayerConditionID2` int NOT NULL DEFAULT '0',
  `BonusValue1` int NOT NULL DEFAULT '0',
  `BonusValue2` int NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `ItemQuantity` int NOT NULL DEFAULT '0',
  `CurrencyType` int NOT NULL DEFAULT '0',
  `WorldMapAreaID` int DEFAULT '0',
  `CurrencyQuantity` int NOT NULL DEFAULT '0',
  `RewardDescription` text,
  `UIMapID` int NOT NULL DEFAULT '0',
  `ContinuedDescription` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Tábla adatainak mentése hotfixes.adventure_journal: 0 rows
/*!40000 ALTER TABLE `adventure_journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `adventure_journal` ENABLE KEYS */;

-- Struktúra mentése tábla hotfixes. adventure_journal_locale
CREATE TABLE IF NOT EXISTS `adventure_journal_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
  `ButtonText_lang` text,
  `RewardDescription_lang` text,
  `ContinuedDescription_lang` text,
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Tábla adatainak mentése hotfixes.adventure_journal_locale: 0 rows
/*!40000 ALTER TABLE `adventure_journal_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `adventure_journal_locale` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
