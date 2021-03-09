class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @organisations.geocoded.map do |organisation|
      {
        lat: organisation.latitude,
        lng: organisation.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { organisation: organisation })

        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end
end
