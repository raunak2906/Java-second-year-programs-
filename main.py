from flask import Flask,render_template,request,redirect,session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql.expression import func
from flask_mail import Mail, Message
import random
import qrcode
from datetime import datetime
app=Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:@localhost/orma"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
class product(db.Model):
    sno = db.Column(db.Integer(), nullable=False, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    price= db.Column(db.Integer(), nullable=False)
    detail= db.Column(db.String(100), nullable=False)
class order_detail(db.Model):
    sno = db.Column(db.Integer(), nullable=False, primary_key=True)
    order_id= db.Column(db.String(100), nullable=False)
    product = db.Column(db.Integer(), nullable=False)
    customer_name= db.Column(db.String(100), nullable=False)
    customer_address= db.Column(db.String(100), nullable=False)
    customer_mobile= db.Column(db.String(100), nullable=False)
    tid= db.Column(db.String(100), nullable=False)
    amt= db.Column(db.Integer(), nullable=False)
    session_id= db.Column(db.String(100), nullable=False)
    date= db.Column(db.String(100), nullable=False)
@app.route("/")
def main():
    return redirect("/index")


@app.route("/index")
def index():    
    products = product.query.order_by(func.random()).limit(4).all()
    return render_template("index.html",pd=products)
    
@app.route("/login", methods=["GET", "POST"])
def login():
    return render_template("login.html")
    
@app.route("/login_email", methods=["POST"])
def login_email():
    if request.method == "POST":
        data = request.get_json()
        session['user']=data["email"]
    return "done"
@app.route("/logout")
def logout():
    if ('user' in session):
        session.pop("user")
    return redirect("/")
@app.route("/contact")
def contact():
	return render_template("contact.html")
@app.route("/about")
def about():
	return render_template("about.html")
@app.route("/shop")
def shop():
    products=product.query.all()
    return render_template("shop.html",pd=products)
@app.route("/single_item/<string:sno>")
def single_item(sno):
    products = product.query.filter_by(sno=sno).first()
    return render_template("single_itme.html",pd=products)
    
@app.route("/billing/<string:sno>")
def billing(sno):
    if ('user' in session):
        products = product.query.filter_by(sno=sno).first()
        return render_template("billing.html",pd=products)
    return redirect("/login")
@app.route("/payment/<string:sno>",methods=["POST"])
def payment(sno):  
    if ('user' in session):
        if request.method == "POST":
            name = request.form["name"]
            address = request.form["address"]
            mobile = request.form["mobile"]
            products = product.query.filter_by(sno=sno).first()
            order_id=random.randint(10**11, 10**12 - 1)
            new_order = order_detail(
            order_id = order_id,
            product = sno,
            customer_name = name,
            customer_address = address,
            customer_mobile = mobile,
            session_id=session["user"],
            tid=0,
            amt=products.price,
            date=datetime.now()
            )
            db.session.add(new_order)
            db.session.commit() 
            return redirect(f"/make_payment/{order_id}")
            return render_template("payment.html",order_id=order_id) 
    return redirect("/")
@app.route("/make_payment/<string:sno>")
def make_payment(sno):  
    if ('user' in session):
        products = order_detail.query.filter_by(order_id=sno).first()
        return render_template("payment.html",o_id=products) 
    return redirect("/")
@app.route("/payment_done/<string:sno>",methods=["POST"])
def payment_done(sno):  
    if ('user' in session):
        if request.method == "POST":
            utr = request.form["utr"]
            products = order_detail.query.filter_by(order_id=sno).first()
            if products and utr!="0":
                products.tid = utr
                db.session.commit()
                return render_template("done.html") 
                
@app.route("/cart",methods=["POST","GET"])
def cart():
    cart_item=[]
    cart = request.cookies.get('cart')
    if cart:
        cart_item=cart.split(",")
    products=product.query.all()
    
    return render_template("cart.html",ct=cart_item,pd=products)
        
    return redirect("/")    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80,debug=True)