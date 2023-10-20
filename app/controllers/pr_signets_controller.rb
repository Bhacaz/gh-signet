class PrSignetsController < ApplicationController
  def index
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
  end

  def update
  end

  def destroy
  end

  private

  def pr_signet_params
    params.require(:pr_signet).permit(:query, :title, :sort, :order)
  end
end
