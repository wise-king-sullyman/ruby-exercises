require 'spec_helper'
require_relative '../exercises/nested_hash_exercises'

RSpec.describe 'Nested hash exercises' do
  describe 'add to nested hash exercise' do
    let(:hash) do
      {
        ruby: { initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false }
      }
    end

    it 'adds is_beautiful?: true k/v pair to the ruby nested hash' do
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false }
      }
      expect(add_to_nested_hash(hash, :ruby, :is_beautiful?, true)).to eq(expected_output)
    end

    it "adds initial_release: 'December 4, 1995', k/v pair to the javascript nested hash" do
      expected_output = {
        ruby: { initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
      expect(add_to_nested_hash(hash, :javascript, :initial_release, 'December 4, 1995')).to eq(expected_output)
    end
  end

  describe 'add nested hash exercise' do
    let(:hash) do
      {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
    end

    it 'adds a hash about java with the included kv pairs' do
      key_to_add = :java
      value_to_add = { is_beautiful?: false, initial_release: 'May 23, 1995' }
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' },
        java: { is_beautiful?: false, initial_release: 'May 23, 1995' }
      }
      expect(add_nested_hash(hash, key_to_add, value_to_add)).to eq(expected_output)
    end

    it 'adds a hash about python with the included kv pairs' do
      key_to_add = :python
      value_to_add = { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' },
        python: { is_beautiful?: false, initial_release: 'Feb 20, 1991' }
      }
      expect(add_nested_hash(hash, key_to_add, value_to_add)).to eq(expected_output)
    end
  end

  describe 'delete from nested hash exercise' do
    let(:hash) do
      {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
    end

    it 'removes the is_beautiful? k/v pair from the ruby nested hash' do
      expected_output = {
        ruby: { initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
      expect(delete_from_nested_hash(hash, :ruby, :is_beautiful?)).to eq(expected_output)
    end

    it 'removes the initial_release k/v pair from the javascript nested hash' do
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false }
      }
      expect(delete_from_nested_hash(hash, :javascript, :initial_release)).to eq(expected_output)
    end
  end

  describe 'delete nested hash' do
    let(:hash) do
      {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' },
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
    end

    it 'removes the ruby hash' do
      expected_output = {
        javascript: { is_beautiful?: false, initial_release: 'December 4, 1995' }
      }
      expect(delete_nested_hash(hash, :ruby)).to eq(expected_output)
    end

    it 'removes the javascript hash' do
      expected_output = {
        ruby: { is_beautiful?: true, initial_release: 'December 25, 1996' }
      }
      expect(delete_nested_hash(hash, :javascript)).to eq(expected_output)
    end
  end
end