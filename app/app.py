import os
import random

from flask import Flask, render_template
from redis import Redis

app = Flask(__name__)
redis_host = os.environ.get('REDIS_MASTER_SERVICE_HOST', 'redis')
question_file = os.environ.get('QUESTION_FILE', '/var/flask/question.txt')

redis = Redis(host=redis_host, port=6379)


@app.route('/')
def index():
    redis.incr('hits')
    hits = redis.get('hits').decode('utf8')
    envs = os.environ
    question = None

    if os.path.isfile(question_file):
        question = random.choice(open(question_file, 'r').read().split('\n')[:-1])

    return render_template(
        'index.html',
        hits=hits,
        redis_host=redis_host,
        envs=envs,
        question=question
    )


@app.route('/old')
def hello_old():
    redis.incr('hits')

    page = "<pre>"

    if os.path.isfile(question_file):
        page += "Question: {}\n".format(random.choice(open(question_file, 'r').read().split('\n')[:-1]))

    page += "Flask app with Redis running in Kubernetes cluster\n"
    page += "Hello World! I have been seen {} times.\n".format(redis.get('hits').decode('utf8'))
    page += "Redis host is {}\n".format(redis_host)
    page += "Env variables:\n"

    for k, v in os.environ.items():
        page += "  " + k + ": " + v + "\n"

    page += "</pre>"

    return page


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
