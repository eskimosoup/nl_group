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
    get :referees_and_emergency_contact, to: "base#referees_and_emergency_contact", path: "referees-and-emergency-contact"
    get :occupational_health_screening, to: "base#occupational_health_screening", path: "occupational-health-screening"
    resource :member_profile, path: "member-profile"
    resource :basic_information, path: "basic-information", except: [:show]
    resource :basic_medical_history, path: "basic-medical-history", except: [:show]
    resource :emergency_contact, path: "emergency-contact", except: [:show]
    resource :work_eligibility, path: "eligibility-to-work", except: [:show]
    resource :member_training, path: "training", except: [:show]
    resource :member_qualification, path: "member-qualification", except: [:show]
    resources :member_addresses, path: "addresses", except: [:show]
    resources :password_resets, path: "password-reset", only: [:new, :create, :edit]
    resources :referees, except: [:index, :show]
    root to: "base#index"
  end

  mount Optimadmin::Engine => "/admin"

  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :mandatory_training_courses, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
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
