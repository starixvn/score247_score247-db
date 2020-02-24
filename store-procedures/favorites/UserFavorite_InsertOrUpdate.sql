DROP procedure IF EXISTS `UserFavorite_InsertOrUpdate`;

CREATE DEFINER=`user`@`%` PROCEDURE `Team_InsertOrUpdate`(IN sportId INT, IN teams MEDIUMTEXT, IN language TEXT)
BEGIN
DECLARE i INT DEFAULT 0;                                                                                                                                                    
    DECLARE e INT DEFAULT JSON_LENGTH(teams);
    WHILE i < e DO                                                                                                              
       INSERT INTO `Team`
		(`Id`,
		`SportId`,
		`Language`,
		`Name`,
		`Value`,
		`Abbreviation`,
		`CreatedTime`,
		`ModifiedTime`,
        `LogoName`)
        VALUES (
			JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].Id'))),
            sportId, 
            language, 
			JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].Name'))),            
            JSON_EXTRACT(teams, CONCAT('$[', i, ']')),              
            JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].Abbreviation'))), 
            now(),
            now(),
            CONCAT(REPLACE(JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].CountryCode'))),"null", ""), JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].Abbreviation')))))
		ON DUPLICATE KEY UPDATE
            ModifiedTime = now(),
            Name = JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].Name'))),
            Abbreviation = JSON_UNQUOTE(JSON_EXTRACT(teams, CONCAT('$[', i, '].Abbreviation')));
        -- Increment the loop variable                                                                                                                                                        
        SET i = i + 1;
    END WHILE;
END