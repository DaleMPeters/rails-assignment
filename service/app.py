#!/usr/bin/env/python

from flask import Flask, jsonify, request

app = Flask(__name__)

# A list of dictionaries representing wines to serve to MAF
wines = [
    {
        'id': 1,
        'short_description': u'Some Great wine',
        'long_description': u'Description of some great wine',
        'bottle_size': u'medium',
        'price': 6.99,
        'origin_country': u'Germany',
        'company': u'Bargain Wines',
        'grape_type': u'Chardonnay',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'091234',
    },
    {
        'id': 2,
        'short_description': u'Some wine',
        'long_description': u'Description of some wine',
        'bottle_size': u'large',
        'price': 5.99,
        'origin_country': u'Germany',
        'company': u'Bargain Wines',
        'grape_type': u'Chardonnay',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'091235',
    },
    {
        'id': 3,
        'short_description': u'A Nice Wine',
        'long_description': u'This is made from French grapes',
        'bottle_size': u'small',
        'price': 6.99,
        'origin_country': u'Germany',
        'company': u'Bargain Wines',
        'grape_type': u'Red',
        'is_vegetarian': False,
        'image_url': u'wine.jpg',
        'barcode': u'091245',
    },
    {
        'id': 4,
        'short_description': u'Zebra Wine',
        'long_description': u'South African Non-Alcoholic Wine',
        'bottle_size': u'Medium',
        'price': 5.99,
        'origin_country': u'South Africa',
        'company': u'Bargain Wines',
        'grape_type': u'White',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'093435',
    },
    {
        'id': 5,
        'short_description': u'Water Wine',
        'long_description': u'A very nice wine, 50% water',
        'bottle_size': u'Medium',
        'price': 10.99,
        'origin_country': u'Polane',
        'company': u'Bargain Wines',
        'grape_type': u'Merlot',
        'is_vegetarian': False,
        'image_url': u'wine.jpg',
        'barcode': u'091256',
    },
    {
        'id': 6,
        'short_description': u'My home-made wine',
        'long_description': u'Made in the home of the owner of Bargain Wines',
        'bottle_size': u'Small',
        'price': 9.99,
        'origin_country': u'UK',
        'company': u'Bargain Wines',
        'grape_type': u'White',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'091200',
    },
    {
        'id': 7,
        'short_description': u'A Lovely Greek Wine',
        'long_description': u'Lovely and from Greece. Sweet.',
        'bottle_size': u'Small',
        'price': 1.99,
        'origin_country': u'Greece',
        'company': u'Bargain Wines',
        'grape_type': u'Chardonnay',
        'is_vegetarian': False,
        'image_url': u'wine.jpg',
        'barcode': u'06135',
    },
    {
        'id': 8,
        'short_description': u'An Italian Wine',
        'long_description': u'Wine made in Nago Torbole',
        'bottle_size': u'Medium',
        'price': 9.99,
        'origin_country': u'Italy',
        'company': u'Bargain Wines',
        'grape_type': u'Rose',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'093333',
    },
    {
        'id': 9,
        'short_description': u'Spanish Crianza',
        'long_description': u'Wine from Spain',
        'bottle_size': u'Large',
        'price': 5.99,
        'origin_country': u'Spain',
        'company': u'Bargain Wines',
        'grape_type': u'Chardonnay',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'091333',
    },
    {
        'id': 10,
        'short_description': u'Some Very Nice Wine',
        'long_description': u'A description of some very nice wine',
        'bottle_size': u'small',
        'price': 89.99,
        'origin_country': u'Switzerland',
        'company': u'Bargain Wines',
        'grape_type': u'Rose',
        'is_vegetarian': True,
        'image_url': u'wine.jpg',
        'barcode': u'0914545',
    },
    {
        'id': 11,
        'short_description': u'Yellow Vine Wine',
        'long_description': u'A nice Red Wine, made by Yellow Wines',
        'bottle_size': u'medium',
        'price': 19.99,
        'origin_country': u'Australia',
        'company': u'Bargain Wines',
        'grape_type': u'Rose',
        'is_vegetarian': False,
        'image_url': u'wine.jpg',
        'barcode': u'0145',
    },
]


# Initialise the list to save the orders to
orders = []


# Define a route for receiving orders from MAF as <application root>/orders/
# and specify that this is what happens when a POST request is made to
# the given route
@app.route('/orders/', methods=['POST'])
def create_order():
    # Get all of the items from the POST request made to this server
    # and save them in a dictionary
    order = {
        'customer_name': request.json['customer_name'],
        'customer_address': request.json['customer_address'],
        'customer_email': request.json['customer_email'],
        'wine_barcode': request.json['wine_barcode'],
        'quantity': request.json['quantity'],
    }
    # Append the order we have received to the list of orders
    # that is stored in memory
    orders.append(order)
    # Return the order back with a status code of 201
    return jsonify({'order': order}), 201


# Define a route for giving information on the orders. Whenever a GET
# request is made to <application root>/orders/, a list of the orders is
# provided.
@app.route('/orders/', methods=['GET'])
def list_orders():
    # Converts the list of order dictionaries to JSON and returns it
    # and gives a HTTP status code of 201
    return jsonify({'orders': orders}), 201


# Define a route for giving information on the wines. Whenever a GET request is
# made to <application root>/wines/, a list of the wines is provided.
@app.route('/wines/', methods=['GET'])
def list_wines():
    # Converts the list of dictionaries representing wines into a JSON object
    # and returns it. Also gives HTTP status code of 201
    return jsonify({'wines': wines}), 201


if __name__ == '__main__':
    app.run(debug=True)
