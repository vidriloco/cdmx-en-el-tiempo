require "administrate/base_dashboard"

class SeoForPageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    page_identifier: Field::Select.with_options(collection: ['main-page', 'articles-index-page', 'popular-index-page', 'pictures-index-page']),
    title: Field::String,
    description: Field::Text,
    keywords: Field::String,
    image_url: Field::String,
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :page_identifier,
    :title,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :page_identifier,
    :title,
    :description,
    :keywords,
    :image_url,
    :url,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :page_identifier,
    :title,
    :description,
    :keywords,
    :image_url,
    :url,
  ].freeze

  # Overwrite this method to customize how seo for pages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(seo_for_page)
  #   "SeoForPage ##{seo_for_page.id}"
  # end
end
