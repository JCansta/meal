class Api::V1::MealsController < ApiController
    before_action :authenticate
    def create
        1.times do
            response = JSON.parse(RestClient.get('www.themealdb.com/api/json/v1/1/random.php', headers={}))
            response = response['meals'][0]
            category_id = find_category(response['strCategory'])
            Recipe.create!(name: response['strMeal'], category_id: category_id,
                        instruction: response['strInstructions'], image: response['strMealThumb'])
        end
        render json: { recipes: Recipe.last}
    end

    private

    def find_category(category)
        if Category.where(name: category).exists?
            return Category.find_by(name: category).id
        else
            new = Category.create!(name: category)
            return new.id
        end
    end
end