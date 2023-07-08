class Admin::TypesController < ApplicationController

  def create
    type = Type.new(type_params)
    type.save
    redirect_to admin_types_path
  end

  def index
    @type = Type.new
    @types = Type.all
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    type = Type.find(params[:id])
    if type.update(type_params)
      redirect_to admin_types_path
    else
      render :edit
    end
  end

  private

  def type_params
    params.require(:type).permit(:name)
  end

end
