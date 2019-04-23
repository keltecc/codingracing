FROM python:2.7

RUN apt update
RUN apt install -y python python-pip

RUN useradd -M -s /bin/false -u 1001 codingracing

RUN mkdir -p /opt/codingracing
WORKDIR /opt/codingracing

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

RUN mkdir fonts && \
    cp /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf fonts/DejaVuSansMono.ttf

RUN chown -R 1001:1001 /opt/codingracing && \
    chmod +x /opt/codingracing/docker-entrypoint.sh

USER 1001
EXPOSE 8000
ENTRYPOINT ["/opt/codingracing/docker-entrypoint.sh"]
