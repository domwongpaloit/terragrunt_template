# !/bin/sh

VERSION=$1

docker buildx build --platform=linux/arm64 -t dominwong4/express-app:$VERSION .
docker push dominwong4/express-app:$VERSION