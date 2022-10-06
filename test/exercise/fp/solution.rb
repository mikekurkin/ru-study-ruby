module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        countries_count = ->(film) { film['country'].to_s.split(',').length }

        filtered_films =
          array
          .reduce([]) do |acc, film|
            countries_count.call(film) > 1 ? acc << film : acc
          end

        filtered_ratings =
          filtered_films
          .map { |film| film['rating_kinopoisk'].to_f }
          .reduce([]) do |acc, rating|
            rating.positive? ? acc << rating : acc
          end

        filtered_ratings.reduce(:+).to_f / filtered_ratings.length
      end

      def chars_count(films, threshold)
        filtered_films =
          films
          .reduce([]) do |acc, film|
            film['rating_kinopoisk'].to_f >= threshold ? acc << film : acc
          end

        filtered_films
          .map { |film| film['name'].to_s }
          .map { |name| name.count('и') }
          .reduce(:+)
      end
    end
  end
end
