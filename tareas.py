import mysql.connector
import threading
from mysql.connector import Error
import time
import os
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
import sys
import ctypes


conexion = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456'
)

HOST = 'localhost'


def añadirUsuario():
    try:
        usuario = input("Ingresa el nombre del usuario: ")
        contraseña = input("Ingresa la contraseña: ")
        cursor = conexion.cursor()
        sentencia = f"CREATE USER '{usuario}'@'{HOST}' IDENTIFIED BY '{contraseña}'"
        cursor.execute(sentencia)

        conexion.commit()
        print("Usuario añadido correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al añadir usuario:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")



def actualizarUsuario():
    try:
        usuario = input("Ingresa el nombre del usuario que quiere actualizar: ")
        nuevoUsuario = input("Ingresa el nuevo nombre del usuario: ")
        contraseña = input("Ingresa la nueva contraseña: ")
        cursor = conexion.cursor()
        
        sentencia = f"RENAME USER '{usuario}'@'{HOST}' TO '{nuevoUsuario}'@'{HOST}'"
        cursor.execute(sentencia)
        conexion.commit()
        
        sentencia2 = f"ALTER USER '{nuevoUsuario}'@'{HOST}' IDENTIFIED BY '{contraseña}'"
        cursor.execute(sentencia2)
        conexion.commit()
        
        print("Usuario actualizado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al actualizar usuario:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")


def eliminarUsuario():
    try: 
        usuario = input("Ingresa el nombre del usuario a ser eliminado: ")
        cursor = conexion.cursor()
        sentencia = f"DROP USER '{usuario}'@'{HOST}'"
        cursor.execute(sentencia)
        
        conexion.commit()
        print("Usuario eliminado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al eliminar usuario:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")


def añadirRol():
    try:
        rol = input("Ingresa el nombre del nuevo rol: ")
        cursor = conexion.cursor()
        sentencia = f"CREATE ROLE '{rol}'"
        cursor.execute(sentencia)

        conexion.commit()
        print("Rol creado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al crear rol:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")
        
        
def asignarRol():
    try:
        rol = input("Ingresa el nombre del rol: ")
        usuario = input("Ingresa el nombre del usuario: ")
        cursor = conexion.cursor()
        sentencia = f"GRANT '{rol}' TO '{usuario}'@localhost"
        cursor.execute(sentencia)

        conexion.commit()
        print("Rol asignado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al asignar rol:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")
        





def obtenerUsuarios():
    try:
        cursor = conexion.cursor()
        sentencia = f"SELECT User FROM mysql.user WHERE account_locked = 'N';"
        cursor.execute(sentencia)
        resultados = cursor.fetchall()

        for fila in resultados:
            print(fila)
        print("Presione enter para continuar")
        input()

    
    except mysql.connector.Error as error:
        print("Error al mostrar usuarios:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")



