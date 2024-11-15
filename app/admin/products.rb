ActiveAdmin.register Product do
  actions :all

  # Permitting parameters for create and update actions
  permit_params :name, :description, :price, :stock_quantity, :category_ids, images: []

  # Displaying columns in the index view
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :stock_quantity
    column :created_at
    column :images do |product|
      product.images.map { |img| image_tag(img, size: "50x50") }.join.html_safe
    end
    actions
  end

  # Filters for search functionality
  filter :name
  filter :price
  filter :created_at

  # Show page for viewing product details
  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :created_at
      row :updated_at
      row :categories do |product|
        product.categories.map(&:name).join(", ")
      end
      row :images do |product|
        if product.images.attached?
          product.images.map { |img| image_tag(img, size: "300x300") }.join.html_safe
        else
          "No images available"
        end
      end
    end
  end

  # Form for creating and editing products
  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price, min: 0
      f.input :stock_quantity
      f.input :categories, as: :check_boxes
    end

    f.inputs 'Product Images' do
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end

  # Custom logic for deleting a product
  member_action :destroy, method: :delete do
    resource.order_items.destroy_all         # Clears related order items
    resource.product_categories.destroy_all  # Clears related product_categories

    if resource.destroy
      flash[:notice] = "Product successfully deleted."
    else
      flash[:error] = "Failed to delete product."
    end
    redirect_to admin_products_path
  end
end
