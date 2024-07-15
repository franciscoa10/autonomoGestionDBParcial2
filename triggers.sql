DELIMITER $$

CREATE TRIGGER trg_insert_adquisicion_libro AFTER INSERT ON adquisicion_libro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('adquisicion_libro', CURRENT_USER(), 'Insertado registro en adquisicion_libro'); 
END $$

CREATE TRIGGER trg_update_adquisicion_libro AFTER UPDATE ON adquisicion_libro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('adquisicion_libro', CURRENT_USER(), 'Actualizado registro en adquisicion_libro'); 
END $$

CREATE TRIGGER trg_delete_adquisicion_libro AFTER DELETE ON adquisicion_libro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('adquisicion_libro', CURRENT_USER(), 'Eliminado registro en adquisicion_libro'); 
END $$

CREATE TRIGGER trg_insert_autor AFTER INSERT ON autor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('autor', CURRENT_USER(), 'Insertado registro en autor'); 
END $$

CREATE TRIGGER trg_update_autor AFTER UPDATE ON autor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('autor', CURRENT_USER(), 'Actualizado registro en autor'); 
END $$

CREATE TRIGGER trg_delete_autor AFTER DELETE ON autor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('autor', CURRENT_USER(), 'Eliminado registro en autor'); 
END $$

CREATE TRIGGER trg_insert_biblioteca AFTER INSERT ON biblioteca 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('biblioteca', CURRENT_USER(), 'Insertado registro en biblioteca'); 
END $$

CREATE TRIGGER trg_update_biblioteca AFTER UPDATE ON biblioteca 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('biblioteca', CURRENT_USER(), 'Actualizado registro en biblioteca'); 
END $$

CREATE TRIGGER trg_delete_biblioteca AFTER DELETE ON biblioteca 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('biblioteca', CURRENT_USER(), 'Eliminado registro en biblioteca'); 
END $$

CREATE TRIGGER trg_insert_bibliotecario AFTER INSERT ON bibliotecario 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('bibliotecario', CURRENT_USER(), 'Insertado registro en bibliotecario'); 
END $$

CREATE TRIGGER trg_update_bibliotecario AFTER UPDATE ON bibliotecario 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('bibliotecario', CURRENT_USER(), 'Actualizado registro en bibliotecario'); 
END $$

CREATE TRIGGER trg_delete_bibliotecario AFTER DELETE ON bibliotecario 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('bibliotecario', CURRENT_USER(), 'Eliminado registro en bibliotecario'); 
END $$

CREATE TRIGGER trg_insert_centroestudio AFTER INSERT ON centroestudio 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('centroestudio', CURRENT_USER(), 'Insertado registro en centroestudio'); 
END $$

CREATE TRIGGER trg_update_centroestudio AFTER UPDATE ON centroestudio 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('centroestudio', CURRENT_USER(), 'Actualizado registro en centroestudio'); 
END $$

CREATE TRIGGER trg_delete_centroestudio AFTER DELETE ON centroestudio 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('centroestudio', CURRENT_USER(), 'Eliminado registro en centroestudio'); 
END $$

CREATE TRIGGER trg_insert_ciudad AFTER INSERT ON ciudad 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('ciudad', CURRENT_USER(), 'Insertado registro en ciudad'); 
END $$

CREATE TRIGGER trg_update_ciudad AFTER UPDATE ON ciudad 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('ciudad', CURRENT_USER(), 'Actualizado registro en ciudad'); 
END $$

CREATE TRIGGER trg_delete_ciudad AFTER DELETE ON ciudad 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('ciudad', CURRENT_USER(), 'Eliminado registro en ciudad'); 
END $$

CREATE TRIGGER trg_insert_cliente AFTER INSERT ON cliente 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cliente', CURRENT_USER(), 'Insertado registro en cliente'); 
END $$

CREATE TRIGGER trg_update_cliente AFTER UPDATE ON cliente 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cliente', CURRENT_USER(), 'Actualizado registro en cliente'); 
END $$

CREATE TRIGGER trg_delete_cliente AFTER DELETE ON cliente 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cliente', CURRENT_USER(), 'Eliminado registro en cliente'); 
END $$

CREATE TRIGGER trg_insert_detalleventa AFTER INSERT ON detalleventa 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('detalleventa', CURRENT_USER(), 'Insertado registro en detalleventa'); 
END $$

CREATE TRIGGER trg_update_detalleventa AFTER UPDATE ON detalleventa 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('detalleventa', CURRENT_USER(), 'Actualizado registro en detalleventa'); 
END $$

CREATE TRIGGER trg_delete_detalleventa AFTER DELETE ON detalleventa 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('detalleventa', CURRENT_USER(), 'Eliminado registro en detalleventa'); 
END $$

CREATE TRIGGER trg_insert_edicion AFTER INSERT ON edicion 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('edicion', CURRENT_USER(), 'Insertado registro en edicion'); 
END $$

CREATE TRIGGER trg_update_edicion AFTER UPDATE ON edicion 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('edicion', CURRENT_USER(), 'Actualizado registro en edicion'); 
END $$

