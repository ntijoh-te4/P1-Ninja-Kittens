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

  def delete(id) do
    Postgrex.query!(DB, "DELETE FROM pizzas WHERE id = $1", [String.to_integer(id)])
  end

  def get_next_id() do
    next = Postgrex.query!(DB,"SELECT id FROM pizzas ORDER BY id DESC", []).rows
    Enum.count(next) + 1
  end

  def create(params) do
    IO.inspect(params)
    tomatsås      = params["tomatsås"]
    mozarella     = params["mozarella"]
    basilika      = params["basilika"]
    skinka        = params["skinka"]
    svamp         = params["svamp"]
    kronärtskocka = params["kronärtskocka"]
    oliver        = params["oliver"]
    parmesan      = params["parmesan"]
    pecorino      = params["pecorino"]
    gorgonzola    = params["gorgonzola"]
    paprika       = params["paprika"]
    aubergine     = params["aubergine"]
    zucchini      = params["zucchini"]
    salami        = params["salami"]
    chili         = params["chili"]
    name          = params["name"]
    img           = params["img"]

    cond do
      tomatsås      == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),1])
      mozarella     == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),2])
      basilika      == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),3])
      skinka        == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),4])
      svamp         == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),5])
      kronärtskocka == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),6])
      oliver        == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),7])
      parmesan      == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),8])
      pecorino      == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),9])
      gorgonzola    == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),10])
      paprika       == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),11])
      aubergine     == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),12])
      zucchini      == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),13])
      salami        == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),14])
      chili         == true -> Postgrex.query!(DB, "INSERT * INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1, $2)",[get_next_id(),15])
    end

    Postgrex.query!(DB, "INSERT INTO pizza_cart (name,img)", [name,img])

  end

  def get_ingredients() do
    Postgrex.query!(DB, "SELECT * FROM ingredients").rows
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
