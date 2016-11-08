class PagesController < ApplicationController
  require 'koala'
  require 'csv'

  def home
  end

  def query
    # TODO: Move this to a lib class
    @graph = Koala::Facebook::API.new(ENV['GRAPH_API_ACCESS_TOKEN'], ENV['GRAPH_API_APP_SECRET'])
    resulted_data = []

    if params[:page_id].present?
      params[:page_id].delete_if(&:blank?) # Removes empty strings, if any.
      params[:page_id].each do |page_id|
        page_feed = @graph.get_connections(page_id, 'feed', limit: params[:posts_limit])

        page_feed.each do |post|
          reactions = @graph.get_connections(post['id'], 'reactions')
          reactions.each do |reaction|
            resulted_data.push(user_id: reaction['id'], page_id: page_id, post_id: post['id'],
                               post_type: post['type'], interaction_type: 'reaction',
                               interaction_sub_type: reaction['type'])
          end

          comments = @graph.get_connections(post['id'], 'comments')
          comments.each do |comment|
            resulted_data.push(user_id: comment['from']['id'], page_id: page_id, post_id: post['id'],
                               post_type: post['type'], interaction_type: 'comment', interaction_sub_type: '')
          end
        end
      end
    end

    request.format = :csv if params[:csv]

    respond_to do |format|
      format.json { render json: { resulted_data: resulted_data } }
      format.csv { send_data(format_csv(resulted_data)) }
    end
  end

  private

  def format_csv(data)
    CSV.generate({}) do |csv|
      csv << data.first.keys # Adds the attributes name on the first line
      data.each do |hash|
        csv << hash.values
      end
    end
  end
end
