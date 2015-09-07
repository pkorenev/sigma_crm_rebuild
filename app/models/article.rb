class Article < ActiveRecord::Base
  attr_accessible *attribute_names

  has_attachments multiple: false
end
