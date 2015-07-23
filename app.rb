require "mongoid"

class App
  def initialize
    environment = ENV['MONGOID_ENV'] || :development
    Mongoid.load!("mongoid.yml", environment)
  end

  class A
      include Mongoid::Document
      has_and_belongs_to_many :bs
  end

  class B
      include Mongoid::Document
      has_and_belongs_to_many :as
  end
end

