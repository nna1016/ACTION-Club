Rails.application.routes.draw do
  get 'attendance/reqModify'
  post 'attendance/reqModifyUpdate'
  get 'attendance/reqDo/:id' => 'attendance#reqDo'
  post 'course/new'
  get 'course/generate'
  get 'course/list'
  post 'college/new'
  get 'college/generate'
  get 'college/list'
  get 'profile/assignment/:id' => 'profile#assignment'
  post 'profile/grant'
  get 'department/generate'
  get 'department/list'
  get 'department/assignment'
  post 'department/new'
  post 'role/new'
  get 'role/generate'
  get 'role/assignment/:id' => 'role#assignment'
  post 'role/grant'
  get 'role/list'
  get 'master/logs' => 'home#logs'
  get 'master/resourceMonitor' => 'home#resourceMonitor'
  get 'master' => 'home#master'
  get 'attendance/log'
  get 'attendance/list'
  post 'attendance/success'
  get 'attendance/success_in/:linkUserId' => 'attendance#success_in'
  get 'attendance/success_out/:linkUserId' => 'attendance#success_out'
  get 'attendance/error'
  get 'attendance/auto'
  get 'commingSoon' => 'home#commingsoon'
  get 'request/list' => 'request#list'
  get 'request/info/:id' => 'request#info'
  get 'profile/info/:id' => 'profile#info'
  get 'profile/list' => 'profile#list'
  get 'profile/edit/:id' => 'profile#edit'
  get 'profile/reqDeny/:id' => 'profile#reqDeny'
  get 'profile/reqDo/:id' => 'profile#reqDo'
  get 'profile/reqEdit/:id' => 'profile#reqEdit'
  get 'profile/imageup/:id' => 'profile#imageup'
  get 'profile/entry' => 'profile#entry'
  post 'profile/UserUpdate'
  post 'profile/reqUserUpdate'
  root to: 'home#index'
  get 'home/index'
  get 'request' => 'home#request'
  get 'recruit' => 'home#recruit'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  } 
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
end
