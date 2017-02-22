class NewGameController < ApplicationController

def reset
  cookies.delete :secret
  cookies.delete :attempts
  cookies.delete :guess
  redirect_to "/game"
end
