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

class Attachment < ActiveRecord::Base
  belongs_to :product
  validates :file, attachment_presence: true

  has_attached_file :file, path: ":rails_root/archivos/:id/:style/:filename"

  do_not_validate_attachment_file_type :file
end
