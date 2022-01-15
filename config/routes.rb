Rails.application.routes.draw do

  resources :updates
  resources :home, only: [:index]
  root "home#index"

  resources :quicks
  post "quick/:id/archive" => "quicks#archive_quick", as: "archive_quick"
  post "quick/:id/unarchive" => "quicks#unarchive_quick", as: "unarchive_quick"
  post "quick/:id/make_responded" => "quicks#make_responded", as: "make_responded"
  post "quick/:id/make_unresponded" => "quicks#make_unresponded", as: "make_unresponded"
  post "quick/:id/quick_read" => "quicks#quick_read", as: "quick_read"
  post "quick/:id/quick_unread" => "quicks#quick_unread", as: "quick_unread"


  devise_for :users, :controllers => { registrations: 'registrations' }
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :users, only: [:show]
  post "user/:id/archive" => "users#archive_client", as: "archive_client"
  post "user/:id/unarchive" => "users#unarchive_client", as: "unarchive_client"
  post "user/:id/confirm" => "users#confirm_client", as: "confirm_client"
  post "user/:id/unconfirm" => "users#unconfirm_client", as: "unconfirm_client"
  post "user/:id/client_read" => "users#client_read", as: "client_read"
  post "user/:id/client_unread" => "users#client_unread", as: "client_unread"


  get 'test/hero'

  resources :buyers
  post "buyer/:id/archive" => "buyers#archive_buyer", as: "archive_buyer"
  post "buyer/:id/unarchive" => "buyers#unarchive_buyer", as: "unarchive_buyer"
  post "buyer/:id/buyer_read" => "buyers#buyer_read", as: "buyer_read"
  post "buyer/:id/buyer_unread" => "buyers#buyer_unread", as: "buyer_unread"

  resources :intakes
  resources :listings

  resources :contacts
  post "contact/:id/archive" => "contacts#archive_contact", as: "archive_contact"
  post "contact/:id/unarchive" => "contacts#unarchive_contact", as: "unarchive_contact"
  post "contact/:id/contact_read" => "contacts#contact_read", as: "contact_read"
  post "contact/:id/contact_unread" => "contacts#contact_unread", as: "contact_unread"

  resources :blogs do
    resources :comments
  end

  get 'tags/:tag', to: 'blogs#index', as: :tag
  post "users/:id/subscribe_to_blog" => "users#subscribe_to_blog", as: "subscribe_to_blog"
  post "comment/:id/approve" => "comments#approve_comment", as: "approve_comment"
  post "comment/:id/unapprove" => "comments#unapprove_comment", as: "unapprove_comment"
  post "comment/:id/comment_read" => "comments#comment_read", as: "comment_read"
  post "comment/:id/comment_unread" => "comments#comment_unread", as: "comment_unread"
  get "blogs/:id/download_pdf", controller: 'blogs', action:'download_pdf', as: 'download_pdf'

  resources :values
  post "value/:id/archive" => "values#archive_value", as: "archive_value"
  post "value/:id/unarchive" => "values#unarchive_value", as: "unarchive_value"
  post "value/:id/value_read" => "values#value_read", as: "value_read"
  post "value/:id/value_unread" => "values#value_unread", as: "value_unread"

  resources :resources
  resources :subscribers
  resources :infos
  resources :affords
  resources :pillars

end
