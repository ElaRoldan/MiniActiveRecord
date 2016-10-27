require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end



chef1 = Chef.create(first_name: "Alain",last_name: "Ducasse",email: "alain@gmail.com",phone: "123456789",birthday: "1985-03-17")
assert chef1[:first_name] == 'Alain'
assert chef1[:last_name] == 'Ducasse'

chef2 = Chef.new({"first_name" => "Alexander", "last_name" => "Grahm", "email" => "grahm@gmail.com", "phone" => "123456789", "birthday" => "1985-03-17"})
#chef2 = Chef.new(first_name: "Alexander", last_name: "Grahm", email: "grahm@gmail.com", phone: "123456789", birthday: "1985-03-17", created_at: Time.now, updated_at: Time.now)
chef2.save
assert chef2[:first_name] == 'Alexander'

march_birthdays = Chef.where("'birthday' = '1985-03-17'")

Chef.all.count  

chef = Chef.find(22)

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
assert chef[:first_name] == 'Alexander'
assert chef[:last_name] == 'Grahm'




# first_name, :last_name, :email, :phone,
#                           :birthday, :created_at, :updated_at]
puts "finished"
