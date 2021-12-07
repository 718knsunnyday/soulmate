class Farm < ApplicationRecord
  attachment :image
  
  def full_address
    '〒' + post_code + ' ' + prefecture + ' ' + city + ' ' + house_number
  end
end