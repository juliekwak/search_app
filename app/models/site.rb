# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  validates_presence_of :name, :url
  validates_uniqueness_of :url
  has_many :pages
end
