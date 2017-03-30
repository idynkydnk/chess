class String
  def black; "\e[30m#{self}\e[0m" end
  def white; "\e[37m#{self}\e[0m" end
  def red; "\e[31m#{self}\e[0m" end
  def blue; "\e[34m#{self}\e[0m" end
  def bg_black; "\e[40m#{self}\e[0m" end
  def bg_white; "\e[47m#{self}\e[0m" end

end