class Status < ActiveRecord::Base
	#dodaje property user našem objektu status
	belongs_to :user 
end
