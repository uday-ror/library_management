class Admin::PlansController < Admin::AdminsController
  before_action :authenticate_secure!
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to  [:admin, @plan]
    else
      render :new
    end
  end  

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      redirect_to [:admin, @plan]
    else
      render :edit
    end
  end


  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    
    redirect_to root_path
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :detail, :amount)
    end
end