REM Build the container
docker build --tag app1:latest .

REM Open the browser
start "" "http://localhost:5000"

REM Run the container
kubectl run -i --rm app1container --image=app1:latest --port=5000 --image-pull-policy=Never

kubectl delete deployment app1container