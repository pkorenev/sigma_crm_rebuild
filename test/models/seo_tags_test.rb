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

require 'test_helper'

class SeoTagsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
