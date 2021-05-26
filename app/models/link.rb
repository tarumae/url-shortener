class Link < ApplicationRecord
  belongs_to :user
  validates :long_link, presence: true
  # The formatting regex was taken off stackoverflow and is unfortunately not my creation. Maybe one day.
  validates :long_link, format: { with: %r{(https?://(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www
                                \.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?://(?:www\.|(?!www))[a-zA-Z0-9]+\
                                .[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})},
                                  message: 'This does not appear to be a valid link. Please try again.' }
  validates :short_link, presence: true, uniqueness: true
  validates :user, presence: true
end
