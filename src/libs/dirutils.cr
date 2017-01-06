
require "Dir"
require "Colorize"
#require "File"
#win = Crt::Window.new(24, 80)
#win.clear
#win.print(5, 10, "hello world")
##win.refresh
#puts "BOING"
#doink = gets
#Crt.done
module DirUtils
  struct Entry
    property name,path,size
    property contents

    def initialize (@name : String , @path : String , @size : UInt64 | Int32, @type : UInt64 | Int32)
      @contents = [] of Entry
    end

  end

  class DirentrySizer
    def scan_dir(fn : String,entry : Entry) : Entry
      totalsize = 0
      size = 0
      fi = File
      @depth += 1
      begin
        dir = Dir.new(fn)
      rescue
        return entry
      end
      #puts(dir)
      dir.each do |f|
        @count+=1
        if @count % 10000 == 0
          print ".".colorize(:yellow)
        end
        next if [".",".."].includes? f
        path = "#{fn}/#{f}"
        #fil.pretty_print(fil)
        next if fi.symlink? path  #Nope out of symlinks

        directory = fi.directory?(path)
        size = fi.size(path)
        #      fil.close

        if directory
          e = scan_dir(path,Entry.new(f,path,0,0))
        else
          e = Entry.new(f,path,size,1)
        end
        totalsize += e.@size
        #print "#{path} is size #{size}\n"
        unless entry.nil?
          entry.@contents << e
        end
      end
      dir.close
      @depth -= 1
      entry.size = totalsize

      c = entry.contents.sort! do |a,b|
        result = 0
        if (a.size < b.size)
          result = -1
        else
          if (a.size == b.size)
            result = 0
          else
            result = 1
          end #inner
        end
        #yield result
        result
      end
      entry.contents = c

      return entry
    end
    def run
      puts "Analysing Directory #{@starting_dir}. This might take a while.\n".colorize(:white)
      results = self.scan_dir(@starting_dir,@base)
      puts "\n"
      #results.contents.each do |f|
      #  puts "#{f.size}     #{f.name}"
      #end
      return results
    end

    def initialize(@starting_dir : String)
      @count = 0
      @depth = 0
      @base = Entry.new(".",@starting_dir,0,0)
    end
  end
end
