# Import the flask module
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    statement = 'Hello World!'
    return statement


# Calls the run method, runs the app on port 5000
app.run(host='0.0.0.0', port='5000')
