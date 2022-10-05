module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map{ |el| el.positive? ? array.max : el }
      end

      def search(_array, _query)
        0
      end
    end
  end
end