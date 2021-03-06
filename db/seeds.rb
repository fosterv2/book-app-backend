# Books
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

# Users
10.times do
    name = Faker::Name.name
    User.create(
        name: name,
        username: Faker::Internet.username(specifier: name, separators: %w(. _ -)),
        password: Faker::Internet.password
    )
end

# Reviews
10.times do
    Review.create(
        rating: 5,
        title: "Good book",
        content: "",
        user: User.all.sample,
        book: Book.all.sample
    )
end

15.times do
    Review.create(
        rating: 4,
        title: "Decent book, I enjoyed it.",
        content: "",
        user: User.all.sample,
        book: Book.all.sample
    )
end

12.times do
    Review.create(
        rating: 3,
        title: "It was okay",
        content: "",
        user: User.all.sample,
        book: Book.all.sample
    )
end

5.times do
    Review.create(
        rating: 2,
        title: "Didn't like it, but some people might.",
        content: "",
        user: User.all.sample,
        book: Book.all.sample
    )
end

8.times do
    Review.create(
        rating: 1,
        title: "Disappointing",
        content: "",
        user: User.all.sample,
        book: Book.all.sample
    )
end

puts "SEEDED!"
