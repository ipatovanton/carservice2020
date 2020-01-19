class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :price, type: String

  belongs_to :service, touch: true

  validates :service_id, presence: true
  validates :title, presence: true
end