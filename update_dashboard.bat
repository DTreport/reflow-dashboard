@echo off

echo Starting Dashboard...

start "Flask" cmd /k "cd /d %~dp0 && python app.py"

timeout /t 10

echo Refreshing data...

curl http://127.0.0.1:5000/refresh

timeout /t 3

echo Uploading to GitHub...

git add .
git commit -m "update data"
git pull origin main --rebase
git push

pause