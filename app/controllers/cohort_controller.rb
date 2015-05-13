class CohortController < ApplicationController
  def view
    @cohort = Cohort.find(params[:id])
    render json: @cohort
  end
end
