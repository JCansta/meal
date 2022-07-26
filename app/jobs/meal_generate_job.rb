class MealGenerateJob < ApplicationJob
    def perform
        50.times do
            response = JSON.parse(RestClient.get('www.themealdb.com/api/json/v1/1/random.php', headers={}))
            response = response['meals'][0]
            Recipe.create!(name: response['strMeal'], category: response['strCategory'],
                        instruction: response['strInstructions'], image: response['strMealThumb'])
        end
    end
end