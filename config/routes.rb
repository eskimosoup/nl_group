Rails.application.routes.draw do
  resources :pages, only: :show
  resources :contacts, only: [:new, :create]
  resources :team_members, only: [:index, :show], path: 'team-members'
  resources :testimonials, only: [:index]

  get ":id", to: "landing_pages#show", as: :landing_page, constraints: LandingPageConstraint.new

  namespace :member_area, path: "member-area" do
    resources :sessions, only: [:new, :create, :destroy]
    get :login, to: "sessions#new", as: "login"
    get :logout, to: "sessions#destroy", as: "logout"
    resource :member_profile, path: "member-profile"
    resource :basic_information, path: "basic-information"
    resource :work_eligibility, path: "eligibility-to-work"
    resources :password_resets, path: "password-reset", only: [:new, :create, :edit]
    root to: "base#index"
  end

  mount Optimadmin::Engine => "/admin"

  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :work_reasons, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :team_member_teams, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :landing_pages, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end


  resources :pages, except: :show do
    collection do
      post 'order'
    end
    member do
      get 'edit_images'
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :additional_paragraphs, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :additional_buttons, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :additional_titles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :additional_blocks, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :additional_rows, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :resources, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :frequently_asked_questions, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :testimonials, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :team_members, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :clients, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
end
