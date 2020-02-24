DROP PROCEDURE IF EXISTS `Admin_Team_GetTeams`;

CREATE DEFINER=`user`@`%` PROCEDURE `Admin_Team_GetTeams`(IN languageCode text)
BEGIN
	SELECT T.Value FROM `Team` as T
    WHERE T.Language = languageCode;
END