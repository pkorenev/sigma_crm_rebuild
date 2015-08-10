# == Schema Information
#
# Table name: assets
#
#  id                   :integer          not null, primary key
#  assetable_id         :integer
#  assetable_type       :string
#  assetable_field_name :string
#  data_file_name       :string
#  data_content_type    :string
#  data_file_size       :integer
#  data_updated_at      :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
