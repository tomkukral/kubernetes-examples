from flask import Flask
from redis import Redis

import os


app = Flask(__name__)
redis_host = os.environ.get('REDIS_MASTER_SERVICE_HOST', 'redis')

redis = Redis(host=redis_host, port=6379)

@app.route('/')
def hello():
    redis.incr('hits')

    page = "<pre>"
    page += "Hello World! I have been seen {} times.\n".format(redis.get('hits'))
    page += "Redis host is {}\n".format(redis_host)
    page += "Env variables:\n"

    for k, v in os.environ.items():
        page += "  " + k + ": " + v + "\n"

    page += "</pre>"

    return page

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)

