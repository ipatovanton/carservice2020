class Service
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :description, type: String
  field :backgroundcolor, type: String, default: 'grey-theme'
  field :position, type: Integer, default: 0

  has_attachment :image, accept: [:jpg, :png, :gif]
  
  belongs_to :user, touch: true

  has_many :items


  before_validation :save_position
  validates :user_id, presence: true
  validates :title, presence: true

  private
    def save_position
      self.position = (self._index + 1) if self.new_record? and self._index
    end
end