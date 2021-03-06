require "date"

class Todo
  def initialize(todo_task,date,status)
    @todo_task=todo_task
    @date=date
    @status=status
   #[ { text: todo_task, due_date: date, completed: status }]
   #return obj
  end
  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..
  def overdue?
    if @date < Date.today
      return true
    else
      return false
    end
  end

  def due_today?
    if @date == Date.today
      return true
    else
      return false
    end
  end

  def due_later?
    if @date > Date.today
      return true
    else
      return false
    end
  end

  def to_displayable_string
    #"final"
    if @date==Date.today
      "#{@todo_task}"
    else
      "#{@todo_task}  #{@date}" 
    end
    #{@status}"
    #"is returned"
  end
end

class TodosList < Todo
  def initialize(todos)
    @todos = todos
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end  

  def add(todo_obj)
    @todos.push(todo_obj)
  end

  def due_today
    TodosList.new(@todos.filter{ |todo| todo.due_today?})
  end

  def due_later
    TodosList.new(@todos.filter{ |todo| todo.due_later?})
  end
  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..

  def to_displayable_list
   # @todos.each {|item| item.to_displayable_string}
   #@todos.keys.each{|item| item.to_displayable_string}
   #@todos.each{|item| item.to_displayable_string}
   ####"#{@todos}.#{to_displayable_string}"
   @todos.map{|item| item.to_displayable_string}
   #"#{@todos}.#{@each{}#{to_displayable_string}"
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"