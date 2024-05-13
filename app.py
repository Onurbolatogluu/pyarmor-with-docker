from flask import Flask

app = Flask(__name__)
count = 0  # Sayaç başlangıç değeri

@app.route('/')
def hello_world():
    global count
    count += 1  # Her istekte sayaç artırılır
    return f'Hello World {count}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
