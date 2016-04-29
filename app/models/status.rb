class Status < ActiveRecord::Base
	#dodaje property user našem objektu status
	belongs_to :user 

	#povezano s testom za postojanje statusa
	validates :content, presence: true,
						length: { minimum: 2}


	validates :user_id, presence: true
end
