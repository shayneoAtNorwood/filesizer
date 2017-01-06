require "termbox"
module TermboxAdditions
  class Writer < Termbox::Element
    include Termbox
    getter :cell, :size, :is_vertical

    def initialize(@position : Position, @s : String)
      @foreground = 0
      @background = 0
      @mode = :no_color
    end
    def initialize(@position : Position, @s : String, @foreground : Int32, @background : Int32)
      @mode = :color
    end


    def render : Array(Cell)
      final = [] of Cell
      size = @s.size
      (0..(size-1)).each do |i|
        if @mode == :no_color
          final << Cell.new @s[i],  @position
        else
          final << Cell.new @s[i],  @position, @foreground, @background
        end
        @position = @position.new_transform 1 , 0

      end

      final
    end
  end
end
