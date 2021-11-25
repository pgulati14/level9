# todos_controller.rb
class TodosController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def index
    @todos = Todo.of_user(current_user)
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    #response_text = " Hey! your Todo is created with new id #{new_todo.id}"
    #render plain: response_text
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
    #render plain: "Updated todo completed status to #{completed}"
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
    #render plain: "Updated todo completed status to #{completed}"
  end
end
