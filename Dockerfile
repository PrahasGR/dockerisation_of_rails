FROM ruby:2.7
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN apt-get update && apt-get install -y nodejs
RUN gem install bundler -v 2.4
RUN gem install pkg-config
RUN bundle install
COPY package.json yarn.lock ./
RUN yarn install --check-files
COPY . .
EXPOSE 3000
#RUN apt-get update && apt-get install -y cron
#COPY backup_script.sh /backup_script.sh
#RUN chmod +x /backup_script.sh
#RUN echo "08 13 * * * /backup_script.sh" >> /etc/crontab

CMD ["rails server -b 0.0.0.0"]



