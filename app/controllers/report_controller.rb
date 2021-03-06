

class ReportController < ApplicationController

	def index
           profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == params[:web_property_id]}
	   @results = Exits.results(profile, :filters => {:page_path.eql => '/'})
           
           @results.each do |res|
             @data = [res[:visits].to_i,res[:pageviews].to_i,res[:unique_pageviews].to_i,res[:bounces].to_i,res[:exits].to_i]  
           end
           @url = Gchart.pie(:size => '600x250', 
            :title => "Metric Comparison",
            :bg => 'ffffff',
            :legend => ['visits', 'pageviews', 'unique_pageviews', 'bounces', 'exits'],
            :bar_colors => ['AA0000','00AA00','0000AA','AAAA00','00AAAA'],
            :data => @data ) 	
	end
end

class Exits
  extend Garb::Model               
  metrics  :visits, :pageviews, :unique_pageviews, :bounces, :exits
  dimensions :page_path
end

