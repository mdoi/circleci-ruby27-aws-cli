FROM cimg/ruby:2.7.6

RUN sudo apt-get update --allow-releaseinfo-change && sudo apt-get install -y \
  ca-certificates \
  apt-transport-https \
  gnupg-agent \
  software-properties-common \
  tar \
  unzip \
  curl \
  less \
  libmariadbclient-dev \
  libmagickcore-dev \
  libmagickwand-dev \
  --no-install-recommends \
  && sudo rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get update && sudo apt-get install -y \
  nodejs \
  --no-install-recommends \
  && sudo rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install -y \
  yarn \
  --no-install-recommends \
  && sudo rm -rf /var/lib/apt/lists/*

RUN sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN sudo unzip awscliv2.zip
RUN sudo ./aws/install

