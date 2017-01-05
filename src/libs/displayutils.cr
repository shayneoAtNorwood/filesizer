require "crt";
module DisplayUtils


class ScreenControl


  def initialize
    @scr = LibNcursesw.initscr
    @width = LibNcursesw.getmaxx @scr
    @height = LibNcursesw.getmaxy @scr
    @win = Crt::Window.new(@width, @height)
    @win.start_color = LibNcursesw::COLOR_BLUE
    @win.clear
    @win.print(5, 10, "hello world")
    #win.refresh
    doink = gets
    #Crt.done
  end

  def finalize
    Crt.done
  end

end

end
