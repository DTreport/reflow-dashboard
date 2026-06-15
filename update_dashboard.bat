@echo off

cd /d "C:\Users\SMK\OneDrive - GPV Group\Desktop\ReflowDashboard"

start "Flask" cmd /c "python app.py"

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
