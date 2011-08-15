class Sensor
  include MongoMapper::Document

  key :code, String, :required => true
  key :description, String
  key :min, Float, :required => true, :numericality => true
  key :max, Float, :required => true, :numericality => true
  key :unit, String, :required => true

  many :readings
end
