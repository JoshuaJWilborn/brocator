#!/usr/bin/env rake
# Add your own t`s in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Brocator::Application.load_tasks

task :send_messages => :environment do
  eventNames = EventUser.where(:notified => false).includes(:event, :user)
  eventNames.each do |eventUser|
    next if eventUser.notified == true
    next unless eventUser.event.date == (Date.today + 1)
    EventMailer.delay.notice_email(eventUser.user, eventUser.event).deliver
    eventUser.notified = true
    eventUser.save
  end
end
