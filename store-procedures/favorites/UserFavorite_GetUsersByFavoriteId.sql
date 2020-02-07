DROP procedure IF EXISTS `UserFavorite_GetUsersByFavoriteId`;

CREATE DEFINER=`root`@`%` PROCEDURE `UserFavorite_GetUsersByFavoriteId`(IN id varchar(250), IN favoriteType Tinyint, IN sportId int)
BEGIN
	SELECT 
		F.`UserId`
	FROM `UserFavorite` AS F
	WHERE F.FavoriteId = id
		AND F.Type = favoriteType
		AND F.SportId = sportId
        AND F.EnablePush = true;
END