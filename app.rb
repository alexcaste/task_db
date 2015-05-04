require('sinatra')
require('sinatra/reloader')
require('./lib/task')
also_reload('lib/**/*.rb')
require('pg')
require "pry"

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @tasks = Task.all()
  erb(:index)
end

post('/success') do

  description = params.fetch('the_task')

  new_task = Task.new(description)
  binding.pry
  new_task.save()
  erb(:success)
end
