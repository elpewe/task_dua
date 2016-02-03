load './player.rb'

class Menu
  def initialize 
    @players = Hash.new
  end
  
  def start_menu
    puts "# ==============================   #"
    puts "# Welcome to the Battle Arena      #"
    puts "# -------------------------------- #"
    puts "# Description:                     #"
    puts "# 1 type new to create a character #"
    puts "# 2 type start to begin the fight  #"
    puts "# ---------------------------------#"
    input = gets.chomp

    if input == 'new' then
       new_player
       start_menu
    elsif input == 'start'
       if @players.count < 2
         puts "Lack of players"
         start_menu
       else
         start_attack
       end
    end  
  end

  def new_player
    puts "Put Player Name: "
    name = gets.chomp
    @players[name] = Player.new name 
    puts " Current Player: #"
    @players.each do |key, player|
      puts " Player Name #{player.name} .\n "
    end
  end

  def start_attack
    puts "Battle Start:"
    puts "who will attack: "
    attacker = gets.chomp
    puts "who attacked: "
    defender = gets.chomp
    @players[defender].blood = @players[defender].defend
    @players[attacker].manna = @players[attacker].attack
    puts "Description:"
   
  status 
  over
  end
  def status
     @players.each do |key, player| 
      puts "Nama: #{player.name}, manna: #{player.manna}, blood = #{player.blood}.\n"
     
    end
  end
  
  def over
    status=1
    @players.each do |key, player| 
      if player.blood ==0 or player.manna ==0
        puts "Game Over"
        status=0
    end  
    end
    if status==1
      start_attack
     else 
      
       return
    end   
  end
end

menu = Menu.new
menu.start_menu