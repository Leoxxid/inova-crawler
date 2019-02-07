class QuotesController < ApplicationController
  before_action :set_search_tag

  def show
    render json: @search_tag.quotes
  end

  def set_search_tag
    @search_tag = SearchTag.find_by(name: 'Tag1')
  end
end
