-- Number Guessing Game
math.randomseed(os.time())

function get_valid_guess()
    while true do
        io.write("Enter your guess (1-100): ")
        local input = io.read()
        local guess = tonumber(input)
        if guess and guess >= 1 and guess <= 100 then
            return guess
        else
            print("Wrong Please enter a number between 1 and 100.")
        end
    end
end

function play_round()
    local secret = math.random(1, 100)
    local max_attempts = 7
    for attempt = 1, max_attempts do
        print("Attempt " .. attempt .. " of " .. max_attempts)
        local guess = get_valid_guess()
        if guess == secret then
            print("Congratulations! You're Winner")
            return true, secret
        elseif guess < secret then
            print("Too low!")
        else
            print("Too high!")
        end
    end
    print("Sorry, you've FAILED.")
    return false, secret
end

function play_game()
    print("Welcome to the Number Guessing Game!")
    while true do
        local won, secret = play_round()
        print("The secret number was: " .. secret)
        io.write("Want to play again? (y/n): ")
        local answer = io.read()
        if answer:lower() ~= 'y' then
            print("so long!")
            break
        end
    end
end

play_game()
