class ShortenedUrlsController < ApplicationController

  def new
    @shortened_url = ShortenedUrl.new
  end

  def create 
    @shortened_url = ShortenedUrl.new shortened_url_params
    if @shortened_url.save 
      redirect_to @shortened_url
    else
      render :new
    end
  end

  def show
    @shortened_url = ShortenedUrl.find( params[:id] )
  end

  private

  def shortened_url_params
    params.require( :shortened_url ).permit( :destination )
  end

end
