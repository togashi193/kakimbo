FROM ruby:2.6.2

RUN mkdir /kakimbo
WORKDIR /kakimbo

COPY Gemfile /kakimbo/Gemfile
COPY Gemfile.lock /kakimbo/Gemfile.lock

RUN gem install bundler:2.0.1 && \
      bundle install --jobs=4

COPY . /kakimbo

ENV PORT 80
EXPOSE 80
CMD ["rails", "s", "-b", "0.0.0.0"]
