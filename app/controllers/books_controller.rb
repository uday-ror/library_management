class BooksController < ApplicationController
 before_action :authenticate_secure!
  
  def index 
     @books = Book.all
  end

  def subscribe_plan
    @plans = Plan.all 
  end 
   

  def show
    @book = Book.find(params[:id])
    #@plan = Plan.find(params[:id])
  end


  def update_subscription_plan
    @plan = Plan.find(params[:plan_id])
    current_user.plan.id = @plan.id
    if current_user.save
      redirect_to root_path
    else
       render :subscription_plan
    end   
  end  
   
   def book_params
    params.require(:book).permit(:title, :author, :discription, :image, :plane_id)
   end           
end