class Api::V1::ClapsController < ApplicationController
    before_action :find_recipe
    before_action :already_claped, only: [:destroy]
    before_action :authenticate
    
    def create
        if already_claped?
            render json: {message: 'No puedes dar like mas de una vez'}
        else
            @recipe.claps.create(user_id: current_user.id)
            render json: {recipe: @recipe, clap: Clap.last}
        end
    end

    def destroy
        if !already_claped?
            render json: {message: 'No puedes quitar like'}
        else
            @recipe.claps.create(user_id: current_user.id)
            render json: {recipe: @recipe, clap: Clap.last}
        end
    end

    private
    
    def find_recipe
        @recipe = Post.find(params[:post_id])
    end

    def already_claped?
        @Clap.where(user_id: current_user.id, recipe_id: params[:recipe_id]).exists?
    end

    def find_clap

end
