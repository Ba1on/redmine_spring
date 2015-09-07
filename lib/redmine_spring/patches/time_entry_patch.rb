module RedmineSpring
  module Patches
    module TimeEntryPatch
   # include DataSender

      def self.included(base)
        base.send :include, DataSender

        base.class_eval do
        unloadable
        after_save :send_hours_spring_notification
        end
      
        def send_hours_spring_notification
          notification_parameters = { time_entry_id: id,
                                      issue_id: issue_id,
                                      hours: hours,
                                      # чтоб было 
                                      #sum_time_entries: issue.time_entries.sum(:hours),
                                      object: 'time entry'
          }
          send_spring_notification(notification_parameters)
        end

      end #self.included
    end
  end
end

unless TimeEntry.included_modules.include?(RedmineSpring::Patches::TimeEntryPatch)
  TimeEntry.send(:include, RedmineSpring::Patches::TimeEntryPatch)
end
