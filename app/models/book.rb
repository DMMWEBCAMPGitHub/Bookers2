class Book < ApplicationRecord
  
  def change
    create_table :lists do |t|
      
      t.int :avatar_image_id
      t.string :title
      t.text :body      
      t.timestamps
    end
  end
end
