
delimiter //
create trigger trg_verificar_disiponibilidad_profesional before insert on Turno for each row
    begin
        declare v_conteo int;
        select count(*) into v_conteo from Turno
        where id_Profecional = new.id_Profecional and fecha = new.fecha;
        if v_conteo > 0 then
            signal sqlstate '45000' set message_text = "Error: El profesional ya tiene un turno asignado en esa fecha.";
        end if;
    end//
delimiter ;

delimiter //
create trigger trg_calcular_proximo_vencimiento_vacuna before insert on Vacunas for each row
    begin
        declare v_duracion_meses int;
        select duracion_meses into v_duracion_meses from vacuna_stock 
        where tipo = new.tipo;
        if v_duracion_meses is null then
            set v_duracion_meses = 12;
        end if;
        set new.vencimiento = date_add(curdate(), interval v_duracion_meses month);
    end//
delimiter ;

delimiter //
create procedure sp_obtener_top_10_motivos_consulta(
    in p_fecha_inicio date,
    in p_fecha_fin date,
    in p_tipo_animal_nombre varchar(45)
)
    begin
        select
            t.descripcion as "motivo_consulta",
            count(t.id) as "frecuencia"
        from Turno as t
        join Mascota as m on t.id_Mascota = m.id
        join Tipo_Mascota as tm on m.id_Tipo = tm.id
        where
            t.fecha between p_fecha_inicio and p_fecha_fin
            and tm.nombre_tipo = p_tipo_animal_nombre
            and t.descripcion is not null
            and t.descripcion != ""
        group by t.descripcion
        order by frecuencia desc
        limit 10;
    end//
delimiter ;

delimiter //
create procedure sp_aplicar_vacuna_y_actualizar_stock(
    in p_id_mascota int,
    in p_tipo_vacuna varchar(45)
)
    begin
        declare v_stock_actual int;
        declare v_stock_minimo int;
        declare v_nuevo_id_vacuna int;

        select stock, stock_minimo into v_stock_actual, v_stock_minimo
        from vacuna_stock where tipo = p_tipo_vacuna for update;

        if v_stock_actual is null then
            signal sqlstate '45000' set message_text = "Error: El tipo de vacuna no existe en el inventario.";
        elseif v_stock_actual > 0 then
            update vacuna_stock set stock = stock - 1 where tipo = p_tipo_vacuna;
            set v_stock_actual = v_stock_actual - 1;

            select ifnull(max(id), 0) + 1 into v_nuevo_id_vacuna from Vacunas;
            
            insert into Vacunas (id, tipo, id_Mascota)
            values (v_nuevo_id_vacuna, p_tipo_vacuna, p_id_mascota);

            if v_stock_actual <= v_stock_minimo then
                insert into alertas_stock (tipo_vacuna, mensaje)
                values (p_tipo_vacuna, concat("Alerta: Stock bajo para ", p_tipo_vacuna, ". Quedan: ", v_stock_actual));
            end if;
        else
            signal sqlstate '45000' set message_text = "Error: No hay stock disponible para esta vacuna.";
        end if;
    end//
delimiter ;

delimiter //
create event ev_enviar_recordatorios_turnos_diarios
on schedule every 1 day starts timestamp(curdate(), "06:00:00")
do
    begin
        insert into notificaciones (id_usuario, mensaje)
        select
            t.id_Usuario,
            concat("Recordatorio de turno: Hoy tiene una cita para ", m.nombre, " con el/la Dr/a. ", p.apellido, ".")
        from Turno as t
        join Mascota as m on t.id_Mascota = m.id
        join Profecional as p on t.id_Profecional = p.id
        where t.fecha = curdate();
    end//
delimiter ;

delimiter //
create event ev_enviar_consejos_semanales
on schedule every 1 week starts curdate() + interval (7 - weekday(curdate())) day
do
    begin
        insert into notificaciones (id_usuario, mensaje)
        select
            id,
            "Consejo semanal: Recuerde mantener al día la desparasitación y el calendario de vacunas de su mascota."
        from Usuario;
    end//
delimiter ;
