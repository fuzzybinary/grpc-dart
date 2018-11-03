# Description
The grpc-web example shows how to use the Dart gRPC library with a gRPC-Web capable server. 

This is meant to be used with the echo example provided by the grpc-web repository. The definition of the service is given in echo.proto. 

# Prerequistes
You will need a clone of the [grpc-web](https://github.com/grpc/grpc-web) repository to run the example server.

You will also need the dart 'webdev' tool, which you can get by running:

```sh
$ pub global activate webdev
```

# Run the sample code
To run this example you'll need a running GRPC server which implements the echo service. There's a basic implementation
available in `lib/src/server.dart`. To run this server including an envoy proxy to properly support grpc web:

```sh
$ docker-compose up -d
```

This will launch a envoy server on http://localhost:8080 which will proxy to a dart service container. 

To compile and run the example, assuming you are in the root of the grpc-web
folder, i.e., .../example/grpc-web/, first get the dependencies by running:

```sh
$ pub get
```

Compile and run the website with:

```sh
$ webdev serve web:9000
```

Note that the alternate port (9000) is necessary because the grpc-web server runs the grpc server on port 8080 by default (the save as webdev).

You can then navigate to http://localhost:9000/ to try out the example.

# Regenerate the stubs

If you have made changes to the message or service definition in
`protos/helloworld.proto` and need to regenerate the corresponding Dart files,
you will need to have protoc version 3.0.0 or higher and the Dart protoc plugin
version 0.7.9 or higher on your PATH.

To install protoc, see the instructions on
[the Protocol Buffers website](https://developers.google.com/protocol-buffers/).

The easiest way to get the Dart protoc plugin is by running

```sh
$ pub global activate protoc_plugin
```

and follow the directions to add `~/.pub-cache/bin` to your PATH, if you haven't
already done so.

You can now regenerate the Dart files by running

```sh
$ protoc --dart_out=grpc:lib/src/generated -Iprotos protos/helloworld.proto
```
