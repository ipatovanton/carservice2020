  # encoding: utf-8
class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :edit, :update]

  def new
    @setting = Setting.new
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def create
    @setting = Setting.new(setting_params)
    respond_to do |format|
      if @setting.save
        format.html { redirect_to admin_path }
        format.json { render :show, status: :created, location: admin_path }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @setting = Setting.find(params[:id])
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to admin_path }
        format.json { render :show, status: :ok, location: admin_path }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def setting_params
      params.require(:setting).permit(:title, :description, :image, :phone, :telegram, :whatsapp, :viber, :seotitle, :seodescription)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end