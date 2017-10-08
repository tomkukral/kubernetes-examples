FROM python:3
LABEL maintainer Tomas Kukral

WORKDIR /code

ADD requirements.txt .
RUN pip install -r requirements.txt

CMD python app.py

ADD . .
