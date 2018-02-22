FROM buildpack-deps:jessie

ENV HOME /Frontend-Starter-Kit

WORKDIR ${HOME}
ADD . $HOME

# node --
ENV NODE 8

RUN \
  curl -sL https://deb.nodesource.com/setup_$NODE.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -y nodejs yarn
# -- node

RUN \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /src/*.deb

RUN yarn install

EXPOSE 8000 8080
