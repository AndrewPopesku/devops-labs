from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to the Flask API!"})

@app.route('/api/echo', methods=['POST'])
def echo():
    data = request.get_json()
    return jsonify({"received_data": data})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)