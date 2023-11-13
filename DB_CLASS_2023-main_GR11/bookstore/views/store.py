import re
from typing_extensions import Self
from flask import Flask, request, template_rendered, Blueprint
from flask import url_for, redirect, flash
from flask import render_template
from flask_login import LoginManager, UserMixin, login_user, logout_user, login_required, current_user
from datetime import datetime,timedelta
from numpy import identity, product
import random, string
from sqlalchemy import null
from link import *
import math
from base64 import b64encode
from api.sql import Member, Order_List, Record, Product, TEMP, Cart

store = Blueprint('bookstore', __name__, template_folder='../templates')

@store.route('/', methods=['GET', 'POST'])
@login_required


def bookstore():
    result = Product.count()
    count = math.ceil(result[0]/9)
    flag = 0

    if request.method == 'GET':
        if(current_user.role == 'manager'):
            flash('No permission')
            return redirect(url_for('manager.home'))

    if 'keyword' in request.args and 'page' in request.args:
        total = 0
        single = 1
        page = int(request.args['page'])
        start = (page - 1) * 9
        end = page * 9
        search = request.values.get('keyword')
        keyword = search
        
        cursor.prepare('SELECT * FROM PRODUCT WHERE PNAME LIKE :search and AVAILABLE >=1')
        cursor.execute(None, {'search': '%' + keyword + '%'})
        book_row = cursor.fetchall()
        book_data = []
        final_data = []
        
        for i in book_row:
            book = {
                '商品編號': i[0],
                '商品名稱': i[1],
                '商品價格': i[2],
                '類別': i[3],
                '品牌': i[6],
                '狀態': i[7],
                '庫存數量': i[10]
            }
            book_data.append(book)
            total = total + 1
        
        if(len(book_data) < end):
            end = len(book_data)
            flag = 1
            
        for j in range(start, end):
            final_data.append(book_data[j])
            
        count = math.ceil(total/9)
        
        return render_template('bookstore.html', single=single, keyword=search, book_data=book_data, user=current_user.name, page=1, flag=flag, count=count)    

    elif 'pid' in request.args:
        pid = request.args['pid']
        data = Product.get_product(pid)
        pname = data[1]
        price = data[2]
        category = data[3]
        description = data[4]
        available = data[10]
        image = 'bag.png'
        
        product = {
            '商品編號': pid,
            '商品名稱': pname,
            '單價': price,
            '類別': category,
            '商品敘述': description,
            '商品圖片': image,
            '庫存數量': available
        }

        return render_template('product.html', data = product, user=current_user.name)

    elif 'page' in request.args:
        page = int(request.args['page'])
        start = (page - 1) * 9
        end = page * 9
        # cid = request.args['cid']
        # if cid:
        #     book_row = Product.get_cate_product(cid)
        # else:
        book_row = Product.get_all_product()
        book_data = []
        final_data = []
        print("current_user",current_user.id)
        for i in book_row:
            book = {
                '商品編號': i[0],
                '商品名稱': i[1],
                '商品價格': i[2],
                '類別': i[3],
                '品牌': i[6],
                '狀態': i[7],
                '庫存數量': i[10]
            }
            book_data.append(book)
            
        if(len(book_data) < end):
            end = len(book_data)
            flag = 1
            
        for j in range(start, end):
            final_data.append(book_data[j])
        
        return render_template('bookstore.html', book_data=final_data, user=current_user.name, page=page, flag=flag, count=count)    
    
    elif 'keyword' in request.args:
        single = 1
        search = request.values.get('keyword')
        keyword = search
        cursor.prepare('SELECT * FROM PRODUCT WHERE PNAME LIKE :search and AVAILABLE >=1')
        cursor.execute(None, {'search': '%' + keyword + '%'})
        book_row = cursor.fetchall()
        book_data = []
        total = 0
        
        for i in book_row:
            book = {
                '商品編號': i[0],
                '商品名稱': i[1],
                '商品價格': i[2],
                '類別': i[3],
                '品牌': i[6],
                '狀態': i[7],
                '庫存數量': i[10]
            }

            book_data.append(book)
            total = total + 1
            
        if(len(book_data) < 9):
            flag = 1
        
        count = math.ceil(total/9)    
        
        return render_template('bookstore.html', keyword=search, single=single, book_data=book_data, user=current_user.name, page=1, flag=flag, count=count)    
    
    else:
        book_row = Product.get_all_product()
        book_data = []
        temp = 0
        for i in book_row:
            book = {
                '商品編號': i[0],
                '商品名稱': i[1],
                '商品價格': i[2],
                '類別': i[3],
                '品牌': i[6],
                '狀態': i[7],
                '庫存數量': i[10]
            }
            if len(book_data) < 9:
                book_data.append(book)
        
        return render_template('bookstore.html', book_data=book_data, user=current_user.name, page=1, flag=flag, count=count)