def obtenerRoles():
    try:
        cursor = conexion.cursor()
        sentencia = f"""SELECT User
                    FROM mysql.user
                    WHERE account_locked = 'Y'
                    AND User NOT IN ('mysql.infoschema', 'mysql.session', 'mysql.sys');"""

        cursor.execute(sentencia)
        resultados = cursor.fetchall()

        for fila in resultados:
            print(fila)
        print("Presione enter para continuar")
        input()
    
    except mysql.connector.Error as error:
        print("Error al obtener roles:", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")


def procedimientosAlmacenados():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='biblioteca_db'
    )
    try:
        cursor = conexion.cursor()
        cursor.execute("SHOW TABLES FROM biblioteca_db")
        tablas = cursor.fetchall()

        with open('crudProcedimientos.sql', 'w') as archivo:
            archivo.write(f"DELIMITER $$\n\n")
            
            for tabla in tablas:
                nombre_tabla = tabla[0]
                cursor.execute(f"DESCRIBE {nombre_tabla}")
                columnas = cursor.fetchall()
                
                primary_key = None
                columnas_nombres = []
                columnas_parametros = []
                columnas_update = []
                
                for columna in columnas:
                    col_name = columna[0]
                    col_type = columna[1]
                    if columna[3] == 'PRI' and columna[5] == 'auto_increment':
                        primary_key = col_name
                    else:
                        columnas_nombres.append(col_name)
                        columnas_parametros.append(f"IN p_{col_name} {col_type}")
                        columnas_update.append(f"{col_name} = p_{col_name}")

                columnas_insert = ", ".join(columnas_nombres)
                columnas_parametros = ", ".join(columnas_parametros)
                
                archivo.write(f"CREATE PROCEDURE Insertar_{nombre_tabla} ({columnas_parametros}) \n")
                archivo.write(f"BEGIN\n")
                archivo.write(f"    INSERT INTO {nombre_tabla} ({columnas_insert}) VALUES ({', '.join([f'p_{col}' for col in columnas_nombres])});\n")
                archivo.write(f"END $$\n\n")
                
                if primary_key:
                    archivo.write(f"CREATE PROCEDURE Actualizar_{nombre_tabla} (IN p_{primary_key} {columnas[0][1]}, {columnas_parametros}) \n")
                    archivo.write(f"BEGIN\n")
                    archivo.write(f"    UPDATE {nombre_tabla} SET {', '.join(columnas_update)} WHERE {primary_key} = p_{primary_key};\n")
                    archivo.write(f"END $$\n\n")
                
                if primary_key:
                    archivo.write(f"CREATE PROCEDURE Eliminar_{nombre_tabla} (IN p_{primary_key} {columnas[0][1]}) \n")
                    archivo.write(f"BEGIN\n")
                    archivo.write(f"    DELETE FROM {nombre_tabla} WHERE {primary_key} = p_{primary_key};\n")
                    archivo.write(f"END $$\n\n")
                
                archivo.write(f"CREATE PROCEDURE ObtenerTodos_{nombre_tabla} () \n")
                archivo.write(f"BEGIN\n")
                archivo.write(f"    SELECT * FROM {nombre_tabla};\n")
                archivo.write(f"END $$\n\n")
            
            archivo.write(f"DELIMITER ;\n")
    
        print("Scripts de procedimientos almacenados generados correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al generar script: ", error)

    finally:
        cursor.close()
        print("Cursor cerrado.")
        print("Presione enter para regresar al menú..")
        input()
        

def triggers():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='biblioteca_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()



        cursor.execute("SHOW TABLES FROM biblioteca_db")
        tablas = cursor.fetchall()
        


        with open('triggers.sql', 'w') as archivo:
            archivo.write("DELIMITER $$\n\n")
            
            for tabla in tablas:
                nombre_tabla = tabla[0]
                
                
                if nombre_tabla.lower() == 'auditoria':
                    continue
                
                # Trigger para INSERT
                archivo.write(f"CREATE TRIGGER trg_insert_{nombre_tabla} AFTER INSERT ON {nombre_tabla} \n")
                archivo.write(f"FOR EACH ROW \n")
                archivo.write(f"BEGIN \n")
                archivo.write(f"    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) \n")
                archivo.write(f"    VALUES ('{nombre_tabla}', CURRENT_USER(), 'Insertado registro en {nombre_tabla}'); \n")
                archivo.write(f"END $$\n\n")
                
                # Trigger para UPDATE
                archivo.write(f"CREATE TRIGGER trg_update_{nombre_tabla} AFTER UPDATE ON {nombre_tabla} \n")
                archivo.write(f"FOR EACH ROW \n")
                archivo.write(f"BEGIN \n")
                archivo.write(f"    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) \n")
                archivo.write(f"    VALUES ('{nombre_tabla}', CURRENT_USER(), 'Actualizado registro en {nombre_tabla}'); \n")
                archivo.write(f"END $$\n\n")
                
                # Trigger para DELETE
                archivo.write(f"CREATE TRIGGER trg_delete_{nombre_tabla} AFTER DELETE ON {nombre_tabla} \n")
                archivo.write(f"FOR EACH ROW \n")
                archivo.write(f"BEGIN \n")
                archivo.write(f"    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) \n")
                archivo.write(f"    VALUES ('{nombre_tabla}', CURRENT_USER(), 'Eliminado registro en {nombre_tabla}'); \n")
                archivo.write(f"END $$\n\n")
                
            archivo.write("DELIMITER ;\n")
            
        print("Triggers generados correctamente.")
        print("Presione enter para regresar al menú..")
        input()
    
    except mysql.connector.Error as error:
        print("Error al generar script con triggers: ", error)
    
    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")     
            

