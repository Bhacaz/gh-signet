class PrSignetsController < ApplicationController
  before_action :set_record, only: %i[edit update destroy gh_pull_requests]
  def index
    @pr_signets = auth_user.pr_signets
  end

  def new
    @pr_signet = PrSignet.new
  end

  def create
    @pr_signet = PrSignet.new(user: auth_user, **pr_signet_params)
    if @pr_signet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pr_signet.update(pr_signet_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @pr_signet.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@pr_signet) }
      format.html { redirect_to action: :index }
    end
  end

  def gh_pull_requests
    @pr_signet.gh_pull_requests
  end

  private

  def pr_signet_params
    params.require(:pr_signet).permit(:query, :title, :sort, :order)
  end

  def set_record
    @pr_signet = PrSignet.find(params[:id])
  end
end
