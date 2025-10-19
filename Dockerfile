from arm32v6/python:3.9-alpine

workdir /app

run apk add --no-cache \
  g++ \
  gcc \
  libffi-dev \
  musl-dev \
  python3-dev \
  tzdata

env TZ=Europe/Amsterdam

copy requirements.txt .

env SKLEARN_NO_OPENMP=1
env SETUPTOOLS_USE_DISTUTILS=stdlib
run python -m pip install --upgrade pip
run python -m pip install --no-cache-dir -r requirements.txt

copy app.py .
copy templates/ ./templates/
copy static/ ./static/
copy samsim.py .

cmd ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
