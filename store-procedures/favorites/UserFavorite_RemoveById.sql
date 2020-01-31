DROP procedure IF EXISTS `UserFavorite_RemoveById`;

CREATE DEFINER=`user`@`%` PROCEDURE `UserFavorite_RemoveById`(IN userId varchar(250), In favoriteId varchar(250), IN sportId Int)
BEGIN
	DELETE FROM `UserFavorite`
	WHERE UserId = userId
    AND FavoriteId = favoriteId
    AND SportId = sportId;
END