class Setting
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String, default: 'Подорожник'
  field :description, type: String, default: 'СРОЧНАЯ ТЕХНИЧЕСКАЯ ПОМОЩЬ ЗА 20 МИНУТ'
  field :phone, default: '84951111111'
  field :whatsapp
  field :telegram
  field :viber

  field :seotitle, type: String, default: 'Подорожник'
  field :seodescription, type: String, default: 'СРОЧНАЯ ТЕХНИЧЕСКАЯ ПОМОЩЬ ЗА 20 МИНУТ'


  has_attachment :image, accept: [:jpg, :png, :gif]

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :phone, presence: true
  validates :seotitle, presence: true
  validates :seodescription, presence: true
end