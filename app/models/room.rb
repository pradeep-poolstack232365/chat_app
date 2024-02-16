class Room < ApplicationRecord
	has_many :messages
	# validates_uniqueness_of :name 
	scope :public_rooms, -> {where(is_private: false) }
	after_create_commit { broadcast_append_to "rooms"}

	private

	def self.all_except(user)
	  where.not(id: user)
	end
end
 