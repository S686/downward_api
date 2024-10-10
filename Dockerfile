FROM python:3.8-alpine

# set the working directory in the container to /app
WORKDIR /app

# add the current directory to the container as /app
ADD . /app

# Install curl and any required Python packages
RUN apk add --no-cache curl && \
    pip install --no-cache-dir -r requirements.txt

# Set the timezone to Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && echo Asia/Seoul > /etc/timezone

# unblock port 40003 for the Flask app to run on
EXPOSE 40003

# execute the Flask app
CMD ["python", "app.py"]
