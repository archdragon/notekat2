class Note < ActiveRecord::Base
  belongs_to :notebook
  has_paper_trail
  acts_as_taggable
end