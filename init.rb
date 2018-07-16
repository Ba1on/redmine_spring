require 'redmine_spring'

Redmine::Plugin.register :redmine_spring do
  name 'Redmine Spring'
  author 'Kodep'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  author_url 'https://github.com/kodep'
  settings default: { spring_url: 'http://spring.expamlpe.com/api/event/redmine' }, #?
           partial: 'settings/redmine_spring_settings'
end
