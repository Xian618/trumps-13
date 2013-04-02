class GameController < ApplicationController
  require 'json'
  require 'net/http'

  def index
  	render :text => "index method"
  end

  def show
  	render :text => "show method"
  end

  def populate
  	meta_url = "http://data.gov.uk/api/2/rest/package/ni-112-under-18-conception-rate"
    meta_uri = URI(meta_url)
    meta_json = Net::HTTP.get(meta_uri)
    meta_hash = JSON.parse(meta_json)
    
    dataset_url = meta_hash["resources"][0]["url"]
    dataset_uri = URI(dataset_url)
    dataset = Net::HTTP.get(dataset_uri)
    render :text => dataset
  end
end
