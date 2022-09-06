class BooksController < ApplicationController
  PAGINATION_PER_PAGE = 12

  def index
    @books_count = Book.count
    @categories = Category.all
    sorted_books = BookQuery.query(params).paginate(page: params[:page],
                                                    per_page: PAGINATION_PER_PAGE)

    @books = BookDecorator.decorate_collection(sorted_books)

    respond_to do |format|
      format.html
      format.json do
        render json: {
          entries: render_to_string(partial: 'books', formats: [:html]),
          pagination: view_context.will_paginate(@books)
        }
      end
    end
  end

  def show
    @book = BookDecorator.decorate(Book.find(params[:id]))

    redirect_to books_path if @book.nil?
  end
end
