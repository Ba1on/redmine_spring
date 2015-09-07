module RedmineSpring
  module Patches
    module IssuePatch
    #include DataSender

      def self.included(base)
        base.send :include, DataSender

        base.class_eval do
        unloadable
        after_save :send_issue_spring_notification
        end

        def send_issue_spring_notification
          notification_parameters = { issue_id: id, #если смотреть класс Issue
                                      issue_subject: subject,
                                      estimated_hours: estimated_hours, #оценка трудозатрат
                                      status: status.name,
                                      object: 'issue'
          }
          send_spring_notification(notification_parameters)
        end
  
      end #self.included
    end
  end
end

unless Issue.included_modules.include?(RedmineSpring::Patches::IssuePatch)
  Issue.send(:include, RedmineSpring::Patches::IssuePatch)
end
