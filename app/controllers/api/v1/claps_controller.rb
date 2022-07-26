class Api::V1::ClapsController < ApplicationController
    before_action :authenticate
    before_action :find_recipe
    #before_action :already_claped, only: [:destroy]
    before_action :find_clap, only: [:destroy]
    
    def create
        if already_claped?
            render json: {message: 'No puedes dar clap mas de una vez'}
        else
            @recipe.claps.create(user_id: current_user.id)
            render json: {recipe: @recipe, clap: @recipe.claps.last}
        end
    end

    def destroy
        if !(already_claped?)
            render json: {message: 'No puedes quitar clap de donde no tienes'}
        else
            @clap.destroy
            render json: {message: 'Elemento eliminado correctamente'}
        end
    end

    private
    
    def find_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def already_claped?
        Clap.where(user_id: current_user.id, recipe_id: params[:recipe_id]).exists?
    end

    def find_clap
        @clap = @recipe.claps.find_by(user_id: current_user.id)
    end

end
