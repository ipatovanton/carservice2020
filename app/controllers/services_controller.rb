  # encoding: utf-8
class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
    @service = Service.find(params[:id])
    @items = @service.items.all
  end

  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])
  end

  def create
    @service = current_user.services.build(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_path }
        format.json { render :show, status: :created, location: admin_path }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_path }
        format.json { render :show, status: :ok, location: admin_path }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.json { head :no_content }
    end
  end

  private
    def service_params
      params.require(:service).permit(:title, :description, :image, :user_id, :backgroundcolor, :position)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end