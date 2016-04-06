require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, String

  has n, :requests

end
