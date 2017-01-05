require "crt";
module DisplayUtils


class ScreenControl


  def initialize
    @winp = uninitialized LibNcursesw::WindowPtr
    @scr = LibNcursesw.initscr
    @width = LibNcursesw.getmaxx @scr
    @height = LibNcursesw.getmaxy @scr
    print "#{@width} x #{@height} <--\n"
    @win = Crt::Window.new(@height,@width)
    @winp = @win.getwindow
    @win.print(1,1,"hello world")
    #win.refresh
    LibNcursesw.refresh
    doink = gets
    #Crt.done
  end



  def finalize
    Crt.done
    print "#{@width} x #{@height} <--\n"
  end

end

end
