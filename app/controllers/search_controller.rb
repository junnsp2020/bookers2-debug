class SearchController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
    @book = Book.new
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name:content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title:content)
      elsif method == 'forward'
        Book.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Book.where('title LIKE ?', '%'+content)
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end



# class SearchController < ApplicationController
#   before_action :authenticate_user!

# def search
#     if params[:content].present?
#       @books = Product.where('title LIKE ?', "%#{params[:content]}%")
#     else
#       @users = User.where('name LIKE ?', "%#{params[:content]}%")
#     end
#   end
# end


