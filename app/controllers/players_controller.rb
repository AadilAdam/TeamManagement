class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  # GET /teams/:team_id/players
  def index
    @team = Team.find(params[:team_id]) # simplified, this will probably make use of strong params in your actual code
    @players = @team.players.page(params[:page]).per(3)
    #User.page(7).per(50)
    
    #binding.pry
    #@players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @team = Team.find(params[:team_id]) # simplified, this will probably make use of strong params in your actual code
    @players = @team.players
    #@player = Player.find(params[:id])
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    render layout: false
    respond_to do |format|
      format.html
      # format.js 
    end
  end

  # POST /players
  # POST /players.json
  def create

    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to team_player_path(team_id: @player.team_id, id: @player.id), notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to team_player_path(team_id: @player.team_id, id: @player.id), notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy

    #@player = Player.find(params[:id])
    #@team = @player.post
    @player.destroy
    #binding.pry
    respond_to do |format|
      format.html { redirect_to team_players_path, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_team
      @team = Team.find(params[:team_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :description, :image, :team_id)
    end
end

############################
# def create
#     @article = Article.find(params[:article_id])

#     @comment = @article.comments.create(comment_params)
#     redirect_to article_path(@article)
#   end

#   def destroy
#     @article = Article.find(params[:article_id])

#     @comment = @article.comments.fincd(params[:id])

#     @comment.destroy
#     redirect_to article_path(@article)
#   end


#   private
#     def comment_params
#       params.require(:comment).permit(:commenter, :body)
#     end
