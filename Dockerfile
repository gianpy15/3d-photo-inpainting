FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

RUN pip install --upgrade cython
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN pip install torchvision==0.5.0 cudatoolkit==10.1

WORKDIR /models
RUN chmod +x download.sh && ./download.sh

WORKDIR /workspace
