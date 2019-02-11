require 'rails_helper'

RSpec.describe ScrapTagService, type: :service do
  describe '#perform' do
    context 'when pass a tag that is not in any quote' do
      it 'return 200 with a empty quote list' do
        quotes = ScrapTagService.new(tag: 'nonexistent tag').perform
        expect(quotes).to be_empty
      end
    end

    context 'when passing a existent tag' do
      it 'return 200 with a quote list' do
        quotes = ScrapTagService.new(tag: 'life').perform
        expect(quotes).not_to be_empty
      end
    end
  end
end
