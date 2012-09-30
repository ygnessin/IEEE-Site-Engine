class IndustryController < ApplicationController

  def information
    if request.url != industry_information_url
      redirect_to industry_information_url
    end
  end

  def sponsors
  end  
  
  def donate
  end

end
