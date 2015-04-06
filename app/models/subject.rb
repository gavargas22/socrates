class Subject < ActiveRecord::Base
	extend FriendlyId

	has_many :sections
	friendly_id :short_name, use: :slugged

end
