REM Build the container
docker build --tag docker-kubectl-app1:latest .

REM Open the browser
start "" "http://localhost:5000"

REM Run the container
REM * The call; command is used so CTRL+C can be used to stop the container but the script will continue
docker run --rm -p 5000:5000 --name docker-kubectl-app1-container docker-kubectl-app1:latest & call;