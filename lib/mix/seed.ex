defmodule Mix.Tasks.Seed do
  use Mix.Task

  @shortdoc "Resets & seeds the DB."
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

    # 17 arguments
    Postgrex.query!(
      DB,
      "Create TABLE pizzas (id SERIAL, name VARCHAR(255) NOT NULL,img TEXT NOT NULL, tomat INTEGER NOT NULL,
      mozarella	INTEGER NOT NULL, basilika	INTEGER NOT NULL, skinka	INTEGER NOT NULL,
      svamp	INTEGER NOT NULL, kronärtskocka	INTEGER NOT NULL, oliver INTEGER NOT NULL,
      parmesan	INTEGER NOT NULL, pecorino	INTEGER NOT NULL, gorgonzola	INTEGER NOT NULL,
      paprika	INTEGER NOT NULL, aubergine	INTEGER NOT NULL, zucchini	INTEGER NOT NULL, salami
      INTEGER NOT NULL, chili	INTEGER NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    # 17 arguments
    Postgrex.query!(
      DB,
      "Create TABLE pizza_cart (id SERIAL, name VARCHAR(255) NOT NULL,img TEXT NOT NULL, tomat INTEGER NOT NULL,
      mozarella	INTEGER NOT NULL, basilika	INTEGER NOT NULL, skinka	INTEGER NOT NULL,
      svamp	INTEGER NOT NULL, kronärtskocka	INTEGER NOT NULL, oliver INTEGER NOT NULL,
      parmesan	INTEGER NOT NULL, pecorino	INTEGER NOT NULL, gorgonzola	INTEGER NOT NULL,
      paprika	INTEGER NOT NULL, aubergine	INTEGER NOT NULL, zucchini	INTEGER NOT NULL, salami
      INTEGER NOT NULL, chili	INTEGER NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    # 18 arguments
    Postgrex.query!(
      DB,
      "Create TABLE tony_orders (id SERIAL, name VARCHAR(255) NOT NULL, order_name VARCHAR(255) NOT NULL, img TEXT NOT NULL, tomat INTEGER NOT NULL,
      mozarella	INTEGER NOT NULL, basilika	INTEGER NOT NULL, skinka	INTEGER NOT NULL,
      svamp	INTEGER NOT NULL, kronärtskocka	INTEGER NOT NULL, oliver INTEGER NOT NULL,
      parmesan	INTEGER NOT NULL, pecorino	INTEGER NOT NULL, gorgonzola	INTEGER NOT NULL,
      paprika	INTEGER NOT NULL, aubergine	INTEGER NOT NULL, zucchini	INTEGER NOT NULL, salami
      INTEGER NOT NULL, chili	INTEGER NOT NULL)",
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
      "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
      VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Margherita","margherita.svg",1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Marinara","marinara.svg",1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Prosciutto e funghi","prosciutto-e-funghi.svg",1,1,0,1,1,0,0,0,0,0,0,0,0,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Quattro stagioni","quattro-stagioni.svg",1,1,0,1,1,1,1,0,0,0,0,0,0,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Capricciosa","capricciosa.svg",1,1,0,1,1,1,0,0,0,0,0,0,0,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Quattro formaggi","quattro-formaggi.svg",1,1,0,0,0,0,0,1,1,1,0,0,0,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Ortolana","ortolana.svg",1,1,0,0,0,0,0,0,0,0,1,1,1,0,0],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizzas(name, img, tomat, mozarella, basilika, skinka, svamp, kronärtskocka, oliver, parmesan, pecorino, gorgonzola, paprika, aubergine, zucchini, salami, chili)
    VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)", ["Diavola","diavola.svg",1,1,0,0,0,0,0,0,0,0,0,1,0,1,1],
      pool: DBConnection.ConnectionPool
    )

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
