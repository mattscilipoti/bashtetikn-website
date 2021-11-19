class Website < ApplicationRecord
  has_many :webpages, dependent: :destroy
  validates :name, presence: true
  validates :url, presence: true, url: { public_suffix: true }
end
