class GameController < ApplicationController

  def try

    # If a secret number is not already assigned
    if (cookies[:secret] == nil) || (cookies[:secret] == 0)
      # assign a random number between 1 and 100 inclusive
      r = Random.new
      cookies[:secret] = r.rand(1..100)
      cookies[:attempts] = 0
    end

    @attempts = cookies[:attempts].to_i
    @attempts += 1

  # Checking secret number against the guess parameter
    if (params[:guess].to_i > cookies[:secret].to_i) && (cookies[:attempts].to_i < 8)
      @result = "It is too High"
      cookies[:attempts] = @attempts
    elsif (params[:guess].to_i < cookies[:secret].to_i) && (cookies[:attempts].to_i < 8)
      @result = "It is too Low"
      cookies[:attempts] = @attempts
    elsif (params[:guess].to_i == cookies[:secret].to_i) && (cookies[:attempts].to_i < 8)
      @result = "Correct! You Win!"
      cookies.delete :secret
      cookies.delete :attempts
    else
      @result = "Game Over. You Lose."
    end

    render "try.html.erb"
  end

end
