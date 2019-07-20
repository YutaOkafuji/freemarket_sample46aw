module ItemsHelper
  def zipcode(user)
    "〒 #{user.delivery_address.zip_code}"
  end
  def address(user)
    "#{user.delivery_address.prefecture.name+user.delivery_address.city+user.delivery_address.street_number+user.delivery_address.building}"
  end
end
