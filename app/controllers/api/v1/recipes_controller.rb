class Api::V1::RecipesController < ApiController
    before_action :authenticate
    def index
        recipes = Recipe.all
        render json: {recipes: recipes}, status: :ok
    end

    def show
        recipe = Recipe.find(params[:id])
        render json: {recipes: recipe}, status: :found
    end

    def create
        Category.find(recipe_params[:category_id])
        recipe = Recipe.new(name: recipe_params[:name], category_id: recipe_params[:category_id], instruction: recipe_params[:instruction], image: recipe_params[:image])
        recipe.save!
        render json: {recipe: recipe}, status: :created
    end

    private

    def recipe_params
        params.require(:recipes).permit(:id, :name, :category_id, :instruction, :image)
    end

end