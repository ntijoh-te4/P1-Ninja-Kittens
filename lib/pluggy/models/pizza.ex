defmodule Pluggy.Pizza do
 defstruct(id: nil, name: "", img: "", ingredients: [])
 alias Pluggy.Pizza

  def all do
    query = "SELECT * FROM pizzas JOIN pizza_ingredients ON pizzas.id = pizza_ingredients.pizza_id
            JOIN ingredients ON pizza_ingredients.ing_id = ingredients.id"
    Postgrex.query!(DB,  query, []).rows
    |> group
    |> to_struct_list
  end

  def get(id) do
    query = "SELECT * FROM pizzas JOIN pizza_ingredients ON pizzas.id = pizza_ingredients.pizza_id
            JOIN ingredients ON pizza_ingredients.ing_id = ingredients.id WHERE pizzas.id = $1"
    Postgrex.query!(DB,  query, [id]).rows
    |> to_struct
  end

  def group(pizzas) do
   Enum.group_by(pizzas, fn pizza -> Enum.at(pizza, 0) end)
  end

  def to_struct_list(grouped) do
    Enum.map(grouped, fn group ->
      {_id , rows} = group
      to_struct(rows)
    end)

  end
  def to_struct(rows) do
    [id, pizza, img, _, _, _, _] = Enum.at(rows, 0)
    pizza = %Pizza{id: id, name: pizza, img: img}
    Enum.reduce(rows, pizza, fn [_id, _pizza, _img, _, _, _, ingredient], acc ->
        %Pizza{ pizza | ingredients: [ingredient | acc.ingredients] }
     end)
  end
end
