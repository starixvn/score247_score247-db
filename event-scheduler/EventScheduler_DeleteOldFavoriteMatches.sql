DROP EVENT IF EXISTS Event_DeleteOldFavoriteMatches;

CREATE EVENT Event_DeleteOldFavoriteMatches
    ON SCHEDULE
      EVERY 24 HOUR
      STARTS '2020-02-14 00:30:00'
    DO  
    BEGIN 
		Call EventSchedulerLog_Insert('Event_DeleteOldFavoriteMatches', 'start');
		
		DELETE F
		FROM UserFavorite AS F 
		INNER JOIN `Match` AS M ON F.FavoriteId = M.Id 
		WHERE Type = 1 
			AND M.EventDate <= (UTC_DATE() - INTERVAL 2 DAY);
		
		Call EventSchedulerLog_Insert('Event_DeleteOldFavoriteMatches', 'end');
    END
 