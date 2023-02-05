class Profile < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :department, optional: true
  belongs_to :course, optional: true
  mount_uploader :image, ProfileUploader

  before_save :change_student_num_format

  def change_student_num_format
    self.student_num = self.student_num.upcase
  end
end