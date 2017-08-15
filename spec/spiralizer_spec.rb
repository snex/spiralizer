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
      described_class.new(
        [%w[A B C D E F],
         %w[G H I J K L],
         %w[M N O P Q R],
         %w[S T U V W X]]
      ).spiralize
    end

    it 'returns a string of the elements in lowercase and "spiral" order' do
      expect(subject).to eq('a b c d e f l r x w v u t s m g h i j k q p o n')
    end

    context 'a letter is duplicated' do
      subject do
        described_class.new([%w[A B C D], %w[E F G H], %w[I J K A]]).spiralize
      end

      it 'returns a string of the elements in lowercase and "spiral" order' do
        expect(subject).to eq('a b c d h a k j i e f g')
      end
    end
  end
end
