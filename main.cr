require "./src/libs/**"

class Main

  def initialize
    @dirs = DirUtils::DirentrySizer.new "/Users/shayneoneill"
    #@dirs.run
    @crt = DisplayUtils::ScreenControl.new

  end

  def run

  end

  def finalize
      @crt.finalize
  end

end


m = Main.new
m.run
