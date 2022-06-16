docker pull nvcr.io/nvidia/pytorch:22.05-py3
docker run --name torch-env --rm -it -d --gpus all -v $(pwd):/workspace nvcr.io/nvidia/pytorch:22.05-py3
docker exec -it torch-env pip install transformers onnxruntime
docker exec -it torch-env python -m transformers.onnx --model=bert-base-uncased /workspace/models/bert-base/1
docker exec -it torch-env python -m transformers.onnx --model=bert-large-uncased /workspace/models/bert-large/1
docker exec -it torch-env python -m transformers.onnx --model=albert-base-v1 /workspace/models/albert-base/1
docker exec -it torch-env wget -P /workspace/models/bert-base/ https://raw.githubusercontent.com/yoldemir/triton-sample/main/config-files/bert-base-uncased/onnx-gpu/config.pbtxt
docker exec -it torch-env wget -P /workspace/models/bert-large/ https://raw.githubusercontent.com/yoldemir/triton-sample/main/config-files/bert-large-uncased/onnx-gpu/config.pbtxt
docker exec -it torch-env wget -P /workspace/models/albert-base/ https://raw.githubusercontent.com/yoldemir/triton-sample/main/config-files/albert-base-v1/onnx-gpu/config.pbtxt
docker pull nvcr.io/nvidia/tritonserver:22.05-py3
docker run --gpus all --rm -it -p8000:8000 -p8001:8001 -p8002:8002 -v $(pwd)/models:/models nvcr.io/nvidia/tritonserver:22.05-py3 tritonserver --model-repository=/models
