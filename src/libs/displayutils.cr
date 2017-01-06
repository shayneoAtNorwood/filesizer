require "termbox"
require "./TermboxAdditions/**"
module DisplayUtils


class ScreenControl
  include Termbox
  include TermboxAdditions
  property width,height

  def initialize (dataset : DirUtils::Entry)
    @stackframe = [] of DirUtils::Entry
    @stackframe.push dataset
    @width = uninitialized Int32
    @height = uninitialized Int32
    @w = uninitialized Window
    #Crt.done
    @w = Window.new
    @w.clear
    @width = @w.width
    @height = @w.height
    b = Border.new(Position.new(0, 0), @width-25, @height-2)
    b.foreground = COLOR_BLUE
    b.background = COLOR_WHITE
    @w << b
    @main_window = Container.new(Position.new(1,1),@width-27,@height-3)
    @side_window = Container.new(Position.new(@width-25,0),25,@height-3)
    @bottom_bar = Container.new(Position.new(@height,0),@width,1)
    # Use 256 color mode
    @w.set_output_mode(OUTPUT_NORMAL)
    # Use red foreground, periwinkle background
    @w.set_primary_colors(COLOR_WHITE,COLOR_BLACK)
    # Reset things

    @w << @main_window
    @w << @side_window
    @w << @bottom_bar


  end

  def setup_headers
    outp = Writer.new(Position.new(0,0),@stackframe.last.name,COLOR_WHITE | ATTR_BOLD,COLOR_BLUE)
    @w << outp
    @w.render()
  end

  def render_sidebar
    top = 0
    entry = @stackframe.last
    entry.contents.each do |e|
      outp = Writer.new(Position.new(0,top),e.name,COLOR_YELLOW | ATTR_BOLD,COLOR_BLACK)
      top += 1
      @side_window << outp
    end
    @w.render()
  end


  def finalize

  end

end

end
