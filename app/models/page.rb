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

class Page < ActiveRecord::Base
  validates_presence_of :title, :url
  belongs_to :site
end
