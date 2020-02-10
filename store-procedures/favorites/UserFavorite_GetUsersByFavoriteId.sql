DROP procedure IF EXISTS `UserFavorite_GetUsersByFavoriteId`;

CREATE DEFINER=`root`@`%` PROCEDURE `UserFavorite_GetUsersByFavoriteId`(IN matchId varchar(250), IN sportId int)
BEGIN
	
    SELECT
		@FavoriteLeagueId := LeagueId,
		@FavoriteLeagueGroup := JSON_UNQUOTE(Value -> "$.GroupName") 
	FROM score247_local_dev.Match 
	WHERE Id =  matchId;
    
	SELECT 
		F.`UserId`
	FROM `UserFavorite` AS F
	WHERE (	(F.FavoriteId = matchId AND F.Type = 1) OR 
			(F.FavoriteId = @FavoriteLeagueId AND F.Group = @FavoriteLeagueGroup AND F.Type = 2)
        )
		AND F.SportId = sportId
        AND F.EnablePush = true;
END