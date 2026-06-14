from flask import Flask, render_template
import psutil
import datetime

app = Flask(__name__)

@app.route('/')
def home():
    cpu = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory()
    disk = psutil.disk_usage('/')
    uptime_seconds = datetime.datetime.now().timestamp() - psutil.boot_time()
    uptime = str(datetime.timedelta(seconds=int(uptime_seconds)))

    stats = {
        'cpu': cpu,
        'memory_used': round(memory.used / (1024**3), 1),
        'memory_total': round(memory.total / (1024**3), 1),
        'memory_percent': memory.percent,
        'disk_used': round(disk.used / (1024**3), 1),
        'disk_total': round(disk.total / (1024**3), 1),
        'disk_percent': disk.percent,
        'uptime': uptime,
        'time': datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    return render_template('index.html', stats=stats)

@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
