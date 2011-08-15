class Device
  include MongoMapper::Document

  key :deviceid, String, :required => true, :uniqueness => true
  key :name, String, :required => true
  key :description, String

  many :readings
end
