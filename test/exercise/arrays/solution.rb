module Exercise
  module Arrays
    class << self
      def max_val(array)
        return nil if array.empty?
        return array.first if array.one?

        first, *rest = array
        max_of_rest = max_val(rest)

        first > max_of_rest ? first : max_of_rest
      end

      def replace(array)
        array.map { |el| el.positive? ? max_val(array) : el }
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
