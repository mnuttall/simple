# Simple

A simple test application for use with Tekton. See https://github.com/tektoncd/experimental/tree/master/webhooks-extension/test. See `setup_webhook_simple_test.sh` in that directory, and its use of 

```
## Install pipelines. This first test uses our simplest pipeline: docker build/tag/push, kubectl apply -f config 
git clone https://github.com/pipeline-hotel/example-pipelines.git
kubectl apply -f example-pipelines/config/build-task.yaml
kubectl apply -f example-pipelines/config/deploy-task.yaml
kubectl apply -f example-pipelines/config/pipeline.yaml
```