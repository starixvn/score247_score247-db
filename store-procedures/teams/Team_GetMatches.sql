DROP procedure IF EXISTS `Team_GetMatches`;

CREATE DEFINER=`root`@`%` PROCEDURE `Team_GetMatches`(IN sportId INT, IN teamId varchar(45), IN language TEXT)
BEGIN
	SELECT JSON_REPLACE(M.Value, '$.ModifiedTime', M.ModifiedTime) as `Value`
			FROM `Match` as M  
			WHERE (M.HomeTeamId = teamId || M.AwayTeamId = teamId)
			AND M.SportId = sportId
			AND M.Language = language
            AND EventDate >= (DATE(CONCAT(YEAR(UTC_TIMESTAMP()) ,'-' , MONTH(UTC_TIMESTAMP()) ,'-01')) - INTERVAL 6 MONTH)
			AND EventDate <= (DATE(CONCAT(YEAR(UTC_TIMESTAMP()) ,'-' , MONTH(UTC_TIMESTAMP()) ,'-01')) + INTERVAL 6 MONTH); 
END