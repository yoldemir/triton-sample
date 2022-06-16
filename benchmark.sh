docker pull nvcr.io/nvidia/tritonserver:22.05-py3-sdk
docker run --name triton-client -it -d --rm --net=host nvcr.io/nvidia/tritonserver:22.05-py3-sdk

# The following command assumes the server is running on the same machine. If not, adjust the IP address accordingly.
# Change the model name (bert-base below) to the name of the model to be benchmarked.
docker exec -it triton-client perf_analyzer -m bert-base -b 1 --input-data "zero" -u localhost:8001 -i gRPC
