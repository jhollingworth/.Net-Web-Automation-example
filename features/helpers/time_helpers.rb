module TimeHelpers
  require 'chronic'
  
  def parse(date)
    Chronic.parse(date).strftime("%m/%d/%Y")
  end

end

World TimeHelpers