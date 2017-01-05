require "crt";
module DisplayUtils


class ScreenControl


  def initialize
    @scr = LibNcursesw.initscr
    @width = LibNcursesw.getmaxx @scr
    @height = LibNcursesw.getmaxy @scr
    @win = Crt::Window.new(@width, @height)
    @win.clear
    LibNcursesw::wprintw("hello world")
    #win.refresh
    doink = gets
    #Crt.done
  end

  def finalize
    Crt.done
  end

end

end
