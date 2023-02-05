FROM ruby:2.6
ENV TZ Asia/Tokyo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /ACTION-Club
WORKDIR /ACTION-Club
COPY Gemfile /ACTION-Club/Gemfile
COPY Gemfile.lock /ACTION-Club/Gemfile.lock
RUN bundle install
COPY . /ACTION-Club
RUN rails webpacker:install
RUN rails webpacker:compile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]