require 'rails_helper'

RSpec.describe ScrapTagService, type: :service do
  describe '#call' do
    context 'when pass a tag that doesnt existe' do
      it 'return a nil object' do
        tag = ScrapTagService.new(tag: 'nonexistent-tag').call
        expect(tag).to be_nil
      end
    end

    context 'when passing a existent tag' do
      it 'return a search_tag' do
        tag = ScrapTagService.new(tag: 'life').call
        expect(tag).not_to be_nil
      end
    end
  end
end
