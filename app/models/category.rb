class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :division, type: String

  has_many :users
end
