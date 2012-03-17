class Post < ActiveRecord::Base
  include SocialStream::Models::Object

  alias_attribute :text, :description
  validates_presence_of :text

  # Commented this since it is only use by Thinking Sphinx gem
  # See http://freelancing-god.github.com/ts/en/indexing.html
  #define_index do
  #  indexes activity_object.description
  #  has created_at
  #end

  def title
    description.truncate(30, :separator =>' ')
  end

end
