Rails.application.routes.draw do
  resources :pages, only: :show
  resources :contacts, only: [:new, :create]
  resources :team_members, only: [:index, :show], path: 'team-members'
  resources :testimonials, only: [:index]
  resources :jobs, only: [:index]

  get ":id", to: "landing_pages#show", as: :landing_page, constraints: LandingPageConstraint.new

  namespace :member_area, path: "member-area" do
    resources :sessions, only: [:new, :create, :destroy]
    get :login, to: "sessions#new", as: "login"
    get :logout, to: "sessions#destroy", as: "logout"
    get :referees_and_emergency_contact, to: "base#referees_and_emergency_contact", path: "referees-and-emergency-contact"
    get :occupational_health_screening, to: "base#occupational_health_screening", path: "occupational-health-screening"
    get :registration_data, to: "base#registration_data", path: "registration-data"
    resource :member_profile, path: "member-profile"
    resource :basic_information, path: "basic-information", except: [:show]
    resource :basic_medical_history, path: "basic-medical-history", except: [:show]
    resource :dbs_check, path: "dbs-check", except: [:show]
    resource :emergency_contact, path: "emergency-contact", except: [:show]
    resource :immunisation_history, path: "immunisation-history", except: [:show]
    resource :member_training, path: "training", except: [:show]
    resource :member_qualification, path: "member-qualification", except: [:show]
    resources :member_addresses, path: "addresses", except: [:show]
    resource :member_submission, path: "submission", only: [:new, :create]
    resources :password_resets, path: "password-reset", only: [:new, :create, :edit, :update]
    resources :set_passwords, path: "set-password", only: [:edit, :update]
    resource :payment_information, path: "payment-information", except: :show
    resources :referees, except: [:index, :show]
    resource :tuberculosis_chicken_pox_check, path: "tuberculosis-chicken-pox-check", except: [:show]
    resource :work_eligibility, path: "eligibility-to-work", except: [:show]
    root to: "base#index"
  end

  mount Optimadmin::Engine => "/admin"

  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
  resources :admin_messages, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :member_profiles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  concern :orderable do
    collection do
      post 'order'
    end
  end
  concern :toggleable do
    member do
      get 'toggle'
    end
  end
  concern :imageable do
    member do
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end

  resources :key_contacts, except: [:show], concerns: [:orderable, :toggleable]
  resources :mandatory_training_courses, except: [:show], concerns: [:orderable, :toggleable]
  resources :work_reasons, except: [:show], concerns: [:orderable, :toggleable, :imageable]
  resources :team_member_teams, except: [:show], concerns: [:orderable, :toggleable]
  resources :landing_pages, except: [:show], concerns: [:orderable, :toggleable]
  resources :pages, except: :show, concerns: [:orderable, :toggleable, :imageable]
  resources :additional_paragraphs, except: [:show], concerns: [:orderable, :toggleable]
  resources :additional_buttons, except: [:show], concerns: [:orderable, :toggleable]
  resources :additional_titles, except: [:show], concerns: [:orderable, :toggleable]
  resources :additional_blocks, except: [:show], concerns: [:orderable, :toggleable]
  resources :additional_rows, except: [:show], concerns: [:orderable, :toggleable]
  resources :resources, except: [:show], concerns: [:orderable, :toggleable]
  resources :frequently_asked_questions, except: [:show], concerns: [:orderable, :toggleable]
  resources :testimonials, except: [:show], concerns: [:orderable, :toggleable, :imageable]
  resources :team_members, except: [:show], concerns: [:orderable, :toggleable, :imageable]
  resources :clients, except: [:show], concerns: [:orderable, :toggleable, :imageable]
end
