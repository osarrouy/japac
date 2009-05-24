class Location < ActiveRecord::Base

  acts_as_mappable :auto_geocode => { :field => :full_address, :error_message => "L'addresse ne peut être géocodée" }

  has_one :reference
  
  before_update :geocode_address
  
  validates_presence_of :name, :message => 'Le nom de la localisation ne peut être vide'
  validates_presence_of :full_address, :message => 'L\'adresse de la localisation ne peut être vide'
  
  private
  
  def geocode_address
    geo = Geokit::Geocoders::MultiGeocoder.geocode(self.full_address)
    if geo.success
      self.lat, self.lng = geo.lat, geo.lng 
    else
      errors.add(:location, "L'addresse ne peut être géocodée")
    end
  end

end
