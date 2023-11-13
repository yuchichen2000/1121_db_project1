from typing import Optional
from link import *

class DB():
    def connect():
        cursor = connection.cursor()
        return cursor

    def prepare(sql):
        cursor = DB.connect()
        cursor.prepare(sql)
        return cursor

    def execute(cursor, sql):
        cursor.execute(sql)
        return cursor

    def execute_input(cursor, input):
        cursor.execute(None, input)
        return cursor

    def fetchall(cursor):
        return cursor.fetchall()

    def fetchone(cursor):
        return cursor.fetchone()

    def commit():
        connection.commit()

class Member():
    def get_member(account):
        sql = "SELECT ACCOUNT, PASSWORD, MID, IDENTITY, NAME FROM MEMBER WHERE ACCOUNT = :id"
        return DB.fetchall(DB.execute_input(DB.prepare(sql), {'id' : account}))
    
    def get_all_account():
        sql = "SELECT ACCOUNT FROM MEMBER"
        return DB.fetchall(DB.execute(DB.connect(), sql))

    def create_member(input):
        sql = 'INSERT INTO MEMBER VALUES (null, :name, :account, :password, :identity, :phone, :mail, null )'
        DB.execute_input(DB.prepare(sql), input)
        DB.commit()
    
    def delete_product(userid, time, pid, format):
        sql = 'DELETE FROM TEMP WHERE mId = :id and cartTime=:carttime and pId = :pid'
        DB.execute_input(DB.prepare(sql), {'pid':pid, 'mId': userid, 'carttime': time})
        DB.commit()
        
    def get_order(userid):
        sql = 'SELECT * FROM TRANS_ORDER WHERE MID = :id ORDER BY STARTTIME DESC'
        return DB.fetchall(DB.execute_input( DB.prepare(sql), {'id':userid}))
    
    def get_role(userid):
        sql = 'SELECT IDENTITY, NAME FROM MEMBER WHERE MID = :id '
        return DB.fetchone(DB.execute_input( DB.prepare(sql), {'id':userid}))

class Cart():
    def check(user_id):
        sql = 'SELECT * FROM CART, TEMP WHERE CART.MID = :id AND CART.CARTTIME = TEMP.CARTTIME'
        return DB.fetchone(DB.execute_input(DB.prepare(sql), {'id': user_id}))
        
    def get_cart(user_id):
        sql = 'SELECT * FROM CART WHERE MID = :id'
        return DB.fetchall(DB.execute_input(DB.prepare(sql), {'id': user_id}))
    # cart_tno_seq.nextval
    def add_cart(user_id, time, format):
        sql = 'INSERT INTO CART VALUES (:id, TO_DATE(:time, :format), null)'
        DB.execute_input( DB.prepare(sql), {'id': user_id, 'time':time, 'format': format})
        DB.commit()

    def clear_cart(user_id):
        sql = 'DELETE FROM CART WHERE MID = :id '
        DB.execute_input( DB.prepare(sql), {'id': user_id})
        DB.commit()
       
class Product():
    def count():
        sql = 'SELECT COUNT(*) FROM PRODUCT'
        return DB.fetchone(DB.execute( DB.connect(), sql))
    
    def get_product(pid):
        sql ='SELECT * FROM PRODUCT WHERE PID = :id'
        return DB.fetchone(DB.execute_input(DB.prepare(sql), {'id': pid}))

    def get_all_product():
        sql = 'SELECT * FROM PRODUCT WHERE AVAILABLE >=1'
        return DB.fetchall(DB.execute( DB.connect(), sql))
    
    def get_all_category():
        sql = 'SELECT * FROM CATEGORY'
        return DB.fetchall(DB.execute( DB.connect(), sql))
    
    def get_name(pid):
        sql = 'SELECT PNAME FROM PRODUCT WHERE PID = :id'
        return DB.fetchone(DB.execute_input( DB.prepare(sql), {'id':pid}))[0]

    def add_product(input):
        sql = 'INSERT INTO PRODUCT VALUES (:pid, :pname, :price1, :category, :description, :cid1, :brand1, :status1, :level1, :year1, :volume1)'
        DB.execute_input(DB.prepare(sql), input)
        DB.commit()
    
    def delete_product(pid):
        sql = 'DELETE FROM PRODUCT WHERE PID = :id '
        DB.execute_input(DB.prepare(sql), {'id': pid})
        DB.commit()

    def update_product(input):
        sql = 'UPDATE PRODUCT SET PNAME= :pname, PRICE= :price1, CATEGORY= :category, PDESC= :description, CID= :cid1, STATUS= :status1, PLEVEL= :level1, YEAR= :year1, AVAILABLE= :volume1 WHERE PID= :pid'
        DB.execute_input(DB.prepare(sql), input)
        DB.commit()
        
    def update_available(pid, available):
        sql = 'UPDATE PRODUCT SET AVAILABLE = :available WHERE PID = :pid'
        DB.execute_input(DB.prepare(sql), {'pid': pid,'available':available})
        DB.commit()

