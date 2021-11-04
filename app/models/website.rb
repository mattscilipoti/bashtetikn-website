class Website < ApplicationRecord
    validates :name, presence: true
    validates :url, presence: true, url: { public_suffix: true }
end
