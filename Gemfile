source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'high_voltage', '~> 3.0.0'
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'acts-as-taggable-on', '~> 5.0'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem "font-awesome-rails"
gem 'active_skin'
gem 'active_admin_theme'
gem "cancan"
gem "paperclip", "~> 5.0.0"
gem 'time_difference'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rails_12factor', group: :production
gem 'pg', '~> 0.21.0', group: :production
