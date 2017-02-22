module Admin
  class PicturesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Picture.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Picture.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    
    def permitted_attributes
      [{:category_ids=>[]}, :user_id, :disposition_on_landing_page, :title, :year, :photo_taken_date, :description, :location_lat, :street_view_embed_url, :location_lng, :image]
    end
  end
end
