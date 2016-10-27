class Chef < MiniActiveRecord::Model
  
  self.attribute_names = [:id, :first_name, :last_name, :email, :phone,
                          :birthday, :created_at, :updated_at]

  #attr_reader :attributes, :old_attributes


  def meals
    Meal.where('chef_id = ?', self[:id])
  end

  def add_meals(meals)
    meals_aray = meals.to_a
    meals_array.each do |meal|
      meal.chef = self
    end

    meals_array
  end


  # private

  # def insert!
  #   self[:created_at] = DateTime.now
  #   self[:updated_at] = DateTime.now

  #   fields = self.attributes.keys
  #   values = self.attributes.values
  #   marks  = Array.new(fields.length) { '?' }.join(',')

  #   insert_sql = "INSERT INTO chefs (#{fields.join(',')}) VALUES (#{marks})"

  #   results = MiniActiveRecord::Model.execute(insert_sql, *values)

  #   # This fetches the new primary key and updates this instance
  #   self[:id] = MiniActiveRecord::Model.last_insert_row_id
  #   results
  # end

  def update!
    self[:updated_at] = DateTime.now

    fields = self.attributes.keys
    values = self.attributes.values

    update_clause = fields.map { |field| "#{field} = ?" }.join(',')
    update_sql = "UPDATE chefs SET #{update_clause} WHERE id = ?"

    # We have to use the (potentially) old ID attribute in case the user has re-set it.
    MiniActiveRecord::Model.execute(update_sql, *values, self.old_attributes[:id])
  end
end
