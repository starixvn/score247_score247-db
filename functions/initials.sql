DROP FUNCTION IF EXISTS `initials`;

CREATE DEFINER=`user`@`%` FUNCTION `initials`(str text) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
READS SQL DATA
DETERMINISTIC
begin
declare result text default '';
declare i int default 1;
if(str is null) then
return null;
end if;
set result = upper(substr(str,1,1));
while(i <= length(str)) do
if (substring(str, i, 1) = ' ')
then
set result = concat(result, upper(substr(str, i+1, 1)));
end if;
set i = i + 1;
end while;
return result;
END