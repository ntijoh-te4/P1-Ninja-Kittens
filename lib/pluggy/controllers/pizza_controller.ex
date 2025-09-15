defmodule Pluggy.PizzaController do
  require IEx

  alias Pluggy.User
  alias Pluggy.Pizza
  import Pluggy.Template, only: [render: 2]
  import Plug.Conn, only: [send_resp: 3]

  def index(conn) do
    # get user if logged in
    session_user = conn.private.plug_session["user_id"]

    current_user =
      case session_user do
        nil -> nil
        _ -> User.get(session_user)
      end

    send_resp(conn,200,render("pizzas/index", pizzas: Pizza.all(), user: current_user)
    )
  end

  def show(conn, id), do: send_resp(conn, 200, render("pizzas/show", ingredients: Pizza.get_ingredients, pizzas: Pizza.get(String.to_integer(id))))
  def cart(conn), do: send_resp(conn, 200, render("pizzas/cart", pizzas: Pizza.cart()))

  def tonys(conn), do: send_resp(conn, 200, render("pizzas/tonys_pizzas", pizzas: Pizza.all()))

  # def edit(conn, id, params) do
  #   Pizza.edit(id, params)
  #   redirect(conn, "pizzas/index")
  # end

  def create(conn,params) do
    Pizza.create(params)
    redirect(conn, "/pizza_cart")
  end

  def destroy(conn, id) do
    Pizza.delete(id)
    redirect(conn, "/tonys_pizzas")
  end


  defp redirect(conn, url) do
    Plug.Conn.put_resp_header(conn, "location", url) |> send_resp(303, "")
  end
end
