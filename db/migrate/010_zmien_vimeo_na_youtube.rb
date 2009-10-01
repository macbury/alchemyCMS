class ZmienVimeoNaYoutube < ActiveRecord::Migration
  def self.up
    rename_column :wydarzenia, :vimeo_id, :youtube_id
    change_column :wydarzenia, :youtube_id, :string
  end

  def self.down
  end
end
