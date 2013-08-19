class Language < ActiveRecord::Base
  attr_accessible :file_extension, :name

  validates :name, presence:true, uniqueness: true
  validates :file_extension, presence:true, uniqueness: true
end
