class Task
  attr_reader(:description, :list_id, :due)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id).to_i
    @due = attributes.fetch(:due)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i() # The information comes out of the database as a string.
      due = task.fetch("due")
      tasks.push(Task.new({:description => description, :list_id => list_id, :due => due}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, due) VALUES ('#{@description}', #{@list_id}, '#{@due}');")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end


end
