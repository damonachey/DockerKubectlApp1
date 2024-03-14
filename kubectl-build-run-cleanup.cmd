REM Build the container
docker build --tag app1:latest .
if %errorlevel% neq 0 exit /b %errorlevel%

REM Open the browser
start "" "http://localhost:5000"

REM Run the container
REM * The call; command is used so CTRL+C can be used to stop the container but the script will continue
kubectl run app1container --image=app1:latest --port=5000 --expose=true --image-pull-policy=Never
if %errorlevel% neq 1 exit /b %errorlevel%

REM Wait for the container to be ready
kubectl wait --for=condition=ready pod/app1container --timeout=30s
if %errorlevel% neq 0 exit /b %errorlevel%

REM Port forward
kubectl port-forward app1container 5000:5000 & call;

REM Cleanup
kubectl delete pods app1container