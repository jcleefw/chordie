Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # ------ Speakers routes ------
    resources :songs
  # -----------------------------
  post 'songs/conversion' => 'songs#chp_html_conversion'


end
