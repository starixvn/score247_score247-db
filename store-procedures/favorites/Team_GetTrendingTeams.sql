DROP PROCEDURE IF EXISTS `Team_GetTrendingTeams`;

CREATE DEFINER=`user`@`%` PROCEDURE `Team_GetTrendingTeams`(IN sportId INT, IN language VARCHAR(10))
BEGIN
	SELECT T.`Value`
	FROM `Team` AS T
    WHERE T.SportId = sportId
		AND T.Language = language
		AND T.IsTrending = 1
    ORDER BY T.TrendingOrder, T.Name ASC;
END