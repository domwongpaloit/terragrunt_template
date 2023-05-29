# !/bin/sh

VERSION=$1

docker build --platform=linux/arm64 -t dominwong4/flask-app:$VERSION .
docker push dominwong4/flask-app:$VERSION