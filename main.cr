require "./src/libs/**"

class Main

  def initialize
    @dir = "/Users/shayneoneill/Devel/ganymede"
    @dirs = DirUtils::DirentrySizer.new @dir
    @entries = uninitialized DirUtils::Entry
    @entries = @dirs.run
    @entries.name = @dir

    @crt = DisplayUtils::ScreenControl.new @entries
    @crt.setup_headers
  end

  def run
    @crt.render_sidebar
    sleep(10)
  end

  def finalize
      @crt.finalize
  end

end


m = Main.new
m.run
