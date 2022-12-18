class Document < ApplicationRecord
  belongs_to :user
  belongs_to :loan, optional: true

  has_one_attached :upload
end
