DROP procedure IF EXISTS `UserFavorite_GetUsersByFavoriteId`;

CREATE DEFINER=`user`@`%` PROCEDURE `UserFavorite_GetUsersByFavoriteId`(IN matchId varchar(250), IN sportId int)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS  TempFavorite;
    
	CREATE TEMPORARY TABLE TempFavorite
	SELECT 
		F.UserId,
		(CASE WHEN F.Type = 1 THEN F.FavoriteId ELSE NULL END) AS 'MatchId',
		(CASE WHEN F.Type = 2 THEN F.FavoriteId ELSE NULL END) AS 'LeagueId',
		(CASE WHEN F.Type = 3 THEN F.FavoriteId ELSE NULL END) AS 'TeamId',
		F.Group,
		F.OS
	FROM `UserFavorite` AS F
	WHERE F.EnablePush = 1 AND F.SportId = sportId;
    
    SELECT 
		DISTINCT F.`UserId`
	FROM `Match` AS M 
	INNER JOIN TempFavorite AS F
		ON (
			F.MatchId = M.Id OR 
            (F.LeagueId = M.LeagueId AND F.Group = JSON_UNQUOTE(M.Value -> "$.LeagueGroupName")) OR 
            F.TeamId = M.HomeTeamId OR F.TeamId = M.AwayTeamId)
	WHERE M.Id = matchId;
END