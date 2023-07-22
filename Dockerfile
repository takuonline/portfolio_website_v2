FROM python:3.7.17-slim-buster

WORKDIR /app

COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt  --no-cache-dir
RUN python3 -m nltk.downloader stopwords

# ENV PORT=5000
# EXPOSE 5000

COPY . .

# Run the image as a non-root user
RUN adduser --disabled-password taku
USER taku

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
CMD gunicorn --bind 0.0.0.0:$PORT wsgi:app
