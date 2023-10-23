class PrSignetsController < ApplicationController
  before_action :set_record, only: %i[edit update destroy gh_pull_requests]
  def index
    @pr_signets = auth_user.pr_signets.order(:display_order)
  end

  def new
    @pr_signet = PrSignet.new(user: auth_user)
  end

  def create
    @pr_signet = PrSignet.new(user: auth_user, **pr_signet_params)

    if params[:preview]
      show_preview
      return
    end

    if @pr_signet.save
      redirect_to action: :index
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace([@pr_signet, :show_errors], partial: 'show_errors', locals: { record: @pr_signet }) }
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @pr_signet.assign_attributes(pr_signet_params)
    if params[:preview]
      show_preview
      return
    end

    if @pr_signet.save
      redirect_to action: :index
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace([@pr_signet, :show_errors], partial: 'show_errors', locals: { record: @pr_signet }) }
        format.html { render :edit }
      end
    end
  end

  def destroy
    @pr_signet.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to action: :index }
    end 
  end

  def gh_pull_requests
  end

  def preview
    @pr_signet = PrSignet.new(user: auth_user, **pr_signet_params)
    render turbo_stream: turbo_stream.replace(:preview, partial: 'pr_signets/preview')
  end

  private

  def pr_signet_params
    params.require(:pr_signet).permit(:query, :title, :sort, :order, :display_order)
  end

  def set_record
    @pr_signet = PrSignet.find(params[:id])
  end

  def show_preview
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(:new_signet_preview, partial: 'pr_signets/preview') }
    end
  end
end
