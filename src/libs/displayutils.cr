require "termbox"
require "./TermboxAdditions/**"
module DisplayUtils


class ScreenControl
  include Termbox
  include TermboxAdditions
  property width,height

  def initialize
    @width = uninitialized Int32
    @height = uninitialized Int32
    @w = uninitialized Window
    #Crt.done
    @w = Window.new
    @w.clear
    @width = @w.width
    @height = @w.height
    @w << Border.new(Position.new(0, 0), @width, @height-1)
    @main_window = Container.new(Position.new(1,1),@width-2,@height-3)
    outp = Writer.new(Position.new(0,0),"Hello there",COLOR_WHITE,COLOR_BLUE)
    @main_window << outp

    # Use 256 color mode
    @w.set_output_mode(OUTPUT_NORMAL)
    # Use red foreground, periwinkle background
    @w.set_primary_colors(COLOR_YELLOW,COLOR_BLACK)
    # Reset things

    @w << @main_window

    @w.render()

    sleep(10)
  end



  def finalize
    @w.shutdown
  end

end

end
