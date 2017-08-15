# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/spiralizer'

RSpec.describe Spiralizer do
  describe '#new' do
    subject { described_class.new([%w[A B C], %w[D E F]]) }
    let(:whiny_validator) { double(Spiralizer::InputValidator) }

    context 'input is invalid' do
      before do
        expect(whiny_validator).to receive(:validate!)
          .and_raise(ArgumentError, 'foo')
        expect(Spiralizer::InputValidator).to receive(:new)
          .and_return(whiny_validator)
      end

      it 'raises the error raised by InputValidator' do
        expect { subject }.to raise_exception(ArgumentError, 'foo')
      end
    end
  end

  describe '#spiralize' do
    subject do
      described_class.new([%w[A B C D], %w[E F G H], %w[I J K L]]).spiralize
    end

    it 'returns a string of the elements in lowercase and "spiral" order' do
      expect(subject).to eq('a b c d h l k j i e f g')
    end
  end
end
