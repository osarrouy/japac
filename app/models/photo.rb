class Photo < ActiveRecord::Base

  belongs_to :attachable, :polymorphic => true

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 10.megabytes,
                 :resize_to => '800x650>',
                 :thumbnails => { :thumb => 'x90>', :small => '150x150>', :medium => '250x150>' }
  
  validates_as_attachment :error_formatters => { :size => :add_size_error,
                                                 :content_type => :add_content_type_error }

  validates_presence_of :filename,
                        :message => 'Le fichier attaché ne doit pas être vide'
   
  def add_size_error(options)
    return unless filename
    msg = "Le fichier attaché doit avoir une taille comprise entre 1 octet et 10 megaoctets"
    errors.add_to_base(msg)
  end
                        
  def add_content_type_error(options)
    return unless filename
    msg = "Le fichier attaché doit être une image"
    errors.add_to_base(msg)  
  end
                    
  def self.random(type)
    photos = []
    if(type == :event)
      photos = Photo.find(:all, :conditions => [ "attachable_type = ?", 'Event' ])
    elsif(type == :reference)
      photos = Photo.find(:all, :conditions => [ "attachable_type = ?", 'Reference' ])
    end
    photos.rand
  end

end
