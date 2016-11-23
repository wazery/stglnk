class PagesController < ApplicationController
  def home
  end

  def query
    interactions = []

    if params[:page_ids].present?
      interactions = Xystra::Interactions.new(params[:page_ids], params[:posts_limit])
    end

    request.format = :csv if params[:csv]

    respond_to do |format|
      format.json { render json: interactions }
      format.csv { render csv: interactions, filename: 'interactions' }
    end
  end
end
