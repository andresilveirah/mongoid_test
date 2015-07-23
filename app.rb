require "mongoid"

class App
  def initialize
    environment = ENV['MONGOID_ENV'] || :development
    Mongoid.load!("mongoid.yml", environment)
  end

  class A
      include Mongoid::Document
      has_and_belongs_to_many :bs, inverse_of: :as
  end

  class B
      include Mongoid::Document
      has_and_belongs_to_many :as, inverse_of: :bs
  end
end

