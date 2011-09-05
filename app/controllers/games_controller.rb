class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @current_word = @game.current_word
  end

  def new
    @game = Game.new
  end

  def update
    @game = Game.find(params[:id])
    unless params[:game][:guesses].length > 1
      cur_params = params[:game]
      unless @game.guesses.include? cur_params[:guesses]
        temp_guess = @game.guesses.to_s + cur_params[:guesses].to_s.upcase
        @game.update_attributes(:guesses => temp_guess)
      end

      win = @game.word.split(//).collect do |c|
        c if @game.guesses.include? c
      end

      @game.update_attributes(:status => 'Won!') if win.join.match @game.word
    else
      flash[:notice] = 'Only 1 guess at a time!'
    end

    redirect_to(@game)
  end

  def create
    @game = Game.new(params[:game])
    @game.word = Word.random_word
    @game.status = "In Progress"
    @game.guesses = ""
    @game.save
    redirect_to @game
  end

end
