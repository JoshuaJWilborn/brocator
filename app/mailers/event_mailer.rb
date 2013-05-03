class EventMailer < ActionMailer::Base
  default from: "brocator@herokuapp.com"

	def notice_email(user, event)
		@user = user
		@event = event
		mail(:to => user.email, :subject => "#{event.title}, is tomorrow!")
	end
end
