This repository is a companion to the blog post titled "XYZ". 

As long as you have Docker installed, running `start_server.sh` should download three pretrained AI models mentioned in the blog post (BERT Base, BERT Large, ALBERT Base), convert them to ONNX, and start a Triton inference server serving them. Once the server is started, `benchmark.sh` can be used to benchmark a model to assess its inference performance characteristic. When used as-is, these scripts assume the models are in ONNX format and served on GPU using the default execution provider. Configuration files for all configurations in the blog post can be found in the `config-files` directory. This folder includes the configuration files for these formats:
- ONNX model served on CPU
- ONNX model served on CPU with OpenVINO EP
- ONNX model served on GPU
- ONNX model served on GPU with TensorRT EP
- TensorRT model served on GPU

Note that the folder names (bert-base-uncased, bert-large-uncased, albert-base-v1) for the configuration files correspond to the names of the HuggingFace models used.
