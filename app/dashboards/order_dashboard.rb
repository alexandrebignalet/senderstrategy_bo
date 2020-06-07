require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    shipping_address: Field::BelongsTo.with_options(class_name: "Address"),
    billing_address: Field::BelongsTo.with_options(class_name: "Address"),
    products: Field::HasMany,
    id: Field::Number,
    id_distributors: Field::String,
    payment_method: Field::String,
    transaction_id: Field::String,
    transaction_mode: Field::String,
    transaction_state: Field::String,
    transaction_percent: Field::String,
    tva_reference: Field::String,
    import_url: Field::String,
    coupon: Field::String,
    amount: Field::String,
    god_father: Field::String,
    shipping_direct: Field::Boolean,
    is_shipped: Field::Boolean,
    how_known: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    shipping_address_id: Field::String,
    billing_address_id: Field::String,
    payment_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  shipping_address
  billing_address
  products
  id
  id_distributors
  payment_id
  payment_method
  transaction_id
  transaction_mode
  transaction_state
  transaction_percent
  tva_reference
  import_url
  coupon
  amount
  god_father
  shipping_direct
  is_shipped
  how_known
  created_at
  updated_at
  shipping_address_id
  billing_address_id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  shipping_address
  billing_address
  products
  id
  id_distributors
  payment_id
  payment_method
  transaction_id
  transaction_mode
  transaction_state
  transaction_percent
  tva_reference
  import_url
  coupon
  amount
  god_father
  shipping_direct
  is_shipped
  how_known
  created_at
  updated_at
  shipping_address_id
  billing_address_id
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  shipping_address
  billing_address
  products
  id_distributors
  payment_method
  transaction_id
  transaction_mode
  transaction_state
  transaction_percent
  tva_reference
  import_url
  coupon
  amount
  god_father
  shipping_direct
  is_shipped
  how_known
  shipping_address_id
  billing_address_id
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
