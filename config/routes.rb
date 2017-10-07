Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  HighVoltage.configure do |config|
    config.home_page = 'index'
  end
  resources :jobs
end