class TEMP():
    def get_total_money(tno):
        sql = 'SELECT SUM(TOTAL) FROM RECORD WHERE TNO=:tno'
        return DB.fetchone(DB.execute_input(DB.prepare(sql), {'tno': tno}))[0]

    def check_product(user_id,carttime,pid):
        sql = 'SELECT * FROM TEMP WHERE mId = :id and cartTime=:carttime and pId = :pid'
        return DB.fetchone(DB.execute_input(DB.prepare(sql), {'id': user_id, 'carttime': carttime, 'pid': pid}))

    def get_price(pid):
        sql = 'SELECT PRICE FROM PRODUCT WHERE PID = :id'
        return DB.fetchone(DB.execute_input(DB.prepare(sql), {'id': pid}))[0]

    def add_product(pid, user_id, carttime, amount):
        sql = 'INSERT INTO TEMP VALUES (:pid, :user_id, :carttime, :amount)'
        DB.execute_input(DB.prepare(sql), {'pid': pid, 'user_id':user_id, 'carttime': carttime, 'amount': amount})
        DB.commit()

    def get_record(user_id,carttime):
        sql = 'SELECT * FROM TEMP WHERE mId = :id and cartTime=:carttime'
        return DB.fetchall( DB.execute_input( DB.prepare(sql), {'id': user_id, 'carttime': carttime}))

    def get_amount(user_id, carttime, pid):
        sql = 'SELECT AMOUNT FROM TEMP WHERE mId = :user_id and cartTime=:carttime and pId = :pid'
        return DB.fetchone( DB.execute_input( DB.prepare(sql) , {'user_id': user_id, 'carttime': carttime, 'pid': pid}) )[0]
    
    def update_product(pid, user_id, carttime, amount):
        sql = 'UPDATE TEMP SET AMOUNT = :amount WHERE mId = :user_id and cartTime=:carttime and pId = :pid'
        DB.execute_input(DB.prepare(sql),{'user_id': user_id, 'carttime': carttime, 'pid': pid, 'amount': amount})
        DB.commit()

    def delete_cart(user_id, carttime, pid):
        sql = 'DELETE FROM TEMP WHERE mId = :user_id and cartTime=:carttime and pId = :pid'
        DB.execute_input( DB.prepare(sql), {'user_id': user_id, 'carttime': carttime, 'pid': pid})
        DB.commit()
    
    def delete_check(pid):
        sql = 'SELECT * FROM RECORD WHERE PID=:pid'
        return DB.fetchone(DB.execute_input( DB.prepare(sql), {'pid':pid}))

    def get_total(tno):
        sql = 'SELECT SUM(TOTAL) FROM RECORD WHERE TNO = :id'
        return DB.fetchall(DB.execute_input( DB.prepare(sql), {'id':tno}))[0]
    

class Record():
    def add_record(tno, pid, amount, sumprice):
        # 'INSERT INTO ORDER_LIST VALUES (null, :mid, TO_DATE(:time, :format ), :total, :tno)'
        sql = 'INSERT INTO TRANS_RECORD VALUES (:tno, :pid, :amount, :sumprice)'
        DB.execute_input(DB.prepare(sql), {'tno': tno, 'pid': pid, 'amount': amount, 'sumprice': sumprice})
        DB.commit()


class Order_List():
    def add_order(tno, mid, starttime, endtime, format, type1, method, cardId, bankId, bankname):
        # 'INSERT INTO ORDER_LIST VALUES (null, :mid, TO_DATE(:time, :format ), :total, :tno)'
        sql = 'INSERT INTO TRANS_ORDER VALUES (:tno, :mid, TO_DATE(:time, :format), TO_DATE(:time1, :format), :type1, :method, :cardId, :bankId, :bankname, :done)'
        DB.execute_input(DB.prepare(sql), {'tno': tno, 'mid': mid, 'time': starttime, 'time1': endtime, 'format': format,'type1': type1, 'method': method, 'cardId': cardId, 'bankId': bankId, 'bankname': bankname, 'done':'NO'})
        DB.commit()
    
    def get_order():
        sql = 'SELECT TNO, NAME, STARTTIME, ENDTIME, TYPE, METHOD, DONE FROM TRANS_ORDER NATURAL JOIN MEMBER ORDER BY STARTTIME DESC'
        return DB.fetchall(DB.execute(DB.connect(), sql))
    
    def get_orderdetail():
        sql = 'SELECT T.TNO, P.PNAME, R.SUMPRICE, R.AMOUNT FROM TRANS_ORDER T,TRANS_RECORD R, PRODUCT P WHERE T.TNO = R.TNO AND R.PID = P.PID'
        return DB.fetchall(DB.execute(DB.connect(), sql))
    
    def update_order(tno):
        sql = 'UPDATE TRANS_ORDER SET DONE = :value WHERE TNO=:tno'
        DB.execute_input(DB.prepare(sql), {'value': 'DONE', 'tno':tno})
        DB.commit()
    
    def get_orderamount(tno):
        sql = 'SELECT R.PID, R.AMOUNT, P.AVAILABLE FROM TRANS_RECORD R JOIN PRODUCT P ON P.PID = R.PID WHERE R.TNO = :tno'
        return DB.fetchall(DB.execute_input( DB.prepare(sql), {'tno': tno}))
    
    

