class TodosController < ApplicationController
  before_action :authenticate_user!, :set_list

  def index
    @todos = @list.todos.not_completed
    @completed_todos = @list.todos.completed
  end

  def update
    todo = @list.todos.find(params[:id])
    unless todo.update(todo_params)
      flash[:error] = todo.errors.full_messages.join("<br />")
    end
    if todo.is_complete
      todo.move_to_bottom
    end
  end

  def create
    @todo = @list.todos.new(todo_params)
    unless @todo.save
      flash[:error] = @todo.errors.full_messages.join("<br />")
    end
  end

  def destroy
    @todo = @list.todos.find(params[:id])
    @todo.destroy
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end

  def todo_params
    params.require(:todo).permit(:description, :list_id, :position, :is_complete)
  end
end
