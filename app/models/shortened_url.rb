class ShortenedUrl < ApplicationRecord

  validates :destination, url: { allow_blank: false }

  after_create :create_vanity_path

  def vanity_url
    # app root should be env var
    "http://localhost:3000/#{ vanity_path }"
  end

  def create_vanity_path 
    proposed_vanity_path = SecureRandom.hex(3)
    if !ShortenedUrl.find_by( vanity_path: proposed_vanity_path )
      self.vanity_path = proposed_vanity_path
      self.save
    else
      create_vanity_path
    end
  end
end
