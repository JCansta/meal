class Api::V1::CategoriesController < ApiController
    def index
        categories = Category.all
        render json: {categories: categories}
    end
    
    def create
        category = Category.new(name: category_params[:name])
        category.save!
        render json: {category: category}, status: :created

        
    end

    def destroy
        category = Category.find(params[:id])
        category.destroy!
        render json: {message: "categoria eliminado correctametne"}, status: :success
    end

    private

    def category_params
        params.require(:category).permit(:id, :name)
    end
end