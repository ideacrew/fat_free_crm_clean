class ConnectStreamsController < FatFreeCrm::ApplicationController
	before_action :authenticate_user!
	layout false, :only => [:connect]

  def connect
  end

	private

end
