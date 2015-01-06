class Note < ActiveRecord::Base
  belongs_to :notebook
  has_paper_trail :meta => { :notebook_name => :notebook_name }
  acts_as_taggable

  def notebook_name
    self.notebook.name
  end

  #def self.for_user(user)
  #  self.includes(:notebook).where("notebooks.user_id" => user)
  #end
end