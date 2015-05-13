class CohortController < ApplicationController
  def view
    render json: "Hello world, you asked to view cohort with id #{params[:id]}"
  end
end
