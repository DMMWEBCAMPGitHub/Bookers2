class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
   def change
    create_table :lists do |t|
      
      t.string :title
      t.text :body      
    end
  end
  
end
