DROP INDEX commentary_match_index ON Commentary;
CREATE INDEX commentary_match_index ON Commentary(MatchId);

DROP INDEX headtohead_home_team_index ON HeadToHead;
CREATE INDEX headtohead_home_team_index ON HeadToHead(HomeTeamId);

DROP INDEX headtohead_away_team_index ON HeadToHead;
CREATE INDEX headtohead_away_team_index ON HeadToHead(AwayTeamId);

CREATE INDEX userfavorite_favorite_id_index ON UserFavorite(FavoriteId);
CREATE INDEX userfavorite_type_index ON UserFavorite(Type);