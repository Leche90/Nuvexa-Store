ActiveAdmin.register Product do
    # Permitting parameters for create and update actions
    permit_params :name, :description, :price, :stock_quantity, :category_ids
  
    # Displaying columns in the index view
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :price
      column :stock_quantity
      column :created_at
      actions
    end
  
    # Filters for search functionality
    filter :name
    filter :price
    filter :created_at
  
    # Form for creating and editing products
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :price, min: 0
        f.input :stock_quantity
        f.input :categories, as: :check_boxes
      end
      f.actions
    end
  end
  