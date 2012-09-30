class HopeController < ApplicationController
  
  def about
    if request.url != hope_about_url
      redirect_to hope_about_url
    end
  end

  def programs
  end

  def resources
  end

  def faq
  end

end
