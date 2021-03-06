module Skeevy
  module Cutters
    class StandardKey
      include Skeevy::Cutter

      def cut(hash:, ns:, object: nil)
        object ||= ''
        hash   ||= ''
        ns     ||= ''
        raise ArgumentError, "Hash and namespace may not be blank" if hash.empty? || ns.empty?
        raise ArgumentError, "#{object} contains an instance of delimiter: #{@delimiter}" if object.include?(@delimiter)
        prefix ="#{@prefix}#{@delimiter}" unless @prefix.nil?
        key = "#{ns}#{@delimiter}#{hash}"
        suffix = "#{@delimiter}#{object}" unless object == ''
        "#{prefix}#{key}#{suffix}"
      end

    end
  end
end