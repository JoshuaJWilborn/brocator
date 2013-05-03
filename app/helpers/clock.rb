require 'clockwork'
include Clockwork

handler do |job|
  enqueue_your_job(job)
end

every(1.day, 'Send Event Mails', :at => '08:00') {
	`rake send_messages`
}
