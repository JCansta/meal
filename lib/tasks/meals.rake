desc 'Llama a la api de Free Meal Api y genera 50 recetas con los endpoints. Si la categoria en estas recetas no existe, las crea'

task :meals => :environment do
    50.times do
        response = JSON.parse(RestClient.get('www.themealdb.com/api/json/v1/1/random.php', headers={}))
        response = response['meals'][0]
        category_id = find_category(response['strCategory'])
        Recipe.create!(name: response['strMeal'], category_id: category_id,
                    instruction: response['strInstructions'], image: response['strMealThumb'])
    end
end

private
    
    def find_category(category)
        if Category.where(name: category).exists?
            return Category.find_by(name: category).id
        else
            category_id = Category.create!(name: category)
            return category_id.id
        end
    end