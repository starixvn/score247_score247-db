DROP procedure IF EXISTS `League_UpdateAbbreviation`;

CREATE DEFINER=`user`@`%` PROCEDURE `League_UpdateAbbreviation`(IN leagueId varchar(45), IN abbreviation VARCHAR(30))
BEGIN
	UPDATE `League` 
    SET `Abbreviation` = abbreviation 
    WHERE `Id` = leagueId;
END