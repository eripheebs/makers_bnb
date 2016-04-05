require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, String

  has n, :requests

  # def start_time
  #   self.my_related_model.start 
  # end

end
