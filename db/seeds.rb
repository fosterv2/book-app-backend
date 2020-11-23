# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

api_data = RestClient.get('https://www.googleapis.com/books/v1/volumes?q=bundo')
book_data = JSON.parse(api_data)["items"]

10.times do
    book = book_data.shift["volumeInfo"]
    Book.create(
        name: book["title"],
        author_name: book["authors"] ? book["authors"][0] : "None",
        img_url: book["imageLinks"]["thumbnail"]
    )
end
