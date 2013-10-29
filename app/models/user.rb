class User < ActiveRecord::Base
	def fullname
		#for angular filter purposes
		[self.name, self.last_name].join(" ")
	end
end
