require 'minitest/autorun'
require './app'

class AppTest < MiniTest::Test
  describe App do
    before(:each) do
      @app = App.new
      @a = App::A.create
      @b = App::B.create
    end

    it "sets the relations ids correctly" do
      @a.bs = [@b]
      @a.reload.b_ids.must_equal [@b.id]
      @b.reload.a_ids.must_equal [@a.id]
    end

    it "sets the relations ids correctly even when overwriting the relationship with the same value" do
      @a.bs = [@b]
      @a.bs = [@b]
      @a.reload.b_ids.must_equal [@b.id]
      @b.reload.a_ids.must_equal [@a.id]

      @a.bs = [@b]
      @a.reload.b_ids.must_equal [@b.id]
      @b.reload.a_ids.must_equal [@a.id]
    end
  end
end
