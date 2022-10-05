module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |el| el.positive? ? array.max : el }
      end

      def search(array, query)
        return -1 if array.empty?

        split_idx = array.length / 2
        split_value = array[split_idx]

        case
        when query == split_value
          split_idx
        when query < split_value
          search(array.take(split_idx), query)
        when query > split_value
          idx_in_second_half = search(array.drop(split_idx + 1), query)
          return -1 if idx_in_second_half.negative?

          idx_in_second_half + (split_idx + 1)
        end
      end
    end
  end
end
