helpers do
  def ensure_link_exists(keyword)
    link = Link.where(keyword: keyword).first
    if link
      yield link
    else
      404
    end
  end
end
