require "dirutils"
require "displayutils"

class Main

  def initialize
    @dirs = DirUtils::DirentrySizer.new "/Users/shayneoneill"
    @dirs.run
    @crt = DisplayUtils::ScreenControl.new

  end

  def run
  end

  def finalize

  end

end


m = Main.new
m.run