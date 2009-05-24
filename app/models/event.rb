class Event < ActiveRecord::Base

  has_many   :photos, :as => :attachable, :dependent => :destroy
  belongs_to :reference
 
  acts_as_textiled :column_left
  acts_as_textiled :column_center
  acts_as_textiled :column_right
  
  validates_presence_of   :name,
                          :message => 'Le nom de l\'actualité ne peut être vide'
  validates_presence_of   :date,
                          :message => 'La date de l\'actualité ne peut être vide'
  validates_presence_of   :kind,
                          :message => 'Le type de l\'actualité (inauguration ou concours gagné) ne peut être vide'
  validates_inclusion_of  :kind,
                          :in => %w( inauguration won_contest ),
                          :message => 'L\'actualité doit être une inauguration ou un concours gagné',
                          :unless => Proc.new { |event| event.kind.blank? }
                          
  def name_with_location
    "#{location_name}, #{name}"
  end

end
