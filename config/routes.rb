Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # ------ Speakers routes ------
    resources :songs
  # -----------------------------
  post 'songs/conversion' => 'songs#chp_html_conversion'
  post 'songs/save' => 'songs#save'
  post 'songs/show' => 'songs#toggle_format'

  get '/' => 'songs#index'
end
