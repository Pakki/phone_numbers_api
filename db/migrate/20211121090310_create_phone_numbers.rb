class CreatePhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number, limit: 15, nulls: false, unique: true

      t.timestamps
    end
    add_index(:phone_numbers, [:number], unique: true)
  end
end
