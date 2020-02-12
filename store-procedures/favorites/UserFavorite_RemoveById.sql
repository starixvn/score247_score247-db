DROP procedure IF EXISTS `UserFavorite_RemoveById`;

CREATE DEFINER=`user`@`%` PROCEDURE `UserFavorite_RemoveById`(IN userId varchar(250), IN favorites MEDIUMTEXT, IN sportId Int)
BEGIN
	DECLARE i INT DEFAULT 0;                                                                                                                                                    
    DECLARE e INT DEFAULT JSON_LENGTH(favorites);
    
    WHILE i < e DO          
		DELETE F FROM UserFavorite AS F
		WHERE F.UserId = userId
			AND F.FavoriteId = JSON_UNQUOTE(JSON_EXTRACT(favorites, CONCAT('$[', i, '].Id')))
			AND F.SportId = sportId;
     
        -- Increment the loop variable                                                                                                                                                        
        SET i = i + 1;
    END WHILE;
END