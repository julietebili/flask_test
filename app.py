# Import the Flask class from the flask module
from flask import Flask

# Create a new instance of the Flask class
app = Flask(__name__)

# Define a route for the default URL ("/")
@app.route('/')
def hello_world():
    # Return the string "Hello, World!" when the route is accessed
    return 'Hello, World!'

@app.route('/custom')
def custom():
    # Return the string "Hello, World!" when the route is accessed
    return 'Hello, Custom!'

# Check if the script is executed directly (not imported)
if __name__ == "__main__":
    # Run the Flask app
    app.run(host="0.0.0.0", port=5000, debug=True, threaded=True)
