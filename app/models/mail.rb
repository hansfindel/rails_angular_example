class Mail < ActiveRecord::Base
	has_many :mail_users
	def self.dispatch_mails(params)
		text = params[:text]
		user_ids = params[:ids]
		if user_ids.class.to_s == "String"
			user_ids = user_ids.split(",")
		end
		mail = create(text: text)
		user_ids.each do |uid|
			mail.mail_users.create(user_id: uid)
		end
		mail 
	end
end
