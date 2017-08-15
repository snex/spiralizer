# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/spiralizer/input_validator'

RSpec.describe Spiralizer::InputValidator do
  describe '#new' do
    subject { described_class.new(input) }

    context 'valid input' do
      let(:input) { [%w[A B], %w[C D]] }

      it 'does not raise any exception' do
        expect { subject }.not_to raise_exception
      end
    end

    context 'invalid input' do
      context 'input is not an Array' do
        let(:input) { 'foo' }

        it 'raises an ArgumentError with "Only two dimensional arrays are'\
           'allowed" as the message' do
          expect { subject }.to raise_exception(
            ArgumentError,
            'Only two dimensional arrays are allowed'
          )
        end
      end
    end
  end
end
