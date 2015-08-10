# == Schema Information
#
# Table name: seo_tags
#
#  id            :integer          not null, primary key
#  resource_id   :integer
#  resource_type :string
#  title         :string
#  keywords      :text
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SeoTags < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
end
