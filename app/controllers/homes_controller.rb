class HomesController < ApplicationController
  def top
  end
  
  def about
    
  end
  
  def create
    super
    flash[:notice] = flash[:signed_out]
  end  

end
