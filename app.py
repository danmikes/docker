import os
from flask import Flask, render_template, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def index():
  links = [
    {"name": "GitHub", "url": "https://github.com/danmikes"},
    {"name": "LinkIn", "url": "https://linkedin.com/in/dmikes"},
    {"name": "ResearchGate", "url": "https://www.researchgate.net/profile/Daniel-Mikes"},
    {"name": "React", "url": "https://danmikes.github.io/react"},
    {"name": "Svelte", "url": "https://danmikes.github.io/svelte"},
    {"name": "SamSim", "url": "https://dmikes.duckdns.org/app"},
  ]

  return render_template('index.htm', links=links, build=datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

@app.route('/health')
def health_check():
  return jsonify({'status': 'healthy'}), 200

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5000)
