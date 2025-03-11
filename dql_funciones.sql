DELIMITER $$
CREATE FUNCTION pronostico_poblacion (nom_ciu varchar(100))

RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
	DECLARE pob decimal(10,2);
	SELECT  Population into pob 
	FROM city 
	WHERE lower(Name) = lower(nom_ciu); 

	RETURN pob * 1.015;
END$$

DELIMITER ;