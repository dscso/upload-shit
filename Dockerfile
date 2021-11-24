FROM python:3.7-alpine

RUN adduser -D app

WORKDIR /app
#RUN apk update && apk --no-cache  add postgresql-dev gcc python3-dev musl-dev zlib-dev jpeg-dev build-base

RUN pip install gunicorn==20.1.0

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


COPY . ./

RUN chown -R app:app ./
RUN chmod +x ./run.sh


EXPOSE 5000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]


CMD [ "./run.sh" ]