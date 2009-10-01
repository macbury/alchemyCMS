class CreateAdminKomentarze < ActiveRecord::Migration
  def self.up
    create_table :admin_komentarze do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_komentarze
  end
end
