class BooksController < ApplicationController
  before_filter :book_find, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new
    respond_to do |format|
      format.html
      format.json { render json: @users.map(&:full_name) }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @users.map(&:full_name) }
    end
  end

  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def auto_complete
    @users = User.where("first_name LIKE ? or last_name LIKE ?", "%#{params[:term]}%" , "%#{params[:term]}%")
    result = @users.collect do |t|
      { value: t.full_name }
    end
    render json: result
  end

  private

  def book_find
    @book = Book.find(params[:id])
  end
end
