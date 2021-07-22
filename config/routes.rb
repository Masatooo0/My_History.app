Rails.application.routes.draw do

  get 'notifications/index'
  root to: 'homes#top'
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  scope module: :user do
    resources :histories
    resources :resumes, except:[:show, :index]
    resources :advantages, except:[:show, :index]
    resources :users, only: [:show, :edit, :update]
    resources :charts, only: [:index]
    resources :missions
    resources :notifications, only: [:index]
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
