from arm32v6/python:3.9-alpine
workdir /app

run apk add --no-cache \
    python3-dev \
    tzdata

copy requirements.txt .

env TZ=Europe/Amsterdam
run python -m pip install --upgrade pip
run python -m pip install --no-cache-dir --extra-index-url https://piwheels.org/simple numpy==1.24.4
run python -m pip install --no-cache-dir --extra-index-url https://piwheels.org/simple scipy==1.10.1
run python -m pip install --no-cache-dir flask==2.3.3 waitress==2.1.2 ipython==8.15.0
run python -m pip install --no-cache-dir --extra-index-url https://piwheels.org/simple matplotlib==3.7.4
run python -m pip install --no-cache-dir --extra-index-url https://piwheels.org/simple pillow==10.0.1
# run python -m pip install --no-cache-dir \
#     --extra-index-url https://piwheels.org/simple \
#     -r requirements.txt

copy app.py .
copy templates/ ./templates/
copy static/ ./static/
copy samsim.py .

cmd ["gunicorn", "--bind", "--host=0.0.0.0", "--port=5000", "--workers=1", "--threads=4", "app:app"]
# cmd ["waitress-serve", "--host=0.0.0.0", "--port=5000", "--threads=4", "app:app"]
