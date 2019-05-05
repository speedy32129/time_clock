class TimeClocksController < ApplicationController

  unloadable

  def index

  end

  def start

  end

  def stop
    #defines the top action
    #redirect_to_new_time_entry = ''
    #redirect_to controller: 'issues',
    #            protocol: Setting.protocol,
    #            action: 'edit',
    #            id: issue_id,
    #            time_entry: { hours: hours }
  end

end
