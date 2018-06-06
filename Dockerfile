FROM python:3.6.5-alpine3.7

COPY ["np.py", "requirements.txt", "/usr/src/"]

RUN set -xe  \
    && apk --no-cache --virtual .build-deps add gcc build-base \
    && pip install --no-cache-dir -r /usr/src/requirements.txt \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* 

CMD ["python", "/usr/src/np.py"]
