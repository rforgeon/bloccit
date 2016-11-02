class WelcomeController < ApplicationController

  helper_method :get_link_info
  helper_method :strip_link_id

  def index
  end

  def about
  end

  def get_link_info(link)
    link_obj = LinkThumbnailer.generate(link)
    return link_obj
  end

  def strip_link_id(link)
    link.reverse!
    if link.include? '='
      codeArray = link.split('=',2)
    else
      codeArray = link.split('/',2)
    end
    code = codeArray[0]
    code.reverse!
    return code
  end

end
