# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  skill1     :string(255)
#  skill2     :string(255)
#  skill3     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  person1    :string(255)
#  person2    :string(255)
#  person3    :string(255)
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
