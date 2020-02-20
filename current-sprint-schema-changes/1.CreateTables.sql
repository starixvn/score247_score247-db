DROP TABLE IF EXISTS `Team`;
CREATE TABLE `Team` (
  `Id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SportId` int(10) NOT NULL,
  `Language` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` json NOT NULL,
  `Abbreviation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TrendingOrder` int(10) NOT NULL DEFAULT '10000',
  `CreatedTime` timestamp NOT NULL,
  `ModifiedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsTrending` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`Language`),
  KEY `team_name_index` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;