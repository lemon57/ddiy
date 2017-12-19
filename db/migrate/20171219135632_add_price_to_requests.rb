class AddPriceToRequests < ActiveRecord::Migration[5.0]
  def change
    add_monetize :requests, :price, currency: { present: false }
  end
end
