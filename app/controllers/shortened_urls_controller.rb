class ShortenedUrlsController < ApplicationController

  def new
    @shortened_url = ShortenedUrl.new
  end

  def create 
    @shortened_url = ShortenedUrl.new shortened_url_params
    if @shortened_url.save 
      flash[ :success ] = 'Successfully created Shortened URL.'
      redirect_to @shortened_url
    else
      flash[ :alert ] = 'URL entered is invalid.'
      render :new
    end
  end

  def show
    @shortened_url = ShortenedUrl.find( params[:id] )
  end

  def visit
    @shortened_url = ShortenedUrl.find_by( vanity_path: params[:vanity_path] )
    if @shortened_url
      redirect_to @shortened_url.destination
    else
      flash[ :notice ] = 'Shortened URL does not exist'
      redirect_to '/'
    end
  end

  private

  def shortened_url_params
    params.require( :shortened_url ).permit( :destination )
  end

end