# 為了取CARTTIME
# 自己新加的
def get_carttime():
    data = Cart.get_cart(current_user.id)
    max = data[0][1]
    for i in data:
        print("\n\n\n\n\n\n\ntemp",i)
        temp = i[1]
        if temp > max:
            max = temp
    carttime = max
    return carttime


# 會員購物車
@store.route('/cart', methods=['GET', 'POST'])
@login_required # 使用者登入後才可以看
def cart():
    count = 0
    # 以防管理者誤闖
    if request.method == 'GET':
        if( current_user.role == 'manager'):
            flash('No permission')
            return redirect(url_for('manager.home'))
    # 回傳有 pid 代表要 加商品
    if request.method == 'POST':
        if "pid" in request.form :
            data = Cart.get_cart(current_user.id)
            if(data == []):
                carttime = str(datetime.now().strftime('%Y/%m/%d %H:%M:%S'))
                format = 'yyyy/mm/dd hh24:mi:ss'
                Cart.add_cart(current_user.id, carttime, format) # 幫他加一台購物車
            else:
                data = Cart.get_cart(current_user.id)
                max = data[0][1]
                for i in data:
                    print("\n\n\n\n\n\n\ntemp",i)
                    temp = i[1]
                    if temp > max:
                        max = temp
                carttime = max
            #tno = data[2] # 取得交易編號
            pid = request.values.get('pid') # 使用者想要購買的東西

            # 檢查購物車裡面有沒有商品
            product = TEMP.check_product(current_user.id, carttime, pid)

            # 取得商品價錢
            price = Product.get_product(pid)[2]
            available = Product.get_product(pid)[10]

            # 如果購物車裡面沒有的話 把他加一個進去
            if(product == None and int(available) >=1):
                TEMP.add_product(pid, current_user.id, carttime, 1)
            
            elif(int(available) >=1):
                # 假如購物車裡面有的話，就多加一個進去
                amount = TEMP.get_amount(current_user.id, carttime, pid)
                #total = (amount+1)*int(price)
                TEMP.update_product(pid, current_user.id, carttime, amount+1)
                

        elif "delete" in request.form :
            pid = request.values.get('delete')
            #tno = Cart.get_cart(current_user.id)[2]
            carttime = get_carttime()
            format = 'yyyy/mm/dd hh24:mi:ss'
            TEMP.delete_cart(current_user.id, carttime, pid)
            product_data = only_cart()
        
        elif "user_edit" in request.form:
            change_order()  
            return redirect(url_for('bookstore.bookstore'))
        
        elif "buy" in request.form:
            change_order()
            return redirect(url_for('bookstore.order'))

        elif "order" in request.form:
           ##tno = Cart.get_cart(current_user.id)[2]
            # total = TEMP.get_total_money(tno)
            number = str(random.randrange( 10000, 99999))
            en = random.choice(string.ascii_letters)
            tno = en + number
            # 這裡要+1
            #time = str(datetime.now().strftime('%Y/%m/%d %H:%M:%S'))
            format = 'yyyy/mm/dd hh24:mi:ss'
            type1 = request.values.get('type1')
            method = request.values.get('method')
            cardId = request.values.get('cardId')
            bankId = request.values.get('bankId')
            bankname = request.values.get('bankname')
            startDate =  request.values.get('startDate')
            endDate = request.values.get('endDate')
            if (endDate <= startDate):
                flash('too short')
                return redirect(url_for('bookstore.order'))
            else:
                Order_List.add_order(tno, current_user.id, startDate, endDate, format, type1, method, cardId, bankId, bankname)
                count +=1
                carttime = get_carttime()
            
                #get temp
                product_row = TEMP.get_record(current_user.id, carttime)
                for i in product_row:
                    pid = i[0]
                    amount = i[3]
                    sumprice = (Product.get_product(pid)[2])*amount
                    available = int(Product.get_product(pid)[10])
                    available =  available - amount
                    Record.add_record(tno, pid, amount, sumprice)
                    TEMP.delete_cart(current_user.id, carttime, pid)
                    Product.update_available(pid, available)
                return render_template('complete.html', user=current_user.name)
    
    product_data = only_cart()

    if product_data == 0:
        return render_template('empty.html', user=current_user.name)
    else:
        return render_template('cart.html', data=product_data, user=current_user.name)

