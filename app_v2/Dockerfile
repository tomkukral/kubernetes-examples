FROM python:3
label maintainer you

WORKDIR /code

ADD requirements.txt .
RUN pip install -r requirements.txt

CMD python app.py

ADD . .
