class Validation < ApplicationRecord
  belongs_to :webpage, optional: true
  validates :url, presence: true, url: { public_suffix: true }
end
