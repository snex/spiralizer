# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/spiralizer/mover'

RSpec.describe Spiralizer::Mover do
  subject { described_class.new(input) }

  describe '#cursor_element' do
    let(:input) { [%w[A B C], %w[D E F]] }

    it 'is the element at the cursor' do
      expect(subject.cursor_element).to eq('A')
      subject.move!
      expect(subject.cursor_element).to eq('B')
    end
  end

  describe '#move!' do
    let(:input) { [%w[A B C], %w[D E F]] }

    it 'tries to move the cursor down' do
      subject.instance_variable_set(:@cur_direction, :down)
      expect(subject).to receive(:move_down!)
      subject.move!
    end

    it 'tries to move the cursor left' do
      subject.instance_variable_set(:@cur_direction, :left)
      expect(subject).to receive(:move_left!)
      subject.move!
    end

    it 'tries the cursor right' do
      subject.instance_variable_set(:@cur_direction, :right)
      expect(subject).to receive(:move_right!)
      subject.move!
    end

    it 'tries to move the cursor up' do
      subject.instance_variable_set(:@cur_direction, :up)
      expect(subject).to receive(:move_up!)
      subject.move!
    end
  end
end
