FROM python:2.7

RUN apt update
RUN apt install -y python python-pip

RUN adduser -M -s /bin/false -u 1001

RUN mkdir -p /opt/codingracing
WORKDIR /opt/codingracing

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

RUN chown -R 1001:1001 /opt/codingracing && \
    chmod +x /opt/codingracing/docker-entrypoint.sh

USER 1001
EXPOSE 8000
ENTRYPOINT ["/opt/codingracing/docker-entrypoint.sh"]
