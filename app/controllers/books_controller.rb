class BooksController < ApplicationController
    def index
        books = Book.all
        render json: books.to_json(except: [:created_at, :updated_at])
    end

    def create
        book = Book.create(set_params)
        render json: book.to_json(except: [:created_at, :updated_at])
    end

    def update
        book = Book.find(params[:id])
        book.update(set_params)
        render json: book.to_json(except: [:created_at, :updated_at])
    end

    # def destroy
    #     book = Book.create(set_params)
    #     book.destroy
    # end

    private

    def set_params
        params.require(:book).permit(:title, :author_name, :img_url)
    end
end
