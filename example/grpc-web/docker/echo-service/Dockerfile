FROM google/dart

WORKDIR /app/example/grpc-web/

ADD pubspec.* /app/
ADD example/grpc-web/pubspec.* /app/example/grpc-web/

RUN pub get --no-precompile
ADD . /app
RUN pub get --offline --no-precompile

EXPOSE 9090

ENTRYPOINT ["/usr/bin/dart", "bin/server.dart"]