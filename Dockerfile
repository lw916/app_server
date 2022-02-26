# Use latest stable channel SDK.
FROM dart:2.14.4

RUN apt-get update

# Resolve app dependencies.
WORKDIR /app
COPY . .
VOLUME ["/app"]
RUN dart pub get
RUN cd /app
EXPOSE 8080
CMD ["bash","/app/bin/boot.sh"]
