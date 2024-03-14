REM Build the container
docker build --tag docker-kubectl-app1:latest .
if %errorlevel% neq 0 exit /b %errorlevel%

REM Open the browser
start "" "http://localhost:5000"

REM Run the container
REM * The call; command is used so CTRL+C can be used to stop the container but the script will continue
kubectl run docker-kubectl-app1-container --image=docker-kubectl-app1:latest --port=5000 --expose=true --image-pull-policy=Never
if %errorlevel% gtr 1 exit /b %errorlevel%

REM Wait for the container to be ready
kubectl wait --for=condition=ready pod/docker-kubectl-app1-container --timeout=30s
if %errorlevel% neq 0 exit /b %errorlevel%

REM Port forward
kubectl port-forward docker-kubectl-app1-container 5000:5000 & call;

REM Cleanup
kubectl delete pods docker-kubectl-app1-container