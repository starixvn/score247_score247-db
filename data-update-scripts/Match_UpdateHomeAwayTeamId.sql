UPDATE `Match` AS M
SET M.HomeTeamId = JSON_UNQUOTE(M.Value -> "$.Teams[0].Id"),
	M.AwayTeamId = JSON_UNQUOTE(M.Value -> "$.Teams[1].Id");