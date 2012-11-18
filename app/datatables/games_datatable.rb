class GamesDatatable
   delegate :params, :h, :link_to, :number_to_currency,:truncate, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Game.count,
      iTotalDisplayRecords: games.total_entries,
      aaData: data
    }
  end

private

  def data
    games.map do |game|
      [
        link_to(truncate(game.name.strip, length:30), game),
        number_to_currency(game.price),
        h(game.metascore ? game.metascore : "Not rated")
      ]
    end
  end

  def games
    @games ||= fetch_games
  end

  def fetch_games
    games = Game.order("#{sort_column} #{sort_direction}")
    games = games.page(page).per_page(per_page)
    if params[:sSearch].present?
      games = games.where("name like :search", search: "%#{params[:sSearch]}%")
    end
    games
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name current_price metascore]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
