require 'rails_helper'

RSpec.describe ScrapTagService, type: :service do
  describe '#call' do
    context 'when pass a tag that that doesnt existe' do
      it 'return 200 with a empty quote list' do
        quotes = ScrapTagService.new(tag: 'nonexistent-tag').call
        expect(quotes).to be_empty
      end
    end

    context 'when passing a existent tag' do
      it 'return 200 with a quote list' do
        quotes = ScrapTagService.new(tag: 'life').call
        expect(quotes).not_to be_empty
      end
    end
  end
end
