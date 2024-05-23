class BookmarksController < ApplicationController
 # before_action :set_list, only: [:create] #, :edit, :update, :destroy]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])

    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity # Status: 422, on peut écrire l'erreur que l'on souhaite.
    end
  end

  def destroy
    
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  # def set_list
  #   @list = List.find(params[:list_id])
  # end
end
