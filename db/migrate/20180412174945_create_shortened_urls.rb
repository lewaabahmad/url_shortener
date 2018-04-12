class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :vanity_url
      t.string :destination

      t.timestamps
    end
  end
end
