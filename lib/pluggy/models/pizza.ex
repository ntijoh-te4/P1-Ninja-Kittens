defmodule Pluggy.Pizza do
  defstruct(id: nil, name: "", img: "", ingredients: [])
  alias Pluggy.Pizza

  def all do
    query = "SELECT * FROM pizzas JOIN pizza_ingredients ON pizzas.id = pizza_ingredients.pizza_id
            JOIN ingredients ON pizza_ingredients.ing_id = ingredients.id"

    Postgrex.query!(DB, query, []).rows
    |> group
    |> to_struct_list
  end

  def cart do
    cart = Postgrex.query!(DB, "SELECT * FROM pizza_cart").rows

    Enum.map(cart, fn [_id, pizza_id, _order_id] -> Pizza.get(pizza_id)
      end )

  end

  def add_into_cart(id) do
    IO.inspect(id)
    query = "INSERT INTO pizza_cart (pizza_id,order_id) VALUES ($1,$2)"
    Postgrex.query!(DB, query, [String.to_integer(id), 1])
  end

  #   def cart do
  #   IO.inspect("hej")
  #   Postgrex.query!(DB, "SELECT * FROM pizza_cart JOIN pizza_ingredients ON pizza_cart.id = pizza_ingredients.pizza_id
  #                       JOIN ingredients ON pizza_ingredients.ing_id = ingredients.id",[]).rows
  #   |> group
  #   |> to_struct_list
  # end

  def get(id) do
    query = "SELECT * FROM pizzas JOIN pizza_ingredients ON pizzas.id = pizza_ingredients.pizza_id
            JOIN ingredients ON pizza_ingredients.ing_id = ingredients.id WHERE pizzas.id = $1"

    Postgrex.query!(DB, query, [id]).rows
    |> to_struct
  end

  def delete(id) do
    Postgrex.query!(DB, "DELETE FROM pizzas WHERE id = $1", [String.to_integer(id)])
  end

  def get_next_id() do
    next = Postgrex.query!(DB, "SELECT id FROM pizzas ORDER BY id DESC", []).rows
    Enum.count(next) + 1
  end

  def create(params) do
    IO.inspect(params)

    pizza_id = params["pizza_id"]
    ingredients = params["ingredients"]


    Enum.each(ingredients, fn id -> Postgrex.query!(DB, "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES ($1,$2)", [String.to_integer(pizza_id),String.to_integer(id)])

    end)

    Postgrex.query!(DB, "DELETE FROM pizza_cart WHERE pizza_id = $1",[String.to_integer(pizza_id)])
    Postgrex.query!(DB, "INSERT INTO pizza_cart (pizza_id,order_id) VALUES ($1,$2)", [String.to_integer(pizza_id),1])
  end

  def get_ingredients() do
    Postgrex.query!(DB, "SELECT * FROM ingredients").rows
  end

  # def get_pizza_ingredient(id) do
  #   Postgrex.query!(DB, "SELECT * FROM ingredients WHERE id=?", [id]).rows
  # end

  def group(pizzas) do
    Enum.group_by(pizzas, fn pizza -> Enum.at(pizza, 0) end)
  end

  def to_struct_list(grouped) do
    Enum.map(grouped, fn group ->
      {_id, rows} = group
      to_struct(rows)
    end)
  end

  def to_struct(rows) do
    [id, pizza, img, _, _, _, _] = Enum.at(rows, 0)
    pizza = %Pizza{id: id, name: pizza, img: img}

    Enum.reduce(rows, pizza, fn [_id, _pizza, _img, _, _, _, ingredient], acc ->
      %Pizza{pizza | ingredients: [ingredient | acc.ingredients]}
    end)
  end
end
