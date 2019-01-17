I'm testing this using an insecure docker registry running on my local machine. 

To run the local registry:
docker run -d -p 5000:5000 --name registry-srv registry:2
docker run -it -p 8080:8080 --name registry-web --link registry-srv -e REGISTRY_URL=http://registry-srv:5000/v2 -e REGISTRY_NAME=localhost:5000 hyper/docker-registry-web 

kaniko can't push to 'localhost:5000' so we need to substitute the host's IP address into ./config.json and the command below, which uses kaniko to build and push it:

docker run -v $PWD:/workspace -v $PWD/config.json:/kaniko/config.json --env DOCKER_CONFIG=/kaniko gcr.io/kaniko-project/executor:latest -d 9.140.99.106:5000/mnuttall/simple --insecure

One can then 

docker run localhost:5000/mnuttall/simple test

which amazingly enough says, 

Hi today we are /simple.sh and say test

Obviously it's easier to use `docker build` but we're trying to wean ourselves off that in this example. 

Note that the password in 'config.json' is just to keep kaniko happy; it's not a real password. 
