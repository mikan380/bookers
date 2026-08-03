class BooksController < ApplicationController
  # 一覧画面 (/books)
  def index
    @books = Book.all
    @book = Book.new
  end

  # 投稿の保存処理 (POST /books)
  def create
    @book = Book.new(book_params)
  
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
     @books = Book.all
      render :index, status: :unprocessable_entity
    end
  end

  # 詳細画面 (/books/:id)
  def show
    @book = Book.find(params[:id])
  end

  # 編集画面 (/books/:id/edit)
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
   if @book.update(book_params)
    redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
    render :edit, status: :unprocessable_entity
   end
  end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  private

  # ストロングパラメーター
  # ※フォームの送られ方に応じて :book または :booker を指定します
  def book_params
    params.require(:book).permit(:title, :body)
  end
end