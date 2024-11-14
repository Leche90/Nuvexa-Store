# db/migrate/TIMESTAMP_add_cascade_delete_to_order_items.rb
class AddCascadeDeleteToOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :order_items, :products
    add_foreign_key :order_items, :products, on_delete: :cascade
  end
end
