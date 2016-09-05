# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :attachment do
    product nil
  end
end
