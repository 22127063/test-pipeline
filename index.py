from flask import Flask

app = Flask(__name__)

@app.route('/contact')
def contact():
    return "Hello node"

if __name__ == '__main__':
    app.run(port=3000, debug=True)
