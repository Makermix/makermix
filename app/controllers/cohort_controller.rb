class CohortController < ApplicationController
  def view
    @cohort = [{
                id: params[:id],
                name: 'March 2015',
                individuals: [{ name: 'james'},
                              { name: 'rich' }]
              }]
    render json: @cohort
  end
end
