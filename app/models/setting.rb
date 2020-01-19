class Setting
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String, default: 'Подорожник'
  field :description, type: String, default: 'СРОЧНАЯ ТЕХНИЧЕСКАЯ ПОМОЩЬ ЗА 20 МИНУТ'
  field :phone
  field :whatsapp
  field :telegram
  field :viber

  field :script

  has_attachment :image, accept: [:jpg, :png, :gif]

  validates :title, presence: true
  validates :description, presence: true
end