module RedmineSpring
  module Patches
    module IssuePatch

      def self.included(base)
        base.send :include, DataSender

        base.class_eval do
        unloadable
        after_save :send_issue_spring_notification
        end

        def send_issue_spring_notification
          notification_parameters = { issue_id: id, 
                                      issue_subject: subject,
                                      estimated_hours: estimated_hours, 
                                      status: status.name,
                                      object: 'issue'
          }
          send_spring_notification(notification_parameters)
        end
  
      end 
    end
  end
end

unless Issue.included_modules.include?(RedmineSpring::Patches::IssuePatch)
  Issue.send(:include, RedmineSpring::Patches::IssuePatch)
end
