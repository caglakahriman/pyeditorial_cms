FROM python:3.9


WORKDIR /app
COPY . /app/

RUN pip install -r /app/requirements.txt
RUN chmod +x /app/init.sh

ENTRYPOINT ["/app/init.sh"]
