class CohortController < ApplicationController
  def view
    @cohort = Cohort.find(params[:id])
    render json: @cohort.as_json({include: :users}), callback: params['callback']
  end
end
