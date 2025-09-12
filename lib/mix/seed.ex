defmodule Mix.Tasks.Seed do
  use Mix.Task

  @shortdoc "Resets $ seeds the DB."
  def run(_) do
    Mix.Task.run("app.start")
    drop_tables()
    create_tables()
    seed_data()
  end

  defp drop_tables() do
    IO.puts("Dropping tables")


    Postgrex.query!(DB, "DROP TABLE IF EXISTS pizza_cart", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS tony_orders", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS pizzas", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS pizza_ingredients", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS ingredients", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS fruits", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS users", [], pool: DBConnection.ConnectionPool)
  end

  defp create_tables() do
    IO.puts("Creating tables")

    Postgrex.query!(
      DB,
      "Create TABLE fruits (id SERIAL, name VARCHAR(255) NOT NULL, tastiness INTEGER NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE users (id SERIAL, username VARCHAR(255) NOT NULL, password_hash CHAR(72) NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )
  end

  defp seed_data() do
    IO.puts("Seeding data")

    Postgrex.query!(
      DB,
      "Create TABLE pizzas (id SERIAL, name VARCHAR(255) NOT NULL, img VARCHAR(255))",[],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE ingredients (id SERIAL, name VARCHAR(255) NOT NULL)",[],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE pizza_ingredients (pizza_id INTEGER NOT NULL,ing_id INTEGER NOT NULL)",[],
      pool: DBConnection.ConnectionPool
    )

    #PIZZAS
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Margherita","margherita.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Marinara","marinara.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Prosciutto e funghi","prosciutto-e-funghi.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Quattro stagioni","quattro-stagioni.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Capricciosa","capricciosa.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Quattro formaggi","quattro-formaggi.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Ortolana","ortolana.svg"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizzas (name,img) VALUES($1, $2)", ["Diavola","diavola.svg"],
      pool: DBConnection.ConnectionPool
    )

    #INGREDIENTS
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Tomatsås"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Mozarella"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Basilika"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Skinka"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Svamp"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Kronärtskocka"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Oliver"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Parmesan"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Pecorino"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Gorgonzola"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Paprika"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Aubergine"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Zucchini"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Salami"],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO ingredients (name) VALUES($1)", ["Chili"],
      pool: DBConnection.ConnectionPool
    )


    #TABELL
    #MARGARITA
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [1,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [1,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [1,3],
      pool: DBConnection.ConnectionPool
    )
    #MARINARA
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [2,1],
      pool: DBConnection.ConnectionPool
    )
    #PROSCIOTTO FUNGO
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [3,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [3,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [3,4],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [3,5],
      pool: DBConnection.ConnectionPool
    )
    #QUATTRO STAGIONI
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [4,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [4,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [4,4],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [4,5],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [4,6],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [4,7],
      pool: DBConnection.ConnectionPool
    )
    #CAPPRIOSCISOSO
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [5,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [5,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [5,4],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [5,5],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [5,6],
      pool: DBConnection.ConnectionPool
    )
    #QUATTRO FORMAGGI
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [6,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [6,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [6,8],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [6,9],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [6,10],
      pool: DBConnection.ConnectionPool
    )
    #ORTOLANA
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [7,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [7,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [7,11],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [7,12],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [7,13],
      pool: DBConnection.ConnectionPool
    )
    #DIAVOLA
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [8,1],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [8,2],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [8,14],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [8,11],
      pool: DBConnection.ConnectionPool
    )
    Postgrex.query!(
      DB,
      "INSERT INTO pizza_ingredients (pizza_id,ing_id) VALUES($1, $2)", [8,15],
      pool: DBConnection.ConnectionPool
    )


    # Postgrex.query!(
    #   DB,
    #   "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    #   VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Margherita","margherita.svg",1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Marinara","marinara.svg",1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Prosciutto e funghi","prosciutto-e-funghi.svg",1,1,0,1,1,0,0,0,0,0,0,0,0,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Quattro stagioni","quattro-stagioni.svg",1,1,0,1,1,1,1,0,0,0,0,0,0,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Capricciosa","capricciosa.svg",1,1,0,1,1,1,0,0,0,0,0,0,0,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Quattro formaggi","quattro-formaggi.svg",1,1,0,0,0,0,0,1,1,1,0,0,0,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Ortolana","ortolana.svg",1,1,0,0,0,0,0,0,0,0,1,1,1,0,0],
    #   pool: DBConnection.ConnectionPool
    # )

    # Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    # VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Diavola","diavola.svg",1,1,0,0,0,0,0,0,0,0,0,1,0,1,1],
    #   pool: DBConnection.ConnectionPool
    # )

    Postgrex.query!(DB, "INSERT INTO fruits(name, tastiness) VALUES($1, $2)", ["Apple", 5],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO fruits(name, tastiness) VALUES($1, $2)", ["Pear", 4],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO fruits(name, tastiness) VALUES($1, $2)", ["Banana", 7],
      pool: DBConnection.ConnectionPool
    )

    # Postgrex.query!(DB, "SELECT * FROM pizzas JOIN pizza_cart ON pizzas.name = pizza_cart.name WHERE pizzas.name = $1",
    #   pool: DBConnection.ConnectionPool
    # )

    Postgrex.query!(
      DB,
      "INSERT INTO users(username, password_hash) VALUES($1, $2)",
      ["Tony", Bcrypt.hash_pwd_salt("a")],
      pool: DBConnection.ConnectionPool
    )


  end
end
