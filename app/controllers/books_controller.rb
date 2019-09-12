class BooksController < ApplicationController

	def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def edit
  	@book = Book.find(params[:id])

  end
  def new

  end


  def update
        @book = Book.find(params[:id])
        if   @book.update(book_params)
           flash[:notice] = "successfully"
            redirect_to book_path(@book.id)
        #成功したときの挙動
       else
        #失敗したときの挙動
        render 'edit'
      end
    end

  def create
       @book = Book.new(book_params)
       if @book.save
        flash[:notice] = "successfully"
       	#成功したときの挙動
       redirect_to book_path(@book.id)
       else
       	#失敗したときの挙動
        @books = Book.all
        render 'index'
     end
    end


   def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path

    end

	private
	def book_params
		params.require(:book).permit(:title,:body)
    end
end
