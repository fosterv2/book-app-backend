# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

api_data_1 = RestClient.get('https://www.googleapis.com/books/v1/volumes?q=inauthor:madeleine+l%27engle')
book_data = JSON.parse(api_data_1)["items"]
api_data_2 = RestClient.get('https://www.googleapis.com/books/v1/volumes?q=inauthor:rowling')
book_data += JSON.parse(api_data_2)["items"]
api_data_3 = RestClient.get('https://www.googleapis.com/books/v1/volumes?q=inauthor:seuss')
book_data += JSON.parse(api_data_3)["items"]

book_data.each do |bk|
    book = bk["volumeInfo"]
    Book.create(
        title: book["title"],
        author_name: book["authors"] ? book["authors"][0] : "None",
        img_url: book["imageLinks"] ? book["imageLinks"]["thumbnail"] : "none",
        blurb: book["description"]
    )
end

10.times do
    name = Faker::Name.name
    User.create(
        name: name,
        username: Faker::Internet.username(specifier: name, separators: %w(. _ -)),
        password: Faker::Internet.password
    )
end
