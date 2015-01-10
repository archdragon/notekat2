class Notebook < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  validates :name, presence: true, length: { minimum: 1, maximum: 150 }
end