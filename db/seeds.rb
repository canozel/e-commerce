# USERS
user = FactoryGirl.create(:user_with_addresses, email: 'customer@example.com')
admin_user = FactoryGirl.create(:admin)

# CATEGORIES AND PRODUCTS
4.times do |i|
  category = FactoryGirl.create(:category, title: "Pipe #{i+1}")
  category.title_tr = "Pipo #{i+1}"
  category.title_de = "Rohr #{i+1}"
  category.title_ru = "труба #{i+1}"
  category.save

  rand(2..6).times do |int|
    category.products << FactoryGirl.create(:product, category: category)
  end
end

# SHIPMENTS
shipment1 = FactoryGirl.create(:shipment, provider: 'Aras', title: 'Aras Kargo', fee: 0, default: true)
shipment1.title_de = "Aras Kargo"
shipment1.title_ru = "Aras Kargo"
shipment1.save

shipment2 = FactoryGirl.create(:shipment, provider: 'MNG', title: 'MNG Kargo', fee: 6.99, default: false)
shipment2.title_de = "MNG Kargo"
shipment2.title_ru = "MNG Kargo"
shipment2.save

shipment3 = FactoryGirl.create(:shipment, provider: 'Yurtiçi', title: 'Yurtiçi Kargo', fee: 5.99, default: false)
shipment3.title_de = "Yurtiçi Kargo"
shipment3.title_ru = "Yurtiçi Kargo"
shipment3.save

# PAYMENTS
payment1 = FactoryGirl.create(:payment, title: 'Kredi Kartı')
payment1.title_de = "Kreditkarte"
payment1.title_ru = "Кредитная карта"
payment1.save

payment2 = FactoryGirl.create(:payment, title: 'Payment at pickup')
payment2.title_de = "Bezahlung bei Abholung"
payment2.title_ru = "Оплата при получении"
payment2.save

payment3 = FactoryGirl.create(:payment, title: 'Bank transfer')
payment3.title_de = "Banküberweisung"
payment3.title_ru = "Банковский перевод"
payment3.save

# ORDERS
FactoryGirl.create(:order, user: user, address: user.addresses.first, shipment: shipment1, status: 'shipped')
