class Api::V1::RecipesController < ApplicationController
    before_action :authenticate
    def index
        recipes = Recipe.all
        render json: {recipes: recipes}
    end

    def show
        recipes = Recipe.find(recipe_params[:recipe_id])
    end

    def update
        
    end

    def recipe_params
        params.require(:recipes).pertmit(:recipe_id)
    end
end