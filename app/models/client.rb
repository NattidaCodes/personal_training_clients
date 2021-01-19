class Client < ActiveRecord::Base
    belongs_to :user 
    validates :name, :age, :gender, :weight, presence: true
    
end