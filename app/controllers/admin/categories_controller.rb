class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
  end

  def create
  end


  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
