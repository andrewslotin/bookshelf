class Author < ActiveRecord::Base
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
