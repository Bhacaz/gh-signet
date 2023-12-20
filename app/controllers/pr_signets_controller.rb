class PrSignetsController < ApplicationController
  before_action :set_record, only: %i[
  edit update destroy gh_pull_requests toggle_expanded preview gh_pull_request_size
]
  def index
    @pr_signets = auth_user.pr_signets.order(:display_order)
  end

  def new
    @pr_signet = auth_user.pr_signets.build
    @pr_signet.display_order = auth_user.pr_signets.size
  end

  def create
    @pr_signet = auth_user.pr_signets.build(pr_signet_params)

    if params[:preview]
      show_preview
      return
    end

    if @pr_signet.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
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

  def gh_pull_request_size
    render turbo_stream: turbo_stream.replace("gh_pull_request_size_pr_signet_#{@pr_signet.id}",
                                              @pr_signet.gh_pull_request_size)
  end

  def toggle_expanded
    @pr_signet.update!(expanded: !@pr_signet.expanded)
    unless @pr_signet.expanded
      render :gh_pull_requests, id: @pr_signet.id
      nil
    end
  end

  def preview
    render turbo_stream: turbo_stream.replace(:preview, partial: 'pr_signets/preview')
  end

  private

  def pr_signet_params
    params.require(:pr_signet).permit(:query, :title, :sort, :order, :display_order)
  end

  def set_record
    @pr_signet = auth_user.pr_signets.find(params[:id])
  end

  def show_preview
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(:new_signet_preview, partial: 'pr_signets/preview') }
    end
  end
end
