FROM debian:stretch

RUN apt-get update && apt-get install -y python2.7 python-virtualenv
RUN echo "deb-src http://ftp.us.debian.org/debian/ stretch main" >> /etc/apt/sources.list
RUN apt-get update && apt-get build-dep -y python-cryptography python-cffi python-werkzeug

ADD . /opt/alexgaynor.net/tls-cal/
WORKDIR /opt/alexgaynor.net/tls-cal/

RUN virtualenv virt
RUN virt/bin/pip install -r requirements.txt

ONBUILD ADD config.yml /opt/alexgaynor.net/tls-cal/config.yml

ENTRYPOINT ["virt/bin/python", "tlscal.py", "/opt/alexgaynor.net/tls-cal/config.yml"]
