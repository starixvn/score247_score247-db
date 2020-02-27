UPDATE score247_local_test.Team AS T 
SET T.LogoName = 'ESPRCDE',
	T.Value = JSON_REPLACE(T.Value, '$.LogoName', 'ESPRCDE')
WHERE T.Id = 'sr:competitor:2814';