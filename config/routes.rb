Rails.application.routes.draw do

  namespace :user do
    get 'users/show'
    get 'users/edit'
  end
  root to: 'homes#top'

  scope module: :user do
    resources :histories
    resources :resumes, except:[:show, :index]
    resources :advantages, except:[:show, :index]
    resources :users, only: [:show, :edit]
    get '/mypage', to: 'mypages#mypage', as: 'mypage'
  end
  # =====ユーザーdevise=====
  devise_for :users,
  path:"",
  path_names: {sign_up:"", sign_in:"login", sign_out:"logout", registration:"sign_up"},
  controllers: {
    sessions:"users/sessions",
    passwords:"users/passwords",
    registrations:"users/registrations"
  }
end
