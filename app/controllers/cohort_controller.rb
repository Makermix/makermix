class CohortController < ApplicationController
  def view
    if Cohort.exists?(params[:id])
      @cohort = Cohort.find(params[:id])
      render json: @cohort.as_json({include: :users}), callback: params['callback']
    else
      render_404
    end
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def list
    render json: Cohort.all
  end
end
