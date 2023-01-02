class Admin::BooksController < Admin::AdminsController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book= Book.new
  end

  def create
    @book= Book.new(book_params)

    if @book.save
      redirect_to  [:admin, @book]
    else
      render :new
    end
  end  

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book #[:admin, @book]
    else
      render :edit
    end
  end


  def destroy
    @book.destroy
    redirect_to root_path
  end

  private

  def set_book
   @book= Book.find(params[:id])
  end

  def book_params
      params.require(:book).permit(:title, :author, :discription, :image, :plan_id)
  end
end