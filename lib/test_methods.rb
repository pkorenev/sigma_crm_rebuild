module TestMethods
  def test
    render inline: "hello12345"

    puts "hello234"


  end

  def reload_application
    ActionDispatch::Reloader.cleanup!
    ActionDispatch::Reloader.prepare!
  end
end