DROP TABLE IF EXISTS `UserFavorite`;
CREATE TABLE `UserFavorite` (
  `UserId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FavoriteId` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `SportId` int(11) NOT NULL,
  `Language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-US',
  `EnablePush` tinyint(4) NOT NULL DEFAULT '1',
  `CreatedTime` timestamp NULL DEFAULT NULL,
  `ModifiedTime` timestamp NULL DEFAULT NULL,
  `Group` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`,`FavoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;