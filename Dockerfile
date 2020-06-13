FROM ruby:2.5.3

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs vim tcpdump

# 作業ディレクトリの作成、設定
RUN mkdir /app 
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app 
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
#ADD config/unicorn.rb $APP_ROOT/config/unicorn.rb

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT

