Rails.application.routes.draw do

  resources :contacts, only: [:new, :create]
  resources :team_members, only: [:show]

  mount Optimadmin::Engine => "/admin"
  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
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
