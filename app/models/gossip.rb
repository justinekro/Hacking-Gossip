class Gossip < ApplicationRecord
	belongs_to :user
	validates :content, presence: true

	searchkick word_middle: [:content]

	def search_data 
		{
			content: content
		}
	end

end
