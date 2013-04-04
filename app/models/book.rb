class Book < ActiveRecord::Base
  # attributes
  attr_accessible :ISBN, :content, :name, :pages, :publishing_house, :tag_list, :author_list, :translator_list, :cover
  attr_accessor :tag_list, :author_list, :translator_list, :cover

  acts_as_taggable
  acts_as_taggable_on :tags, :authors, :translators

  # assocation
  has_many :resources, :dependent => :destroy
  has_one :attachment, :as => :attachmenttable, :dependent => :destroy

  # validation
  validates :name, :content, :presence => true

  # instance methods
  def cover_url
    attachment.try(:attachment).try(:url)
  end
end