CREATE TRIGGER trg_delete_edicion AFTER DELETE ON edicion 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('edicion', CURRENT_USER(), 'Eliminado registro en edicion'); 
END $$

CREATE TRIGGER trg_insert_editorial AFTER INSERT ON editorial 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('editorial', CURRENT_USER(), 'Insertado registro en editorial'); 
END $$

CREATE TRIGGER trg_update_editorial AFTER UPDATE ON editorial 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('editorial', CURRENT_USER(), 'Actualizado registro en editorial'); 
END $$

CREATE TRIGGER trg_delete_editorial AFTER DELETE ON editorial 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('editorial', CURRENT_USER(), 'Eliminado registro en editorial'); 
END $$

CREATE TRIGGER trg_insert_estadoprestamo AFTER INSERT ON estadoprestamo 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('estadoprestamo', CURRENT_USER(), 'Insertado registro en estadoprestamo'); 
END $$

CREATE TRIGGER trg_update_estadoprestamo AFTER UPDATE ON estadoprestamo 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('estadoprestamo', CURRENT_USER(), 'Actualizado registro en estadoprestamo'); 
END $$

CREATE TRIGGER trg_delete_estadoprestamo AFTER DELETE ON estadoprestamo 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('estadoprestamo', CURRENT_USER(), 'Eliminado registro en estadoprestamo'); 
END $$

CREATE TRIGGER trg_insert_genero AFTER INSERT ON genero 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('genero', CURRENT_USER(), 'Insertado registro en genero'); 
END $$

CREATE TRIGGER trg_update_genero AFTER UPDATE ON genero 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('genero', CURRENT_USER(), 'Actualizado registro en genero'); 
END $$

CREATE TRIGGER trg_delete_genero AFTER DELETE ON genero 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('genero', CURRENT_USER(), 'Eliminado registro en genero'); 
END $$

CREATE TRIGGER trg_insert_libro AFTER INSERT ON libro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('libro', CURRENT_USER(), 'Insertado registro en libro'); 
END $$

CREATE TRIGGER trg_update_libro AFTER UPDATE ON libro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('libro', CURRENT_USER(), 'Actualizado registro en libro'); 
END $$

CREATE TRIGGER trg_delete_libro AFTER DELETE ON libro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('libro', CURRENT_USER(), 'Eliminado registro en libro'); 
END $$

CREATE TRIGGER trg_insert_libro_autor AFTER INSERT ON libro_autor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('libro_autor', CURRENT_USER(), 'Insertado registro en libro_autor'); 
END $$

CREATE TRIGGER trg_update_libro_autor AFTER UPDATE ON libro_autor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('libro_autor', CURRENT_USER(), 'Actualizado registro en libro_autor'); 
END $$

CREATE TRIGGER trg_delete_libro_autor AFTER DELETE ON libro_autor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('libro_autor', CURRENT_USER(), 'Eliminado registro en libro_autor'); 
END $$

CREATE TRIGGER trg_insert_multas AFTER INSERT ON multas 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('multas', CURRENT_USER(), 'Insertado registro en multas'); 
END $$

CREATE TRIGGER trg_update_multas AFTER UPDATE ON multas 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('multas', CURRENT_USER(), 'Actualizado registro en multas'); 
END $$

CREATE TRIGGER trg_delete_multas AFTER DELETE ON multas 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('multas', CURRENT_USER(), 'Eliminado registro en multas'); 
END $$

CREATE TRIGGER trg_insert_prestamo AFTER INSERT ON prestamo 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('prestamo', CURRENT_USER(), 'Insertado registro en prestamo'); 
END $$

CREATE TRIGGER trg_update_prestamo AFTER UPDATE ON prestamo 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('prestamo', CURRENT_USER(), 'Actualizado registro en prestamo'); 
END $$

CREATE TRIGGER trg_delete_prestamo AFTER DELETE ON prestamo 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('prestamo', CURRENT_USER(), 'Eliminado registro en prestamo'); 
END $$

CREATE TRIGGER trg_insert_proveedor AFTER INSERT ON proveedor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('proveedor', CURRENT_USER(), 'Insertado registro en proveedor'); 
END $$

CREATE TRIGGER trg_update_proveedor AFTER UPDATE ON proveedor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('proveedor', CURRENT_USER(), 'Actualizado registro en proveedor'); 
END $$

CREATE TRIGGER trg_delete_proveedor AFTER DELETE ON proveedor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('proveedor', CURRENT_USER(), 'Eliminado registro en proveedor'); 
END $$

CREATE TRIGGER trg_insert_venta AFTER INSERT ON venta 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('venta', CURRENT_USER(), 'Insertado registro en venta'); 
END $$

CREATE TRIGGER trg_update_venta AFTER UPDATE ON venta 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('venta', CURRENT_USER(), 'Actualizado registro en venta'); 
END $$

CREATE TRIGGER trg_delete_venta AFTER DELETE ON venta 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('venta', CURRENT_USER(), 'Eliminado registro en venta'); 
END $$

DELIMITER ;
