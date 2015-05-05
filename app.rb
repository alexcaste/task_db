require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require('pg')
require ('pry')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @all_lists = List.all()
  erb(:index)
end

post('/new_list') do
  new_list = params.fetch("user_list_input")
  List.new(:name => new_list, :id => nil).save()
  @all_lists = List.all()
  erb(:index)
end

get('/single_list/:id') do
  @the_list_of_tasks = List.find(params.fetch("id").to_i())
  erb(:single_list)
end

post('/new_task') do
  @the_list_of_tasks = List.find(params.fetch("list_id").to_i())
  description = params.fetch("user_task_input")
  user_due = params.fetch("user_date_input")
  list_id = params.fetch("list_id").to_i() #this will be invisible form?
  new_task = Task.new(:description => description, :list_id => list_id, :due => user_due)
  new_task.save()
  erb(:single_list)
end

get('/clear_db') do
  List.clear()
  erb(:index)
end
