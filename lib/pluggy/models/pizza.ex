defmodule Pluggy.Pizza do
  defstruct(id: nil,
      name: "",
      img: "",
      tomat: nil,
      mozarella: nil,
      basilika: nil,
      skinka: nil,
      svamp: nil,
      kronärtskocka: nil,
      oliver: nil,
      parmesan: nil,
      pecorino: nil,
      gorgonzola: nil,
      paprika: nil,
      aubergine: nil,
      zucchini: nil,
      salami: nil,
      chili: nil
    )

      alias Pluggy.Pizza

  def all do
    Postgrex.query!(DB, "SELECT * FROM pizzas", []).rows
    |> to_struct_list
  end

  def all_with_ingredients do
    
  end

   def get(id) do
    Postgrex.query!(DB, "SELECT * FROM pizzas WHERE id = $1 LIMIT 1", [String.to_integer(id)]
    ).rows
    |> to_struct
  end

  # def get_tony(conn) do
  #   Postgrex.query!(DB, "SELECT * from pizzas", [(conn)])
  # end

  # def picture(id) do
  #   Postgrex.query!(DB, "SELECT img FROM pizzas where id = $1",[id])
  #   |> Path.join(["../priv/uploads/img/",])
  #   |> File.read()
  # end


  def to_struct_list(rows) do
    for [id, name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola,paprika,aubergine,zucchini,salami,chili]
    <- rows, do: %Pizza{
      id: id,
      name: name,
      img: img,
      tomat: tomat,
      mozarella: mozarella,
      basilika: basilika,
      skinka: skinka,
      svamp: svamp,
      kronärtskocka: kronärtskocka,
      oliver: oliver,
      parmesan: parmesan,
      pecorino: pecorino,
      gorgonzola: gorgonzola,
      paprika: paprika,
      aubergine: aubergine,
      zucchini: zucchini,
      salami: salami,
      chili: chili}
  end

  def to_struct([[id, name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola,paprika,aubergine,zucchini,salami,chili]]) do
    %Pizza{id: id,
      name: name,
      img: img,
      tomat: tomat,
      mozarella: mozarella,
      basilika: basilika,
      skinka: skinka,
      svamp: svamp,
      kronärtskocka: kronärtskocka,
      oliver: oliver,
      parmesan: parmesan,
      pecorino: pecorino,
      gorgonzola: gorgonzola,
      paprika: paprika,
      aubergine: aubergine,
      zucchini: zucchini,
      salami: salami,
      chili: chili}
  end
end
