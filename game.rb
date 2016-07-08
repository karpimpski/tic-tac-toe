class Player
    attr_accessor :value, :active
    @active = false
    def initialize(value)
       @value = value 
    end
end

def choose(player_one, player_two, values)
    player_one.active = !player_one.active # Change player activity.
    player_two.active = !player_two.active
    player_one.active ? active_player = player_one : active_player = player_two # Choose active player.
    choice = 10
    until (choice <= 8 and choice >= 0) and (values[choice] != "X" and values[choice] != "O")
        p "#{active_player.value}, please choose a box."
        choice = gets.chomp.to_i
    end
    values[choice] = active_player.value
end

def show_board(values)
    p "| #{values[0]} | #{values[1]} | #{values[2]} |"
    p "-------------"
    p "| #{values[3]} | #{values[4]} | #{values[5]} |"
    p "-------------"
    p "| #{values[6]} | #{values[7]} | #{values[8]} |"
end

def victory_check(values)
    victor = ""
    if check_boxes(0,1,2, values)
        victor = values[0]
    elsif check_boxes(0,4,8, values)
        victor = values[0]
    elsif check_boxes(0,3,6, values)
        victor = values[3]
    elsif check_boxes(1,4,7, values)
        victor = values[1]
    elsif check_boxes(2,5,8, values)
        victor = values[2]
    elsif check_boxes(2,4,6, values)
        victor = values[2]
    elsif check_boxes(3,4,5, values)
        victor = values[3]
    elsif check_boxes(6,7,8, values)
        victor = values[6]
    end
    return victor
end

def check_boxes(box_one, box_two, box_three, values)
    if values[box_one] == values[box_two] and values[box_two] == values[box_three]
        return true
    end
    false
end

values = ['0','1','2','3','4','5','6','7','8']

player_one = Player.new("X")
player_two = Player.new("O")

show_board(values)

player_two.active = true
count = 0

until victory_check(values) != "" or count == 9 # Only run loop if the amount of turns is below 9 or the victory hasn't been reached.
    choose(player_one, player_two, values) # Choose tile.
    show_board(values)
    count += 1
end

if victory_check(values) != "" 
    puts "#{victory_check(values)} is the winner!" 
else 
    puts "It's a tie!"
end