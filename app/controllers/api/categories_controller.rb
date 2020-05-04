class Api::CategoriesController < ApplicationController

  def children_category
    @children_category_array = Category.find(params[:id]).children
    render '/api/children_categories.json.jbuilder', formats: 'json', handlers: 'jbuilder'
  end
end