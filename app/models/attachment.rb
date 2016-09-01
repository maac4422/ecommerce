class Attachment < ActiveRecord::Base
  belongs_to :product
  validates :file, attachment_presence: true

  has_attached_file :file, path: ":rails:root/archivos/:id/:style/:filename"

  do_not_validate_attachment_file_type :file
end
