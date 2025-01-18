FROM ubuntu:latest

RUN apt-get update && apt-get install -yq \
      curl \
      apt-transport-https \
      ca-certificates \
      gnupg \
      git \
      build-essential \
      postgresql-client

RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - \
    && apt-get install -y nodejs

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]
