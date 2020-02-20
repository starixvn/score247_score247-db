DROP PROCEDURE IF EXISTS `Team_SearchByName`;

CREATE DEFINER=`user`@`%` PROCEDURE `Team_SearchByName`(IN sportId INT, IN language VARCHAR(10), IN keyword VARCHAR(250))
BEGIN
	SELECT T.`Value`
	FROM `Team` AS T
    WHERE T.SportId = sportId
		AND T.Language = language
		AND T.Name LIKE CONCAT('%', keyword, '%') 
    ORDER BY T.TrendingOrder, T.Name ASC;
END