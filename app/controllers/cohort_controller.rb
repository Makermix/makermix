class CohortController < ApplicationController
  def view
    @cohort = Cohort.find(params[:id])
    render json: @cohort.to_json, callback: params['callback']
  end
end
