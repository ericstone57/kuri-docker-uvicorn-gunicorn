FROM bitnami/python:3.8-prod

LABEL maintainer="Eric Lee <ericstone.dev@gmail.com>"

RUN pip install --no-cache-dir "uvicorn[standard]" gunicorn

COPY ./scripts/start.sh /start.sh
RUN chmod +x /start.sh

COPY ./scripts/gunicorn_conf.py /gunicorn_conf.py

COPY ./scripts/start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 8000

CMD ["/start.sh"]