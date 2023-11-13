from flask import Blueprint, render_template, request, url_for, redirect, flash
from flask_login import LoginManager, UserMixin, login_user, logout_user, login_required, current_user
from link import *
from api.sql import *
import imp, random, os, string
from werkzeug.utils import secure_filename
from flask import current_app

UPLOAD_FOLDER = 'static/product'
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

manager = Blueprint('manager', __name__, template_folder='../templates')

def config():
    current_app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
    config = current_app.config['UPLOAD_FOLDER'] 
    return config

@manager.route('/', methods=['GET', 'POST'])
@login_required
def home():
    return redirect(url_for('manager.productManager'))

@manager.route('/productManager', methods=['GET', 'POST'])
@login_required
def productManager():
    if request.method == 'GET':
        if(current_user.role == 'user'):
            flash('No permission')
            return redirect(url_for('index'))
        
    if 'delete' in request.values:
        pid = request.values.get('delete')
        data = TEMP.delete_check(pid)
        
        if(data != None):
            flash('failed')
        else:
            data = Product.get_product(pid)
            Product.delete_product(pid)
    
    elif 'edit' in request.values:
        pid = request.values.get('edit')
        return redirect(url_for('manager.edit', pid=pid))
    
    book_data = book()
    return render_template('productManager.html', book_data = book_data, user=current_user.name)

def book():
    book_row = Product.get_all_product()
    cate_row = Product.get_all_category()
    book_data = []
    for i in book_row:
        for j in cate_row:
           if  i[5] == j[0]:
               cate_name = j[1]
        book = {
            '商品編號': i[0],
            '商品名稱': i[1],
            '商品售價': i[2],
            '商品類別': cate_name,
            '商品敘述': i[4],
            '類別編號': i[5],
            '商品品牌': i[6],
            '商品狀態': i[7],
            '商品級別': i[8],
            '上市年分': i[9],
            '庫存數量': i[10]
        }
        book_data.append(book)
    return book_data

@manager.route('/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        name = request.values.get('name')
        price = request.values.get('price')
        cid = request.values.get('cid')
        description = request.values.get('description')
        brand = request.values.get('brand')
        status = request.values.get('status')
        level = request.values.get('level')
        year = request.values.get('year')
        volume = request.values.get('volume')
        if request.values.get('cid') == 's00001':
            category = 'Shoulder bags'
        elif request.values.get('cid') == 'h00001':
            category = 'Hand bags'
        elif request.values.get('cid') == 't00001':
            category = 'Tote bags'
        
        all_products = book()
        existing_product = next((product for product in all_products if product['商品名稱'] == name), None)
        if existing_product:
            flash('Product already exists')
            return redirect(url_for('manager.productManager'))
        
        else:
            #商品不存在，生成pId並添加商品
            data = ""
            while(data != None):
                number = str(random.randrange( 10000, 99999))
                en = random.choice(string.ascii_letters)
                pid = en + number
                data = Product.get_product(pid)

            if (len(name) < 1 or len(price) < 1):
                return redirect(url_for('manager.productManager'))
            
            Product.add_product(
                {'pid' : pid,
                'pname' : name,
                'price1' : price,
                'cid1' : cid,
                'category' : category,
                'description': description,
                'brand1': brand,
                'status1': status,
                'level1': level,
                'year1': year,
                'volume1': volume
                }
            )
            flash('Successfully added')
            return redirect(url_for('manager.productManager'))

    return render_template('productManager.html')

@manager.route('/edit', methods=['GET', 'POST'])
@login_required
def edit():
    if request.method == 'GET':
        if(current_user.role == 'user'):
            flash('No permission')
            return redirect(url_for('bookstore'))

    if request.method == 'POST':
        if request.values.get('cid') == 's00001':
            category = 'Shoulder bags'
        elif request.values.get('cid') == 'h00001':
            category = 'Hand bags'
        elif request.values.get('cid') == 't00001':
            category = 'Tote bags'
        
        Product.update_product(
            {
            'pid' : request.values.get('pid'),
            'pname' : request.values.get('name'),
            'category':category,
            'cid1' : request.values.get('cid'), 
            'status1' : request.values.get('status'), 
            'level1' : request.values.get('level'),
            'year1' : request.values.get('year'), 
            'price1' : request.values.get('price'),
            'volume1' : request.values.get('volume'), 
            'description' : request.values.get('description')
            }
        )
        
        return redirect(url_for('manager.productManager'))

    else:
        product = show_info()
        return render_template('edit.html', data=product)


def show_info():
    pid = request.args['pid']
    data = Product.get_product(pid)
    pname = data[1]
    price = data[2]
    description = data[4]
    category = data[5]
    brand = data[6]
    status = data[7]
    level = data[8]
    year = data[9]
    volume = data[10]

    product = {
        '商品編號': pid,
        '商品名稱': pname,
        '商品單價': price,
        '類別編號': category,
        '商品敘述': description,
        '商品品牌':  brand,
        '商品狀態': status,
        '商品級別': level,
        '上市年分': year,
        '庫存數量': volume
    }
    return product


@manager.route('/orderManager', methods=['GET', 'POST'])
@login_required
def orderManager():
    if request.method == 'POST':
        if 'done' in request.values:
            tno = request.values.get('done')
            Order_List.update_order(tno)

            data = Order_List.get_orderamount(tno)
            for i in data:
                pid = i[0]
                amount = i[1]
                available = i[2]
                available += amount
                Product.update_available(pid, available)
            
    order_row = Order_List.get_order()
    orderdetail_row = Order_List.get_orderdetail()
    order_data = []
    order_detail = []
    for i in order_row:
        totalsum = 0
        for j in orderdetail_row:
            if i[0] == j[0]:
                orderdetail = {
                    '訂單編號': j[0],
                    '商品名稱': j[1],
                    '商品單價': j[2],
                    '訂購數量': j[3]
                }
                order_detail.append(orderdetail)
                totalsum += j[2]
        order = {
            '訂單編號': i[0],
            '訂購人': i[1],
            '訂單總價': totalsum,
            '訂單開始時間': i[2],
            '訂單結束時間': i[3],
            '訂單種類': i[4],
            '取貨方式': i[5],
            '訂單狀態': i[6]
        }
        order_data.append(order)
        
    # orderdetail_row = Order_List.get_orderdetail()
    # order_detail = []

    # for j in orderdetail_row:
    #     orderdetail = {
    #         '訂單編號': j[0],
    #         '商品名稱': j[1],
    #         '商品單價': j[2],
    #         '訂購數量': j[3]
    #     }
    #     order_detail.append(orderdetail)

    return render_template('orderManager.html', orderData = order_data, orderDetail = order_detail, user=current_user.name)