require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  describe '#show' do
    before(:each) do
      set_api_headers
    end

    context 'when pass a search_tag that doesnt existe' do
      it "return 200 with don't found message" do
        get :show, params: { search_tag: 'nonexistent-tag' }

        expect(response).to have_http_status(:ok)
        expect(json_body['not_found']).to match("Don't found quotes")
      end
    end

    context 'when pass a existent search_tag' do
      it 'return 200 with quote list' do
        get :show, params: { search_tag: 'love' }

        expect(response).to have_http_status(:ok)
        expect(json_body['quotes'].count).to be > 0
      end
    end

    context 'when pass a existent search_tag specifing number of pages' do
      it 'return 200 with quote list' do
        get :show, params: { search_tag: 'love', pages: 2 }

        expect(response).to have_http_status(:ok)
        expect(json_body['quotes'].count).to be > 10
      end
    end
  end
end
