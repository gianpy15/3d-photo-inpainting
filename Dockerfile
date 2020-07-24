FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime

# Miniconda stuff
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget python-qt4 libsm6 libxext6 libxrender-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY . /workspace
RUN rm -r /workspace/image && rm -r /workspace/depth && rm -r /workspace/video
RUN chmod +x download.sh && ./download.sh

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    #&& mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
	&& conda create -n 3DP python=3.7 anaconda \
	&& /root/miniconda3/envs/3DP/bin/pip install -r /workspace/requirements.txt \
	&& conda install -n 3DP pytorch==1.4.0 torchvision==0.5.0 cudatoolkit==10.1.243 -c pytorch

ENTRYPOINT ["/root/miniconda3/envs/3DP/bin/python", "main.py", "--config", "argument.yml"]
