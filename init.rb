# frozen_string_literal: true

# workaround helping rails to find the helper-methods
require File.join(File.dirname(__FILE__), 'app/helpers/application_helper.rb')

Redmine::Plugin.register :time_clock do
  name             'Time Clock plugin'
  author           'Jim McAleer'
  description      'This a Redmine plugin for user time allocation. This is independent of tasks assignments. Used to track a users clock in and clock out times.'
  url              'http://github.com/speedy32129/time_clock'
  author_url       'http://example.com/about'
  version          '0.0.1'

  # redmine version restriction information
  # This has not been test with any lower versions.
  requires_redmine :version_or_higher => '3.0.0'

  # settings information

  # permissions information

  # add link in user account menu
  #menu :account_menu, :global_issues, {:controller => 'time_clocks', :action => 'index'},
  #     :caption => "Time Clock",
  #     :first => true

  menu :account_menu, :time_clock_menu, "javascript:void(0)",
       {
           :caption => '',
           :html => {:id => 'punch-clock-menu'},
           :first => true #,
           #:param => :project_id,
           #:if => Proc.new {User.current.logged?}
       }

end