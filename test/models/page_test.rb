# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  image      :string           default([]), is an Array
#  body       :text
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
