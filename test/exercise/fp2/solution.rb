module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        first, *rest = self
        yield first
        self.class.new(rest).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&_block)
        my_reduce(self.class.new) do |acc, el|
          acc << (yield el)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(self.class.new) do |acc, el|
          el.nil? ? acc : acc << el
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        first, *rest = self
        acc = acc.nil? ? first : yield(acc, first)

        self.class.new(rest).my_reduce(acc, &block)
      end
    end
  end
end
