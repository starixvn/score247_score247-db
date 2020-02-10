DROP procedure IF EXISTS `UserFavorite_GetUsersByFavoriteId`;

CREATE DEFINER=`root`@`%` PROCEDURE `UserFavorite_GetUsersByFavoriteId`(IN matchId varchar(250), IN sportId int)
BEGIN
	SELECT 
		DISTINCT F.`UserId`
	FROM `UserFavorite` AS F
	WHERE 
		(	
			(	F.FavoriteId = matchId 
				AND F.Type = 1
			) 
			OR 
			(	
				F.FavoriteId IN (SELECT LeagueId FROM `Match` WHERE Id = matchId) 
				AND F.Group IN (SELECT JSON_UNQUOTE(Value -> "$.GroupName") FROM `Match` WHERE Id = matchId) 
				AND F.Type = 2
			)
        )
		AND F.SportId = sportId
        AND F.EnablePush = true;
END