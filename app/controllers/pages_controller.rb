class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:admin]
  before_action :admin_user, only: [:admin]

  def home
  	@services = Service.all.order(position: :asc )
  end

  def admin
    @setting = Setting.first
  	@services = Service.all.order(position: :asc )
  end

  def sort
    params[:service].each_with_index do |id, index|
      Service.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

