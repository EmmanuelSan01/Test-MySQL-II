USE sakilacampus;

-- 1. InformeAlquileresMensual: Genera un informe mensual de alquileres y lo almacena automáticamente.
delimiter $$ 
CREATE procedure informe_alquiler()
begin
	declare exit handler for sqlexception 
	begin
		rollback;
	end;

	start transaction;

	CREATE table if not exists alquiler_informe as select * from alquiler limit 1; 
	truncate table alquiler_informe;
	
	insert into alquiler_informe SELECT * from alquiler;

	commit;
end$$
delimiter ;

CREATE event informe_mensual
on schedule EVERY 1 MONTH 
starts timestamp(CURRENT_DATE + INTERVAL(30-day(CURRENT_DATE())) day, "1:00:00"
do call informe_alquiler();