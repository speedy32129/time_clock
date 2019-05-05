# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# RedmineApp::Application.routes.draw do
#   #match 'projects/:project_id/boards/:board_id/manage', :to => 'boards_watchers#manage', :via => [:get, :post]
#   match 'time_clocks/stop', to: 'time_clocks#stop', via: %i[get post]
# end

#RedmineApp::Application.routes.draw do
#  post '/time_clocks', to: 'time_clocks#stop' #, as: 'new_impersonation'
#end

#source https://www.youtube.com/watch?v=ROPvWbs5Bu4
# *** these work
#Rails.application.routes.draw do
#  get '/time_clocks', controller: 'time_clocks', action: 'index'
#  get '/time_clocks', controller: 'time_clocks', action: 'stop'
#end

#controller :time_clocks do
#  get 'time_clocks/index' => 'index'
#  get 'time_clocks/start' => 'start'
#  get 'time_clocks/stop'  => 'stop'
#end

Rails.application.routes.draw do

  match 'time_clocks/stop',            to: 'time_clocks#stop',            via: %i[get post]
  match 'time_clocks/start',           to: 'time_clocks#start',           via: %i[get post]
  match 'time_clocks/suspend',         to: 'time_clocks#suspend',         via: %i[get post]
  match 'time_clocks/resume',          to: 'time_clocks#resume',          via: %i[get post]
  match 'time_clocks/render_menu',     to: 'time_clocks#render_menu',     via: %i[get post]
  match 'time_clocks/show_report',     to: 'time_clocks#show_report',     via: %i[get post]
  match 'time_clocks/delete',          to: 'time_clocks#delete',          via: %i[get post]
  match 'time_clocks',                 to: 'time_clocks#index',           via: %i[get post]

end