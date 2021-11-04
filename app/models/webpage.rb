class Webpage < ApplicationRecord
  validates :url, presence: true, url: { public_suffix: true }
end
