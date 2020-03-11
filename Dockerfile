FROM nvcr.io/nvidia/pytorch:19.04-py3

RUN apt-get -y update &&\
    apt-get install -y python3-pip wget ffmpeg &&\
    \
    mkdir -p /root/.torch/models &&\
    mkdir -p /data/models

RUN wget -O /root/.torch/models/vgg16_bn-6c64b313.pth https://download.pytorch.org/models/vgg16_bn-6c64b313.pth &&\
RUN wget -O /root/.torch/models/resnet34-333f7ec4.pth https://download.pytorch.org/models/resnet34-333f7ec4.pth &&\
RUN wget -O /data/models/ColorizeArtistic_gen.pth https://www.dropbox.com/s/zkehq1uwahhbc2o/ColorizeArtistic_gen.pth?dl=0 &&\
RUN wget -O /data/models/ColorizeStable_gen.pth https://www.dropbox.com/s/mwjep3vyqk5mkjc/ColorizeStable_gen.pth?dl=0 &&\

ADD . /data/

WORKDIR /data

RUN pip install -r requirements.txt

CMD ["colorize.py"]
