require_relative 'print'

class Menu
  MENU = {
    "Thing1" => 10,
    "Thing2" => 12,
    "Thing3" => 15,
    "Thing4" => 8
  }

  def display
    Print.display(MENU)
  end
end