@store.route('/order')
def order():
    data = Cart.get_cart(current_user.id)
    # tno = data[2]
    carttime = get_carttime()
    product_row = TEMP.get_record(current_user.id, carttime)
    
    product_data = []
    total = 0
    startDate = str(datetime.now().strftime('%Y-%m-%d'))
    seven_days = timedelta(days=7)
    endDate = datetime.today() + seven_days
    endDate = endDate.strftime('%Y-%m-%d')
    for i in product_row:

        amount = i[3]
        price = (Product.get_product(i[0])[2])*amount
        pname = Product.get_name(i[0])
        available = Product.get_product(i[0])[10]
        product = {
            '商品編號': i[0],
            '商品名稱': pname,
            '商品價格': price,
            '數量': i[3],
            '庫存數量': available
        }
        product_data.append(product)
        total += price
    # total = TEMP.get_total(tno)[0]
    return render_template('order.html', data=product_data, total=total, user=current_user.name, startDate = startDate, endDate = endDate)

@store.route('/orderlist')
def orderlist():
    if "tno" in request.args :
        pass
    
    user_id = current_user.id

    data = Member.get_order(user_id)
    orderlist = []
    
    orderdetail_row = Order_List.get_orderdetail()
    orderdetail = []
    # for j in orderdetail_row:
    #     temp = {
    #         '訂單編號': j[0],
    #         '商品名稱': j[1],
    #         '商品總價': j[2],
    #         '訂購數量': j[3],
    #     }
    #     orderdetail.append(temp)

    for i in data:
        totalsum = 0
        for j in orderdetail_row:
            if i[0] == j[0]:
                temp = {
                    '訂單編號': j[0],
                    '商品名稱': j[1],
                    '商品總價': j[2],
                    '訂購數量': j[3],
                }
                orderdetail.append(temp)
                totalsum += j[2]
        temp1 = {
            '訂單編號': i[0],
            '訂單總價': totalsum,
            '訂單時間': i[2]
        }
        orderlist.append(temp1)
    


    return render_template('orderlist.html', data=orderlist, detail=orderdetail, user=current_user.name)


def change_order():
    data = Cart.get_cart(current_user.id)
    # tno = data[2] # 使用者有購物車了，購物車的交易編號是什麼
    carttime = get_carttime()
    product_row = TEMP.get_record(current_user.id, carttime)
    
    for i in product_row:
        TEMP.update_product(i[0], current_user.id, carttime, request.form[i[0]])

        # if int(request.form[i[1]]) != i[2]:
        # TEMP.update_product({
        #     'pId':i[1],
        #     'mid':current_user.id,
        #     'cartTime':carttime,
        #     'amount':request.form[i[0]]
        #     # 'tno':tno,
        #     # 'total':int(request.form[i[1]])*int(i[3])
        # })
        print('change')

    return 0


def only_cart():
    
    count = Cart.check(current_user.id)

    if(count == None):
        return 0
    
    data = Cart.get_cart(current_user.id)
    #tno = data[2]
    max = data[0][1]
    for i in data:
        print("\n\n\n\n\n\n\ntemp",i)
        temp = i[1]
        if temp > max:
            max = temp
    carttime = max
    product_row = TEMP.get_record(current_user.id, carttime)
    product_data = []

    for i in product_row:
        pid = i[0]
        pname = Product.get_name(i[0])
        amount = i[3]
        price = (Product.get_product(pid)[2])*amount
        available = Product.get_product(pid)[10]
        product = {
            '商品編號': pid,
            '商品名稱': pname,
            '商品價格': price,
            '數量': amount,
            '庫存數量': available
        }
        product_data.append(product)
    
    return product_data