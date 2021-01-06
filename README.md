# Love-Books-Backend

An app for everyone who loves books.

This project was started with [Rails New](https://guides.rubyonrails.org/command_line.html).

Running this project requires the use of the [frontend repository](https://github.com/fosterv2/book-app).

The Love-Books-App is deployed through Heroku [here](https://love-books-app.herokuapp.com/).

## Getting Started

To use this app you should fork and clone this repository and the the backend repository

## Prerequisites

To run this project you have to have rails and node installed on your computer

## Installing

### back-end

To get the back-end running, you should run all of these commands in the back-end folder

```
rails db:create
rails db:migrate
rails db:seed
```
then `rails s` to start the server

### front-end

To get the front-end running, you should run all of these commands in the front-end folder

```
npm install
npm ren serve
```
Then go to the url that is listed when it finishes loading

## Using The Love-Books-App

The home page of the appplication shows all the books that are in the database listed whith their title, author and a picture. When you click on one, it takes you to the page for the book you selected, where you can see a blurb about the book and the average rating and all of the reveiws. If you are signed in, you can write a reveiw with a rating. If you sign in, the site will remember you are logged in anytime you leave or come back to the app until you sign out.

## Contact

If you want to contact me you can reach me at fosterv2@outlook.com.

## License

This project uses the following license: [MIT License](https://choosealicense.com/licenses/mit/)
