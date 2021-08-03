class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif model == "partial"
        User.where('name LIKE ?', "%#{content}%")
      elsif model == "forward"
        User.where('name LIKE ?', "#{content}%")
      else
        User.where('name LIKE ?', "%#{content}")
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif model == "partial"
        Book.where('title LIKE ?', "%#{content}%")
      elsif model == "forward"
        Book.where('title LIKE ?', "#{content}%")
      else
        Book.where('title LIKE ?', "%#{content}")
      end
    end
  end

  # def search_for(model, content, method)
  #   if model == 'user'
  #     if method == 'perfect'
  #       User.where(name: content)
  #     elsif model == "partial"
  #       User.where('name LIKE ?', '%'+content+'%')
  #     elsif model == "forward"
  #       User.where('name LIKE ?', '%'+content+'%')
  #     else
  #       User.where('name LIKE ?', '%'+content+'%')
  #     end
  #   elsif model == 'book'
  #     if method == 'perfect'
  #       Book.where(title: content)
  #     elsif model == "partial"
  #       Book.where('title LIKE ?', '%'+content+'%')
  #     elsif model == "forward"
  #       Book.where('title LIKE ?', '%'+content+'%')
  #     else
  #       Book.where('title LIKE ?', '%'+content+'%')
  #     end
  #   end
  # end

end

