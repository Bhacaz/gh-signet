class PrSignetsController < ApplicationController
  def index
    @pr_signets = auth_user.pr_signets
  end

  def new
    @pr_signet = PrSignet.new
  end

  def show
  end

  def create
    @pr_signet = PrSignet.new(user: auth_user, **pr_signet_params)
    if @pr_signet.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @pr_signet = PrSignet.find(params[:id])
  end

  def update
    @pr_signet = PrSignet.find(params[:id])
    if @pr_signet.update(pr_signet_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    PrSignet.find(params[:id]).destroy
    redirect_to action: :index
  end

  private

  def pr_signet_params
    params.require(:pr_signet).permit(:query, :title, :sort, :order)
  end
end
