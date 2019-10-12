FROM gableroux/flutter:latest

WORKDIR /app

COPY . .

RUN flutter pub get

CMD [ "sh", "-c" , "flutter analyze --no-pub --preamble . && flutter test"]