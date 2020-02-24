DROP procedure IF EXISTS `UserFavorite_InsertOrUpdate`;

CREATE DEFINER=`user`@`%` PROCEDURE `UserFavorite_InsertOrUpdate`(IN sportId INT, IN userId VARCHAR(250), IN favorites MEDIUMTEXT)
BEGIN
	DECLARE i INT DEFAULT 0;                                                                                                                                                    
    DECLARE e INT DEFAULT JSON_LENGTH(favorites);
    
    WHILE i < e DO                                                                                                              
         INSERT INTO `UserFavorite`
			(`UserId`,
			`FavoriteId`,
			`Type`,
            `Group`,
			`SportId`,            
			`CreatedTime`,
			`ModifiedTime`)
			VALUES
			(userId,
			JSON_UNQUOTE(JSON_EXTRACT(favorites, CONCAT('$[', i, '].Id'))),
			JSON_UNQUOTE(JSON_EXTRACT(favorites, CONCAT('$[', i, '].Type'))),
            JSON_UNQUOTE(JSON_EXTRACT(favorites, CONCAT('$[', i, '].Group'))),
			sportId,
			now(),
			now())
		ON DUPLICATE KEY UPDATE            
            ModifiedTime = now();
        -- Increment the loop variable                                                                                                                                                        
        SET i = i + 1;
    END WHILE;
END