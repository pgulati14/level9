# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
<<<<<<< HEAD
   # render plain: Todo.order(:due_date).map {|todo| todo.to_pleasant_string}.join("\n")
   render "index"
=======
    #render plain: Todo.order(:due_date).map {|todo| todo.to_pleasant_string}.join("\n")
    render "index"
>>>>>>> main
  end
  def show
    id = params[:id]
    #render plain: " the id you want to see was #{id}"
    todo =Todo.find(id)
    render "todo"
    #render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date:  due_date,
      completed: false,
      )
    #render plain: "this is create action! the params are: #{params.to_s}"
    response_text = " Hey! your Todo is created with new id #{new_todo.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo= Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated todo completed status to #{completed}"
  end
end
