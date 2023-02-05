# Rails.rootを使用
require File.expand_path(File.dirname(__FILE__) + "/environment")

# cronを実行する環境変数(RAILS_ENVが指定されていないときはdevelopmentを使用)
rails_env = ENV['RAILS_ENV'] || :development

# cronの実行環境を指定(上記で作成した変数を指定)
set :environment, rails_env

# cronのログファイルの出力先指定
set :output, "#{Rails.root}/log/cron.log"

# パスを通すコマンド
# job_type :rake, "source /Users/[ユーザー名]/.zshrc; export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"


# 3時間毎に実行するスケジューリング
every 1.day, at: '20:30 pm' do
  rake 'attendance:notion_atendance_no_touch'
end