require 'pry'

class Jukebox
  attr_accessor :command

  def initialize(songs)
    @songs = songs
  end

  def help
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def list
    # @songs.each{|song| puts "#{song}"}
    puts @songs
  end

  def play(selection="default")

    # puts "What song would you like to listen to?"

    # selection = self.gets
    # selection = "default" if selection.empty?

   song = if selection == "default"
      choice = self.gets

      if choice == choice.to_i.to_s
        @songs[choice.to_i-1]
      else
        choice
      end
    elsif selection == selection.to_i.to_s
      @songs[selection.to_i-1]
    else
      selection      
    end

    # if selection == "default"
    #   @songs[0]
    # elsif selection.to_i.to_s == selection
    #   @songs[selection.to_i-1]
    # else
    #   selection
    # end    

    # song = if selection.to_i.to_s == selection
    #   @songs[selection.to_i-1]
    # else
    #   selection
    # end

    puts "Now Playing: #{song}"

  end

  def gets
    gets.strip
  end

  def call

    input = self.gets
    command = input.split(" ").first
    options = input.scan(/\s.+$/)
    options.length >= 1 ? option = options.first.slice(1, options.first.length) : nil

    case command
    when "help" 
      help
    when "list"
      list
    when "play"
      option ? play(option) : play
    when "exit"
      exit
    end

  end# call end

end #Class end

