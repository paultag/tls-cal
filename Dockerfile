FROM python:2

ADD . /opt/alexgaynor.net/tls-cal/
WORKDIR /opt/alexgaynor.net/tls-cal/

RUN virtualenv virt
RUN virt/bin/pip install -r requirements.txt

ONBUILD ADD config.yml /opt/alexgaynor.net/tls-cal/config.yml

ENTRYPOINT ["virt/bin/python", "tlscal.py", "/opt/alexgaynor.net/tls-cal/config.yml"]
