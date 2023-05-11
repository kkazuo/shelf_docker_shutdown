FROM dart:stable AS build
LABEL stage=build
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline &&\
        dart pub add shelf &&\
        dart compile exe example/shelf_docker_shutdown_example.dart -o server


FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/server /bin/

ENV PORT 8080

ENTRYPOINT ["/bin/server"]
