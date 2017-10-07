Rails.application.routes.draw do
  devise_for :users
  HighVoltage.configure do |config|
    config.home_page = 'index'
  end
end
