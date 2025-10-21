import os
import sys

project_path = os.path.dirname(os.path.abspath(__file__))
if project_path not in sys.path:
    sys.path.insert(0, project_path)

os.environ['FLASK_ENV'] = 'development'
os.environ['SECRET_KEY'] = 'top-secret'
os.environ['DATA_URL'] = f'sqlite:///{project_path}/instance/samsim.db'

from app import app

if __name__ == '__main__':
  app.run(debug=True)
