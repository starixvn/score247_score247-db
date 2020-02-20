DROP procedure IF EXISTS `Match_GetByTeamId`;

CREATE DEFINER=`user`@`%` PROCEDURE `Match_GetByTeamId`(IN sportId INT, IN teamId varchar(45), IN language TEXT)
BEGIN
	SELECT JSON_REPLACE(M.Value, '$.ModifiedTime', M.ModifiedTime) as `Value`
			FROM `Match` as M  
			WHERE (M.HomeTeamId = teamId || M.AwayTeamId = teamId)
			AND M.SportId = sportId
			AND M.Language = language; 
END