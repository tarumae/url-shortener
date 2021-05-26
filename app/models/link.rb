class Link < ApplicationRecord
  belongs_to :user
  validates :long_link, presence: true
  validates :ling_link, format: { with: %r{(https?://(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www
                                \.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?://(?:www\.|(?!www))[a-zA-Z0-9]+\
                                .[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})},
                                  message: 'This does not appear to be a valid link' }
  validates :short_link, presence: true, uniqueness: true
end
