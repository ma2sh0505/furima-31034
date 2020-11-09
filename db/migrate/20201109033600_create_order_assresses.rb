class CreateOrderAssresses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_assresses do |t|

      t.timestamps
    end
  end
end
