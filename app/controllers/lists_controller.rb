class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def update
    list = current_user.lists.find(params[:id])
    unless list.update(list_params)
      flash[:error] = list.errors.full_messages.join("<br />")
    end
    respond_to do |format|
      format.js {}
      format.json {respond_with_bip(list)}
    end
  end

  def create
    @list = current_user.lists.new(list_params)
    unless @list.save
      flash[:error] = @list.errors.full_messages.join("<br />")
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id, :position)
  end
end
