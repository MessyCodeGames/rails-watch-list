class ListsController < ApplicationController
  before_action :set_list, only: [:show] #, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

  # No need for app/views/lists/create.html.erb
  # GERER LE CAS D'ERREUR
    if @list.save
      redirect_to lists_index_path
    else
      render :new, status: :unprocessable_entity # Status: 422, on peut écrire l'erreur que l'on souhaite.
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
