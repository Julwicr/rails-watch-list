require 'open-uri'
require 'json'

Movie.destroy_all
# API get 20 top rated, pages not workin
fetch = URI.open('https://api.themoviedb.org/3/movie/top_rated?api_key=9675f57ec8e4ec9e8650bbbe714800cf').read
json = JSON.parse(fetch)
movies = json['results']
movies.each do |movie|
  new_movie = Movie.create(
                title: movie['title'],
                overview: movie['overview'],
                poster_url: movie['poster_path']
              )
  puts new_movie.title
end

# Get most popular
def getpopular(x)
  fetch = URI.open("https://api.themoviedb.org/3/movie/popular?api_key=9675f57ec8e4ec9e8650bbbe714800cf&page50&language=en-US&page=#{x}").read
  json = JSON.parse(fetch)
  movies = json['results']
  movies.each do |movie|
    new_movie = Movie.create(
                  title: movie['title'],
                  overview: movie['overview'],
                  poster_url: movie['poster_path']
                )
    puts new_movie.title
  end
end
range = (1..5)
range.each do |x|
  getpopular(x)
end
