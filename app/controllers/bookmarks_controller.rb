class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(movie_id: params[:bookmark][:movie].to_i,
                             comment: bookmark_params[:comment],
                             list_id: params[:list_id])
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      # TO BE FIXED
      # render list_path(@bookmark.list), status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
