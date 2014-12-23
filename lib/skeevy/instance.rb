module Skeevy
  class Instance

    attr_reader :engine, :cutter

    def initialize(identifier:,
                   engine: Skeevy::Engines::File.new(base_dir: '/tmp'),
                   cutter: Skeevy::Cutters::StandardKey.new)
      raise(ArgumentError, "identifier must be a Symbol") unless identifier.is_a?(Symbol)
      raise(ArgumentError, "engine is not a Skeevy Engine!") unless engine.is_a?(Skeevy::Engine)
      raise(ArgumentError, "cutter is not a Skeevy Cutter!") unless cutter.is_a?(Skeevy::Cutter)
      @engine = engine
      @cutter = cutter
      @engine.instance = @cutter.instance = self
      @identifier = identifier
    end

    def key_for(id:, ns:, object: nil)
      @cutter.cut(id: id, ns: ns, object: object)
    end

    def read(id:, ns:, object:)
      @engine.read(id: id, ns: ns, object: object)
    end

    def write!(id:, ns:, object:)
      @engine.write!(id: id, ns: ns, object: object)
    end

    def exist?(id: id, ns: ns, object: object)
      @engine.exist?(id: id, ns: ns, object: object)
    end

    def delete!(id: id, ns: ns, object: object)
      @engine.delete!(id: id, ns: ns, object: object)
    end

  end
end