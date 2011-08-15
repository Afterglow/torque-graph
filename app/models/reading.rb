class Reading
  include MongoMapper::Document

  key :did, ObjectId, :required => true
  key :sid, String, :required => true
  key :s, ObjectId, :required => true
  key :v, Float, :required => true, :numericality => true

  belongs_to :device

end
