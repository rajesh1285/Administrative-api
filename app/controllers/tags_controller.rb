class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

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

 def update
   if @tag.update(tags_params)
     render json: @tag
   else
     render json: @tag.errors, status: :unprocessable_entity
   end
 end

 def show
   render json: @tag
 end

 private

   def set_tag
     @tag = Tag.find(params[:id])
   end

   def tags_params
     params.require(:tag).permit(:name, :description)
   end
end
