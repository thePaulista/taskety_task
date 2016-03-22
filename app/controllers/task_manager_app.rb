class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__) #specifying that our root is just app
  set :method_override, true

  require 'models/task_manager'

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = task_manager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task_manager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = task_manager.find(id.to_i)
    erb :show
  end

  put '/tasks/:id' do |id|
    task_manager.update(params[:task], id)
    redirect "/tasks/#{id}"
  end

  delete "/tasks/:id" do |id|
    task_manager.delete(id.to_i)
    redirect '/tasks'
  end

  def task_manager
    database = YAML::Store.new('db/task_manager')
    @task_manager ||= TaskManager.new(database)
  end
end
