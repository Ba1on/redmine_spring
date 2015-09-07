require 'redmine_spring'

Redmine::Plugin.register :redmine_spring do
  name 'Redmine Spring'
  author 'Dasha Balon'
  description 'This is a plugin for Redmine'
  version '0.0.1'
#  url 'https://github.com/petrovmp89/redmine-achiver'
  author_url 'https://github.com/Ba1on'
  settings default: { spring_url: 'http://spring.expamlpe.com/api/event/redmine' }, #?
           partial: 'settings/redmine_spring_settings'
end
