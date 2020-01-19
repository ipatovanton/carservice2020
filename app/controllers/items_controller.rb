# encoding: utf-8
class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:new, :create, :destroy]

  def new
    @item = Item.new
  end

  def create
    @service = Service.find(params[:service_id])
    @item = @service.items.build(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @service }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service = Service.find(params[:service_id])
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to service_path(@service) }
      format.json { head :no_content }
    end
  end

  private
    def item_params
      params.require(:item).permit(:title, :price, :service_id)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end