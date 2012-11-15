module FilmsHelper
  def join_janrs(film)
    film.janrs.uniq.map { |t| t.name }.join(", ")
  end
end
