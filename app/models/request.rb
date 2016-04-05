require 'data_mapper'
require 'dm-postgres-adapter'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date

  belongs_to :space
  belongs_to :user

end
