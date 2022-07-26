class Api::V1::MealsController < ApplicationController
    before_action :authenticate
    def create
        1.times do
            response = JSON.parse(RestClient.get('www.themealdb.com/api/json/v1/1/random.php', headers={}))
            response = response['meals'][0]
            Recipe.create!(name: response['strMeal'], category: response['strCategory'],
                        instruction: response['strInstructions'], image: response['strMealThumb'])
        end
        #MealGenerateJob.perform
        render json: { recipes: Recipe.last}
    end
end