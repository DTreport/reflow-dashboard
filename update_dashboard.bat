@echo off

echo Starting Dashboard...

start "" cmd /c "python app.py"

timeout /t 8

echo Refreshing data...

curl http://127.0.0.1:5000/refresh

timeout /t 3

echo Uploading to GitHub...

git add .
git commit -m "update data"
git pull origin main --rebase
git push

echo.
echo ===== COMPLETE =====
pause