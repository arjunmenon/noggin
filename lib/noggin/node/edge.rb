module Noggin
  module Node
    class Edge

      attr_accessor :origin
      attr_accessor :dest
      attr_accessor :weight
      attr_accessor :derivative

      def initialize origin: origin, dest: dest, weight: rand(0.20...0.80)
        @origin = origin
        @dest = dest
        @weight = weight
      end

      def input
        origin.output
      end

      def value
        origin.output * weight
      end

      def derivative_chain
        @derivative = input * dest.derivative_chain
        @weight * dest.derivative_chain
      end

    end
  end
end