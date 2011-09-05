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
    cur_params = params[:game]
    @game = Game.find(params[:id])
    unless @game.guesses.include? cur_params[:guesses]
      @game.update_attributes(:guesses => @game.guesses << cur_params[:guesses])
      puts '---------------------'
      puts @game.guesses
      puts '---------------------'
    end

    redirect_to(@game)
  end

  def create
    @game = Game.new(params[:game])
    @game.word = Word.random_word
    @game.status = "In Progress"
    @game.guesses = ""

    respond_to do |format|
      if @game.save
        format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
        format.xml { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

end