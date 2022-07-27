class Api::V1::CategoriesController < ApiController
    def index
        categories = Category.all
        render json: {categories: categories}
    end
    
    def create
        category = Category.new(name: category_params[:name])
        if category.save
            render json: {category: category}
        else
            render json: {message: "no se pudo crear la categoría"}
        end
        
    end

    def destroy
        category = Category.find(category_params[:id])
        if category.destroy
            render json: {message: "categoria eliminado correctametne"}
        else
            render json: {message: "categoria no se pudo eliminar"}
        end
    end

    private

    def category_params
        params.require(:category).permit(:id, :name)
    end
end