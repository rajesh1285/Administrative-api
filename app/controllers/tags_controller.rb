class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
   @user = User.find(params[:user_id])
   @tag = @user.tags.create(tags_params)
   @tag.save
   render json: {
         message: 'tag created successfully'
       }
 end

 def destroy
   @user = User.find(params[:user_id])
   @tag = @user.tags.find(params[:id])
   @tag.destroy
   render json: {
         message: 'tag deleted successfully'
       }
 end

 def show
   @tag = Tag.find(params[:id])
   render json: @tag
 end

 private
   def tags_params
     params.require(:tag).permit(:name, :description)
   end
end
