import mysql.connector
from time import sleep
def connect_to_db():
    try:
        connection = mysql.connector.connect(host="localhost",
                                            user="root",
                                            password="",
                                            database="cpw_sql")
        print("Connected to MySQL database")
        return connection
    except Exception as e:
     print("Error"+e)
     print("Will reconnection to db in 3 sec.")
     sleep(3)
     connect_to_db()

def format_time(time):
    return time.strftime('%Y-%m-%d %H:%M:%S')

def insert_text_and_type(message, message_group, reply, user_id,user_type="bot"):
    try:
        connection = connect_to_db()
        db_cursor = connection.cursor()

        if(user_type == "contacter"):
            # คำสั่ง SQL สำหรับเพิ่มข้อมูล
            sql_command = "INSERT INTO contacter_message (message_id,message, message_group, reply, c_id) VALUES (UUID(), %s, %s, %s, %s)"
            # ทำการ execute คำสั่ง SQL
            db_cursor.execute(sql_command, (message, message_group, int(reply), user_id))
        elif(user_type == "admin"):  ##ยังทำไม่ได้ทำๆไวก่อน อย่าพึ่งไปสนใจ
            # คำสั่ง SQL สำหรับเพิ่มข้อมูล
            sql_command = "INSERT INTO admin_message (`a_message_id`,`message`,`userID`,`last_interact`,`c_id`) VALUES (UUID(),%s,1,%s,%s)"
            # ทำการ execute คำสั่ง SQL
            db_cursor.execute(sql_command, (message, message_group, int(reply), user_id))
        else:
            # คำสั่ง SQL สำหรับเพิ่มข้อมูล
            sql_command = "INSERT INTO admin_message (`a_message_id`,`message`,`userID`,`c_id`) VALUES (UUID(),%s,9999,%s)"
            # ทำการ execute คำสั่ง SQL
            db_cursor.execute(sql_command, (message,user_id))

        connection.commit()
        connection.close()

        print("Insertion successful.")
        update_interact_contacter(user_id,user_type)
        
    except Exception as e:
        connection.rollback()
        print(f"Error: {e}")

def search_contacter(c_id):
    try:
        print("Get in search_contacter <<")
        connection = connect_to_db()
        db_cursor = connection.cursor()

        # คำสั่ง SQL สำหรับเพิ่มข้อมูล
        sql_command = "select * from contacter where c_id = %s"
        # ทำการ execute คำสั่ง SQL
        db_cursor.execute(sql_command, (c_id,))

        res = db_cursor.fetchall()
        print(f"search_contacter result {res}")
        return res
        # connection.close()

    except Exception as e:
        print(f"Error: {e}")

def insert_contacter(c_id,c_name):
    try:
        connection = connect_to_db()
        db_cursor = connection.cursor()

        # คำสั่ง SQL สำหรับเพิ่มข้อมูล
        sql_command = "Insert into contacter (c_id,c_name) VALUES (%s,%s)"
    
        # ทำการ execute คำสั่ง SQL
        db_cursor.execute(sql_command, (c_id,c_name))

        connection.commit()
        connection.close()

        print("Insertion successful.")
    except Exception as e:
        connection.rollback()
        print(f"Error: {e}")

def update_interact_contacter(c_id,user_type):
    print(">>>Get in update_interact_contacter(c_id)<<<<")
    try:
        connection = connect_to_db()
        db_cursor = connection.cursor()

        if(user_type == "contacter"):
            # คำสั่ง SQL สำหรับดึงเวลลาที่มีการติดต่อล่าสุดของcontacter
            sql_command = "SELECT max(last_interact) FROM `contacter_message` WHERE c_id = %s"
        elif(user_type in ["admin","bot"]):
            sql_command = "SELECT max(last_interact) FROM `admin_message` WHERE c_id = %s"
    
        # ทำการ execute คำสั่ง SQL
        db_cursor.execute(sql_command, (c_id,))

        # ทำการformat datetime ให้อ่านออกใช้method fetchOne แล้วเลือกndex 0 ไปใส่ function format_time
        last_contacter_interact_time = format_time(db_cursor.fetchone()[0])

        print(f"get last_contacter_interact_time : {last_contacter_interact_time }")


        # คำสั่ง SQL สำหรับupdate ติดต่อล่าสุดของcontacter
        sql_command = "UPDATE contacter SET last_interact = %s WHERE c_id = %s"
        db_cursor.execute(sql_command, (last_contacter_interact_time,c_id,))

        connection.commit()
        connection.close()

        print(f"Update successful. Time :{last_contacter_interact_time} userId :{c_id}")
    except Exception as e:
        connection.rollback()
        print(f"Error: {e}")
    


