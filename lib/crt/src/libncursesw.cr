# We switch library to use UTF-8 on ubuntu that uses ncursesw for wide-chars
{% if flag?(:linux) %}
  # We don't need gpm, but ncursesw(ubuntu) uses it for static link
  @[Link("gpm")]
  @[Link("ncursesw")]
{% else %}
  @[Link("ncurses")]
{% end %}

lib LibC
  fun setlocale(cat : Int32, locale : LibC::Char*) : LibC::Char*
end

lib LibNcursesw
  # setlocale
  LC_ALL = 6

  # colors
  COLOR_BLACK   = 0
  COLOR_RED     = 1
  COLOR_GREEN   = 2
  COLOR_YELLOW  = 3
  COLOR_BLUE    = 4
  COLOR_MAGENTA = 5
  COLOR_CYAN    = 6
  COLOR_WHITE   = 7

  type WindowPtr = Void*

  fun cbreak : Int32
  fun curs_set(v : Int32) : Int32
  fun echo : Int32
  fun endwin : Int32
  fun erase : Int32
  fun getch : Int32
  fun getmaxx(win : WindowPtr) : Int32
  fun getmaxy(win : WindowPtr) : Int32
  fun getnstr(str : LibC::Char*, n : Int32) : Int32
  fun getstr(str : LibC::Char*) : Int32
  fun halfdelay(v : Int32) : Int32
  fun initscr : WindowPtr
  fun intrflush(win : WindowPtr, bool : Bool) : Int32
  fun keypad(win : WindowPtr, bool : Bool) : Int32
  fun mouseinterval(v : Int32) : Int32
  fun mvwaddstr(win : WindowPtr, y : Int32, x : Int32, str : LibC::Char*) : Int32
  fun newwin(rows : Int32, cols : Int32, y : Int32, x : Int32) : WindowPtr
  fun nocbreak : Int32
  fun nodelay(win : WindowPtr, b : Bool) : Int32
  fun noecho : Int32
  fun nonl : Int32
  fun noraw : Int32
  fun raw : Int32
  fun refresh : Int32
  fun start_color : Int32
  fun use_default_colors : Int32
  fun waddstr(win : WindowPtr, str : LibC::Char*) : Int32
  fun wclear(win : WindowPtr) : Int32
  fun wmove(win : WindowPtr, y : Int32, x : Int32) : Int32
  fun wrefresh(win : WindowPtr) : Int32
end
