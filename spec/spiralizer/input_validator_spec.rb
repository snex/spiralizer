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

      context 'input is an Array, sub-elements are not all Arrays' do
        let(:input) { %w[foo bar] }

        it 'raises an ArgumentError with "Only two dimensional arrays are'\
           'allowed" as the message' do
          expect { subject }.to raise_exception(
            ArgumentError,
            'Only two dimensional arrays are allowed'
          )
        end
      end

      context 'input is an Array of sub-Arrays, but not of equal sizes' do
        let(:input) { [%w[foo bar], %w[foo bar baz]] }

        it 'raises an ArgumentError with "Input is not a valid matrix"'\
           'as the message' do
          expect { subject }.to raise_exception(
            ArgumentError,
            'Input is not a valid matrix'
          )
        end
      end

      context 'input is a valid matrix, not all elements are single capital'\
              'letters' do
        let(:input) { [%w[foo bar], %w[foo bar]] }

        it 'raises an ArgumentError with "Input elements must be single'\
           'capital letters" as the message' do
          expect { subject }.to raise_exception(
            ArgumentError,
            'Input elements must be single capital letters'
          )
        end
      end
    end
  end
end
