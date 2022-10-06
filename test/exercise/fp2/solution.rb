module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        if any?
          first, *rest = self
          yield first
          self.class.new(rest).my_each(&block)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        return self if empty?

        first, *rest = self
        mapped_first = yield first
        mapped_rest = self.class.new(rest).my_map(&block)

        self.class.new([mapped_first] + mapped_rest)
      end

      # Написать свою функцию my_compact
      def my_compact; end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
