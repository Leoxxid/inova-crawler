# frozen_string_literal: true

# QuotesController
class QuotesController < ApplicationController
  before_action :set_search_tag
  before_action :set_tag
  before_action :destroy_tag, if: -> { params[:'clean-cache'] && @tag }

  def show
    if @tag
      render json: @tag.quotes
    else
      @tag = ScrapTagService.new(tag: @search_tag, pages: params[:pages]).call
      if @tag
        render json: @tag.quotes
      else
        render json: { not_found: "Don't found quotes with #{@search_tag} tag" }
      end
    end
  end

  private

  def set_search_tag
    @search_tag = params[:search_tag]
  end

  def set_tag
    @tag = SearchTag.where(name: @search_tag).first
  end

  def destroy_tag
    @tag.destroy
    @tag = nil
  end
end
