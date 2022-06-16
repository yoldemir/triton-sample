This repository contains examples of serving pretrained HuggingFace models using NVIDIA Triton Inference Server. As long as you have Docker installed, simply run `sh start_server.sh` to:
- Pull the PyTorch Docker container from NVIDIA GPU Cloud (NGC)
- Pull the Triton Docker container from NGC
- Download sample pretrained models (ALBERT Base, BERT Base, BERT Large) from HuggingFace and convert them to ONNX format
- Download the configuration files for these models to be served via Triton
- Spin up a Triton server instance and start serving the said models

Once the server is started, you can run `sh benchmark.sh` to benchmark the latency and throughput of the models that are being served. 

The `config-files` folder includes 5 configurations for each model:
- ONNX model served on CPU
- ONNX model served on CPU with OpenVINO execution provider
- ONNX model served on GPU
- ONNX model served on GPU with TensorRT execution provider
- TensorRT model served on GPU

Below are the benchmarking results using an NVIDIA V100 GPU:

<img src="https://github.com/yoldemir/triton-sample/raw/main/latency.JPG" width="600" />
<img src="https://github.com/yoldemir/triton-sample/raw/main/throughput.JPG" width="600" />

The results indicate that model inference on GPU is vastly superior to CPU in terms of both latency and throughput. We also see that ONNX execution providers such as OpenVINO and TensorRT  have significant performance benefits.