def procedimientoCursorTransaccion():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='biblioteca_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()
        cursor2 = conexion.cursor()
        
        cursor2.execute("SHOW PROCEDURE STATUS WHERE Name = 'InsertarMulta'")

        resultado = cursor2.fetchall()

        if resultado:
            print(f"El procedimiento almacenado InsertarMulta ya existe en la base de datos.")
            print("Presione enter para regresar al menú..")
            input()            
        else:
    
            consulta = """  
                            CREATE PROCEDURE InsertarMulta()
                            BEGIN
                                DECLARE v_prestamo_code INTEGER;
                                DECLARE done BOOLEAN DEFAULT FALSE;
                                DECLARE multa_existente INTEGER;
                            
                                -- Cursor to select all overdue unreturned loans
                                DECLARE cur CURSOR FOR 
                                SELECT p.prestamo_code 
                                FROM Prestamo p
                                LEFT JOIN Multas m ON p.prestamo_code = m.prestamo_code
                                WHERE p.estado_code = 1 
                                  AND CURDATE() > p.fecha_max_devolucion
                                  AND m.multa_code IS NULL; -- Verifica que no exista multa para este préstamo
                            
                                -- Handler for SQL exceptions
                                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                                BEGIN
                                    -- Rollback transaction if any error occurs
                                    ROLLBACK;
                                END;
                            
                                -- Handler for when cursor has no more rows
                                DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
                            
                                -- Start transaction
                                START TRANSACTION;
                            
                                -- Open the cursor
                                OPEN cur;
                            
                                -- Fetch the first row
                                FETCH cur INTO v_prestamo_code;
                            
                                WHILE NOT done DO
                                    -- Verificar si ya existe una multa para este préstamo
                                    SELECT COUNT(*) INTO multa_existente
                                    FROM Multas
                                    WHERE prestamo_code = v_prestamo_code;
                            
                                    IF multa_existente = 0 THEN
                                        -- Insertar multa solo si no existe
                                        INSERT INTO Multas (prestamo_code, multa_descripcion, multa_valor, multa_fecha) 
                                        VALUES (v_prestamo_code, 'Multa por retraso en devolución', 30, CURDATE());
                                    END IF;
                            
                                    -- Fetch the next row
                                    FETCH cur INTO v_prestamo_code;
                                END WHILE;
                            
                                -- Close the cursor
                                CLOSE cur;
                            
                                -- Commit transaction
                                COMMIT;
                            END //
                            """
            cursor.execute(consulta)
            conexion.commit()
            print("Procedimiento creado correctamente.")
            print("Presione enter para regresar al menú..")
            input()                
    
    except mysql.connector.Error as error:
        print("Error al crear el proceso.", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            cursor2.close()
            conexion.close()
            print("Conexión cerrada.")


def usarProcedimiento():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='biblioteca_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()
        cursor.callproc('InsertarMulta', ())

        conexion.commit()
        for result in cursor.stored_results():
            print(result.fetchall())

        print("Proceso realizado correctamente")
        print("Presione enter para regresar al menú..")
        input()    

    
    except mysql.connector.Error as error:
        print("Error al realizar el proceso.", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")
            
            
            

# Evento de inicio para sincronización
start_event = threading.Event()

def hilos():
    # Función para ejecutar las consultas en hilos
    def ejecutar_consulta(consulta, nombre_hilo):
        # Esperar hasta que todos los hilos estén listos para comenzar
        start_event.wait()

        # Establecer conexión a MySQL
        try:
            conexion = mysql.connector.connect(
                host='localhost',
                user='root',
                password='123456',
                database='biblioteca_db'
            )


            cursor = conexion.cursor()

            # Medir tiempo de ejecución
            start_time = time.time()

            cursor.execute(consulta)
            result = cursor.fetchall()

            end_time = time.time()
            elapsed_time = (end_time - start_time) * 1000  # Convertir a milisegundos

            print(f"{nombre_hilo} - Tiempo de respuesta: {elapsed_time:.2f} ms")
            print(f"{nombre_hilo} - Resultado:")
            for row in result:
                print(row)

            cursor.close()
        except Error as e:
            print(f"{nombre_hilo} - Error: {e}")
        finally:
            if conexion.is_connected():
                conexion.close()

    # Crear e iniciar hilos
    thread1 = threading.Thread(target=ejecutar_consulta, args=(
        """
            SELECT
                L.libro_nombre,
                E.editorial_nombre,
                G.genero_nombre
            FROM
                Libro L
            INNER JOIN Editorial E ON L.editorial_code = E.editorial_code
            INNER JOIN Genero G ON L.genero_code = G.genero_code
            WHERE
                L.libro_code = 2; 
    """, "Hilo 1"))
    thread2 = threading.Thread(target=ejecutar_consulta, args=(
        """SELECT
            (SELECT libro_nombre FROM Libro WHERE libro_code = 2) AS libro_nombre,
            (SELECT editorial_nombre FROM Editorial WHERE editorial_code = (SELECT editorial_code FROM Libro WHERE libro_code = 2)) AS editorial_nombre,
            (SELECT genero_nombre FROM Genero WHERE genero_code = (SELECT genero_code FROM Libro WHERE libro_code = 2)) AS genero_nombre;
            """, "Hilo 2"))
    thread3 = threading.Thread(target=ejecutar_consulta, args=(
        """SELECT
            L.libro_nombre,
            E.editorial_nombre,
            G.genero_nombre
        FROM
            Libro L, Editorial E, Genero G
        WHERE
            L.editorial_code = E.editorial_code
            AND L.genero_code = G.genero_code
            AND L.libro_code = 2; """, "Hilo 3"))

    thread1.start()
    thread2.start()
    thread3.start()

    # Iniciar simultáneamente
    start_event.set()

    # Esperar a que los hilos terminen
    thread1.join()
    thread2.join()
    thread3.join()

    print("\nPresiona Enter para salir...")
    input()    

# def run_as_admin():
#     # Verificar si ya se están ejecutando como administrador
#     if ctypes.windll.shell32.IsUserAnAdmin() == 0:
#         # Si no, volver a ejecutar con permisos elevados
#         ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)



def generate_filtered_logs_pdf():

    # run_as_admin()

    LOG_FILE_PATH = r"C:/ProgramData/MySQL/MySQL Server 8.0/Data/DESKTOP-U174B3T.err"
    OUTPUT_PDF_PATH = 'filtered_error_logs.pdf'

    # Solicitar al usuario las fechas de inicio y fin
    start_date = input("Introduce la fecha de inicio (formato YYYY-MM-DD): ")
    end_date = input("Introduce la fecha de fin (formato YYYY-MM-DD): ")

    # Verifica que el archivo exista
    if not os.path.exists(LOG_FILE_PATH):
        raise FileNotFoundError(f"El archivo de log no se encontró en la ruta especificada: {LOG_FILE_PATH}")   

    # Leer el archivo de errores
    with open(LOG_FILE_PATH, 'r', encoding='utf-8') as file:
        log_lines = file.readlines()

    # Filtrar las líneas del log según el tiempo (esto es un ejemplo simple)
    filtered_logs = []
    with open(LOG_FILE_PATH, 'r') as file:
        log_lines = file.readlines()
        for line in log_lines:
            # Extraer la fecha del log (primeros 10 caracteres correspondientes a YYYY-MM-DD)
            log_date = line[:10]
            # Filtrar por rango de fechas
            if start_date <= log_date <= end_date:
                filtered_logs.append(line.strip())

    # Crear un archivo PDF con los logs filtrados
    pdf = canvas.Canvas(OUTPUT_PDF_PATH, pagesize=letter)
    width, height = letter

    # Agregar título al PDF
    pdf.drawString(30, height - 40, "Filtered Error and Slow Query Logs")
    y = height - 60

    # Agregar logs filtrados al PDF
    for log in filtered_logs:
        pdf.drawString(30, y, log.strip())
        y -= 20
        if y < 40:
            pdf.showPage()
            y = height - 40

    # Guardar el PDF
    pdf.save()

    print(f"PDF generado: {OUTPUT_PDF_PATH}")
    
    
def cerrarMenu():
    print(conexion.is_connected())
    if conexion.is_connected():
        conexion.close()
        print("Conexión cerrada.")
    else: 
        print("Saliendo del gestor.")