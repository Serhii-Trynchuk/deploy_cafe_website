# deploy_cafe_website
1) Make directory and "cd" in it.
Make Dockerfile. Use Dockerfile from repository.

2) Build Image
docker build -t cafeimg .

3) Run container from our Image
docker run -d -P cafeimg

4) Go to browser enter IP:HostPort
