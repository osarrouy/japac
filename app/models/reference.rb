class Reference < ActiveRecord::Base
  
  has_many    :photos, :as => :attachable, :dependent => :destroy
  belongs_to  :location, :dependent => :destroy
  
  acts_as_mappable :through => :location

  acts_as_textiled :column_left
  acts_as_textiled :column_center
  acts_as_textiled :column_right
  
  validates_presence_of :name, :message => 'Le nom de la référence ne peut être vide'
  validates_presence_of :location, :message => 'La localisation de la référence ne peut être vide'
  
  def name_with_location
    "#{location.name}, #{name}"
  end

end
