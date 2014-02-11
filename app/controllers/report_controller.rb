class ReportController < ApplicationController

	def index
           profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == params[:web_property_id]}
	   @results = Exits.results(profile, :filters => {:page_path.eql => '/'})	
	end
end

class Exits
  extend Garb::Model

  metrics  :visits, :pageviews, :unique_pageviews, :bounces, :exits
  dimensions :page_path
end

