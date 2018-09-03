class Song < ActiveRecord::Base

validates :title, presence: true
validates :title, uniqueness: {
  scope: %i[release_year artist_name],
  message: 'cannot be repeated by the same artist in the same year'
}
validates :released, inclusion: { in: [true, false] }
validates :artist_name, presence: true

validates :release_year, presence: true, if: :released?
validates :release_year, presence: true, if: :not_yet_released?

   def released?
     released
   end

   def not_yet_released?
     release_year =< 2018
   end

end
