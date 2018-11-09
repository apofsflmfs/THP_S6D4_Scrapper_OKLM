class HomeController < ApplicationController
  
  def index
    @crypto = Crypto.new
    unless Crypto.first
      self.update
    end 
    @time = Crypto.first.updated_at
  end


  def update
    CryptoScrapper.new("https://coinmarketcap.com/all/views/all/").perform
    flash[:success] = "MAJ bien effectuée !"
    redirect_to '/'
  end

  def show
    @crypto = Crypto.find(params[:crypto][:id])
    @time = Crypto.first.updated_at
    
    render 'index'
  end 


end
