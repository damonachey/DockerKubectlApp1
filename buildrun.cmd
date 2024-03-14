docker build --tag app1:latest .

start "" "http://localhost:5000"
docker run -p 5000:5000 --name app1container app1
docker rm app1container
docker rmi app1:latest
