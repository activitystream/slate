FROM ruby:1.9.3

WORKDIR /data

COPY . /data
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server"]
