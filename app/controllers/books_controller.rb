class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new

    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    params[:book][:user_id] = get_user_id(params[:book][:user_id])

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
    params[:book][:user_id] = get_user_id(params[:book][:user_id])

    @book = Book.find(params[:id])

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
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def auto_complete
    @users = User.find_by_partial_name(params[:data]).map { |user| user.full_name }
  end

private
  
  def parse_user_name(str)
    Integer(str)
  rescue
    str
  end

  def get_user_id(user)
    if parse_user_name(user).is_a? Numeric
      user
    else
      User.find_by_full_name(user.split(' ')).first.id
    end
  end
end