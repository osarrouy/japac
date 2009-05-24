class Publication < ActiveRecord::Base

  has_attachment  :storage => :file_system,
                  :max_size => 10.megabytes
                  
  acts_as_textiled :description
                  
  named_scope :recent, :order => "date DESC", :limit => 6
  
  validates_as_attachment :error_formatters => { :size => :add_size_error }
  
  validates_presence_of :name,
                        :message => 'Le nom de la publication ne peut être vide'
  
  validates_presence_of :filename,
                        :message => 'Le fichier attaché ne doit pas être vide'
   
  def add_size_error(options)
    return unless filename
    msg = "Le fichier attaché doit avoir une taille comprise entre 1 octet et 10 megaoctets"
    errors.add_to_base(msg)
  end
    
end
