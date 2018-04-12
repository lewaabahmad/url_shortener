class ShortenedUrl < ApplicationRecord

  validates :destination, url: { allow_blank: false }

end
