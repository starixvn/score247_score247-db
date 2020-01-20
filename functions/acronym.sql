DROP function IF EXISTS `acronym`;

CREATE DEFINER=`user`@`%` FUNCTION `acronym`(str text) RETURNS text CHARSET utf8
READS SQL DATA
DETERMINISTIC
begin
    declare result text default '';
    set result = initials( UPPER(str), '[[:alnum:]]' );
    return result;
end