# original: https://github.com/janza/docker-python3-opencv   
FROM jjanzic/docker-python3-opencv:contrib-opencv-3.4.2
MAINTAINER KTaskn <korai.kinjo@gmail.com>

ENV LD_LIBRARY_PATH=/usr/local/lib
  
COPY . /workspaces

WORKDIR /workspaces

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ffmpeg

RUN python setup.py install

RUN python -m pip install -U pip \
    && python -m pip install scikit-video jupyter matplotlib sklearn pandas

CMD ["jupyter", "notebook", "--allow-root", "--port", "8888", "--ip", "0.0.0.0"]
# docker run --rm -ti --gpus all -p 8888:8888 -v /home/kinjo/datasets:/datasets -v $PWD:/workspaces --name densetrack ktaskn/densetrack