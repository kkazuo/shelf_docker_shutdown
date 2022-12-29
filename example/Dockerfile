FROM dart:stable AS build
LABEL stage=build
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline &&\
        dart compile exe bin/server.dart -o bin/server


FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/server /bin/

ENV PORT 8080

ENTRYPOINT ["/bin/server"]
