module Suggestions
  class SuggestFilms
    def initialize(user)
      @user = user
    end

    def votes(dimension)
      Rate.all.where(rater_id: @user, dimension: dimension)
    end

    def suggested_films(category)
      begin
        movies = movies_liked_by_user
        if movies.present?
          tag = most_interesting_tag(movies)
          best_in_category(tag, category)
        else
          []
        end
      rescue
        []
      end
    end

    private

    def most_interesting_tag(movies_liked_by_user)
      all_tags = movies_liked_by_user.map{|movie| movie.tags.pluck(:id)}.flatten
      max_tag = all_tags.max_by { |x| all_tags.count(x) }
      Tag.find(max_tag.to_i)
    end

    def movies_liked_by_user
      all_rates = Rate.all.where(rater_id: @user)
      all_rates.map{|rate| Movie.find(rate.rateable_id)}
    end

    def best_in_category(tag, category)
      movies = tag.movies
      movies.max_by{|movie| movie.average_rating(category)}
    end

  end
end