class Analysis():
    def month_price(i):
        """
        sql = 'SELECT EXTRACT(MONTH FROM ORDERTIME), SUM(PRICE) FROM ORDER_LIST WHERE EXTRACT(MONTH FROM ORDERTIME)=:mon GROUP BY EXTRACT(MONTH FROM ORDERTIME)'
        """
        sql = 'SELECT EXTRACT(MONTH FROM STARTTIME), SUM(PRICE * AMOUNT) FROM TRANS_ORDER,TRANS_RECORD, PRODUCT WHERE TRANS_ORDER.TNO = TRANS_RECORD.TNO AND PRODUCT.PID = TRANS_RECORD.PID AND EXTRACT(MONTH FROM STARTTIME)=:mon GROUP BY EXTRACT(MONTH FROM STARTTIME)'
        return DB.fetchall( DB.execute_input( DB.prepare(sql) , {"mon": i}))

    def month_count(i):
        """
        sql = 'SELECT EXTRACT(MONTH FROM ORDERTIME), COUNT(OID) FROM ORDER_LIST WHERE EXTRACT(MONTH FROM ORDERTIME)=:mon GROUP BY EXTRACT(MONTH FROM ORDERTIME)'
        """
        sql = 'SELECT EXTRACT(MONTH FROM STARTTIME), COUNT(TNO) FROM TRANS_ORDER WHERE EXTRACT(MONTH FROM STARTTIME)=:mon GROUP BY EXTRACT(MONTH FROM STARTTIME)'
        return DB.fetchall( DB.execute_input( DB.prepare(sql), {"mon": i}))
    
    """ 
    category_sale,負責圓餅圖部分
    這裡有改,把PRODUCT、TRANS_RECORD、CATEGORY加在一起,
    因為我不知道怎麼改TARNS_RECORD裡面的sumprice,
    所以我用JOIN再一起算,搞定sumprice可以把 SUM(PRICE * AMOUNT) 換成 SUM(SUMPRICE)
    """

    def category_sale():
        sql = 'SELECT SUM(PRICE * AMOUNT), CNAME FROM(SELECT * FROM PRODUCT,TRANS_RECORD,CATEGORY WHERE PRODUCT.PID = TRANS_RECORD.PID AND PRODUCT.CID = CATEGORY.CID) GROUP BY CNAME'
        return DB.fetchall( DB.execute( DB.connect(), sql))
    
    """改到這裡""" 

    """member_sale,負責消費總額排名的金額
    這裡有改,PRICE * AMOUNT 的原因同上"""

    def member_sale():
        """
        sql = 'SELECT SUM(PRICE), MEMBER.MID, MEMBER.NAME FROM ORDER_LIST, MEMBER WHERE ORDER_LIST.MID = MEMBER.MID AND MEMBER.IDENTITY = :identity GROUP BY MEMBER.MID, MEMBER.NAME ORDER BY SUM(PRICE) DESC'
        """
        sql = 'SELECT SUM(PRICE * AMOUNT), MEMBER.MID, MEMBER.NAME FROM TRANS_ORDER, MEMBER, TRANS_RECORD, PRODUCT WHERE TRANS_ORDER.MID = MEMBER.MID AND TRANS_ORDER.TNO = TRANS_RECORD.TNO AND PRODUCT.PID = TRANS_RECORD.PID AND MEMBER.IDENTITY = :identity GROUP BY MEMBER.MID, MEMBER.NAME ORDER BY SUM(PRICE * AMOUNT) DESC'
        return DB.fetchall( DB.execute_input( DB.prepare(sql), {'identity':'user'}))

    """到這"""

    """member_sale_count,負責消費總額排名的數量,這裡有改"""

    def member_sale_count():
        """
        sql = 'SELECT COUNT(*), MEMBER.MID, MEMBER.NAME FROM ORDER_LIST, MEMBER WHERE ORDER_LIST.MID = MEMBER.MID AND MEMBER.IDENTITY = :identity GROUP BY MEMBER.MID, MEMBER.NAME ORDER BY COUNT(*) DESC'
        """
        sql = 'SELECT COUNT(*), MEMBER.MID, MEMBER.NAME FROM TRANS_ORDER, MEMBER, TRANS_RECORD, PRODUCT WHERE TRANS_ORDER.MID = MEMBER.MID AND TRANS_ORDER.TNO = TRANS_RECORD.TNO AND PRODUCT.PID = TRANS_RECORD.PID AND MEMBER.IDENTITY = :identity GROUP BY MEMBER.MID, MEMBER.NAME ORDER BY COUNT(*) DESC'
        return DB.fetchall( DB.execute_input( DB.prepare(sql), {'identity':'user'}))