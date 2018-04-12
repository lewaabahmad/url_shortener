class RenameVanityUrlToVanityPathInShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    rename_column :shortened_urls, :vanity_url, :vanity_path
  end
end
