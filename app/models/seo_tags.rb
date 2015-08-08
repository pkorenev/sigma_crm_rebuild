class SeoTags < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
end
