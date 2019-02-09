# frozen_string_literal: true

# QuotesController
class QuotesController < ApplicationController
  before_action :set_search_tag

  def show
    unless @search_tag
    end
    render json: @search_tag.quotes
  end

  def set_search_tag
    @search_tag = SearchTag.where(name: 'Tag1').first
  end
end
