class AddJtiToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :jti, :string    # populate jti so we can make it not nullable
    Employee.all.each do |user|
      user.update_column(:jti, SecureRandom.uuid)
    end    
    change_column_null :employees, :jti, false
    add_index :employees, :jti, unique: true
  end
end