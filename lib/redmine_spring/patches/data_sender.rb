module RedmineSpring
  module Patches
    module DataSender

      def send_spring_notification(notification_parameters)
        uri = URI.parse(Setting.plugin_redmine_spring['spring_url'])
          
            Net::HTTP.new(uri.host, uri.port).start do |client|
              request                 = Net::HTTP::Post.new(uri.path)
              request.body            = notification_parameters.to_json
              request['Content-Type'] = 'application/json'
              client.request(request)
              end
          return true
      end
  
    end
  end
end