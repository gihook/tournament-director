defmodule Tournament do
  defstruct [:id, :director_user_id, :status, :current_round, pairs: [], boards: []]

  def initialize() do
    boards = 1..8 |> Enum.map(&Board.initialize/1)

    %Tournament{
      boards: boards
    }
  end

  def register_pair(%Tournament{pairs: pairs} = tournament, pair) do
    updated_pairs = [pair | pairs]
    %Tournament{tournament | pairs: updated_pairs}
  end
end
