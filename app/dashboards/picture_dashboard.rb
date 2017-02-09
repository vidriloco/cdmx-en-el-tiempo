require "administrate/base_dashboard"

class PictureDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tags: Field::HasMany,
    categories: Field::HasMany,
    user: Field::BelongsTo,
    disposition_on_landing_page: Field::Select.with_options(collection: ['portraits', 'wide', 'grid-sizer portrait']),
    id: Field::Number,
    title: Field::String,
    year: Field::Number,
    photo_taken_date: Field::DateTime,
    description: Field::Text,
    location: LocationField,
    image: PaperclipField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    list_of_tags: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :list_of_tags
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :list_of_tags,
    :user,
    :id,
    :year,
    :photo_taken_date,
    :description,
    :location,
    :image,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :categories,
    :user,
    :disposition_on_landing_page,
    :title,
    :year,
    :photo_taken_date,
    :description,
    :location,
    :image,
  ].freeze

  # Overwrite this method to customize how pictures are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(picture)
    picture.title
  end
end
