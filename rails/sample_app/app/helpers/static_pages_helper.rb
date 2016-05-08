module StaticPagesHelper

  def paginate(object, options={})
    page = object.paginate(options)

    unless page.any?
      options[:page] = "1" if options[:page].to_i > 1
      page = object.paginate(options)      
    end

    return page
    #current_user.feed.paginate(page: params[:page], per_page: 5)
  end

end
