# original: https://github.com/janza/docker-python3-opencv
FROM jjanzic/docker-python3-opencv:contrib-opencv-3.4.2
MAINTAINER KTaskn <korai.kinjo@gmail.com>

ENV LD_LIBRARY_PATH=/usr/local/lib
  
COPY . /workspace

WORKDIR /workspace

RUN python setup.py install

RUN python -m pip install -U pip \
    && python -m pip install scikit-video matplotlib scikit-learn pandas tqdm torchvision nptyping \
    && python -m pip install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
    
# docker run --rm -ti --gpus all -p 8888:8888 -v /home/kinjo/datasets:/datasets -v $PWD:/workspaces --name densetrack ktaskn/densetrack