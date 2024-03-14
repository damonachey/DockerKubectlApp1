REM Build the container
docker build --tag app1:latest .

REM Open the browser
start "" "http://localhost:5000"

REM Run the container
REM * The call; command is used so CTRL+C can be used to stop the container but the script will continue
kubectl run -i --rm app1container --image=app1:latest --port=5000 --image-pull-policy=Never & call;

kubectl delete deployment app1container