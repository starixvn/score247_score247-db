DROP procedure IF EXISTS `UserFavorite_RemoveById`;

CREATE DEFINER=`user`@`%` PROCEDURE `UserFavorite_RemoveById`(IN userId varchar(250), In favoriteId varchar(250), IN sportId Int)
BEGIN
	DELETE F FROM UserFavorite AS F
	WHERE F.UserId = userId
    AND F.FavoriteId = favoriteId
    AND F.SportId = sportId;
END