class Contact < ActiveRecord::Base

  acts_as_textiled :team_left
  acts_as_textiled :team_center
  acts_as_textiled :team_right
  acts_as_textiled :hardware_left
  acts_as_textiled :hardware_center
  acts_as_textiled :hardware_right
  acts_as_textiled :contact

end
