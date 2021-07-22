FROM nikolaik/python-nodejs:python3.8-nodejs16-slim as builder

RUN apt-get update \
    && apt-get install curl unzip -y \
    && apt-get clean

# Install aws cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.2.3.zip" -o ./"awscliv2.zip"

RUN unzip awscliv2.zip
RUN ./aws/install -i /usr/local/aws -b /usr/local/bin

RUN rm -rf ./aws

WORKDIR /app

COPY poetry.lock pyproject.toml ./

RUN python -m pip install --upgrade pip

# Install requirements
RUN pip install "poetry==1.1.6"
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

COPY package.json package-lock.json ./

RUN npm i -g serverless@2.X --silent
RUN npm ci --include=dev --silent
