class Farmer::PostCommentsController < ApplicationController
  def create
    @farm = Farm.find(params[:farm_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.public_id = current_public.id
    @post_comment.farm_id = @farm.id
    @post_comment.save
  end

  def destroy
    @farm = Farm.find(params[:farm_id])
    @post_comment = PostComment.find_by(id: [params[:id]]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
end
