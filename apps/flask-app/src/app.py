from flask import Flask, request, make_response
from prometheus_flask_exporter import PrometheusMetrics
from prometheus_client import Counter, Histogram, generate_latest

FLASK_REQUEST_LATENCY = Histogram('flask_request_latency_seconds', 'Flask Request Latency',
				['method', 'endpoint'])
FLASK_REQUEST_COUNT = Counter('flask_request_count', 'Flask Request Count',
				['method', 'endpoint', 'http_status'])

app = Flask(__name__)
metrics = PrometheusMetrics(app)

# static information as metric
metrics.info('app_info', 'Application info', version='1.0.3')

metrics.register_default(
    metrics.counter(
        'by_path_counter', 'Request count by request paths',
        labels={'path': lambda: request.path}
    )
)

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World!", 200

@app.route("/about") 
def about():
    return "About page", 200

@app.route("/contact")
def contact():
    return "Contact page", 200

@app.route("/error")
def error():
    return "Error", 400

@app.route('/metrics')
def metrics():
    return make_response(generate_latest())

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=3000)