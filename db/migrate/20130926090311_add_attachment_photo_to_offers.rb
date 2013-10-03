class AddAttachmentPhotoToOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :offers, :photo
  end
end
