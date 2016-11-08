class PagesController < ApplicationController
  require 'csv'

  def home
  end

  def query
    resulted_data = []

    if params[:page_id].present?
      fb_interactions = Fb::Inspector::Interactions.new(params[:page_id], params[:posts_limit])
      resulted_data = fb_interactions.get_interactions
    end

    request.format = :csv if params[:csv]

    respond_to do |format|
      format.json { render json: { resulted_data: resulted_data } }
      format.csv { send_data(format_csv(resulted_data)) }
    end
  end

  private

  def format_csv(data)
    return if data.empty?

    csv_file = CSV.generate({}) do |csv|
      csv << data.first.keys # Adds the attributes name on the first line
      data.each do |hash|
        csv << hash.values
      end
    end
  end
end
