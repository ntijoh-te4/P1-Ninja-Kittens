defmodule Pluggy.Models.Pizza do
  alias Pluggy.Pizza

  def all do
    Postgrex.query!(DB, "SELECT * FROM fruits", []).rows
    |> to_struct_list
  end


end
