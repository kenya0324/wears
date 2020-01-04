class BrowsingHistoriesController < ApplicationController
	def index
		@browsing_histories = BrowsingHistory.all
	end
end
