require 'erb'
require 'net/http'
require 'uri'
require 'json'
require 'rails'
#classes
require_relative 'SqlConnection'
# require_relative 'DbConnection''
require_relative 'GitTrends'
require_relative 'ManageData'

class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy]

  # GET /repositories
  # GET /repositories.json
  def index
    @repositories = Repository.all
  end

  # GET /repositories/1
  # GET /repositories/1.json
  def show
  end

  # GET /repositories/new
  def new
    @repository = Repository.new
  end

  # GET /repositories/1/edit
  def edit
  end

  # POST get_trend
  def get_trend
    @msg= ""
    # Delete previous data from the table.
    # con = DbConnection.new
    # sv = con.connect('db', 'root', 'example', 'gitapidb')
    Repository.destroy_all unless Repository.count < 1
    @msg << "Deletadas todas as rows antigas <br><br>"
    # sv.query('delete from repositories where 1')
    # Http get to the github api.
    get = GitTrends.new
    h = get.get_git_trends unless Repository.count > 5

    num_items = h["items"].count

    # While to print and query the statements. (Change to .each or something)
      @md = ManageData.new
      num_items.times do |i|
        sql = @md.hash_to_sql(h,i)
      #rs = sv.query(sql)
        id = h["items"][i]["id"]
        user = h["items"][i]["owner"]["login"];
        user = user.gsub("'"," ")

        nome = h["items"][i]["name"];
        nome = nome.gsub("'"," ")

        # Those gsubs are to avoid problems with quotes.
        desc = h["items"][i]["description"];
        desc = desc.to_s.gsub("'", " ") unless desc.nil?

        stars = h["items"][i]["stargazers_count"];

        @msg << "#{sql} <br>"
        r = Repository.new
        r.repo_id = id
        r.user = user
        r.name = nome
        r.description = desc
        r.stars = stars
        r.save
    end
  end

  def list_trend
    #@repositories = Repository.all
  end

  # POST /repositories
  # POST /repositories.json
  def create
    @repository = Repository.new(repository_params)

    respond_to do |format|
      if @repository.save
        format.html { redirect_to @repository, notice: 'Repository was successfully created.' }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :new }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repositories/1
  # PATCH/PUT /repositories/1.json
  def update
    respond_to do |format|
      if @repository.update(repository_params)
        format.html { redirect_to @repository, notice: 'Repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @repository }
      else
        format.html { render :edit }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repositories/1
  # DELETE /repositories/1.json
  def destroy
    @repository.destroy
    respond_to do |format|
      format.html { redirect_to repositories_url, notice: 'Repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repository_params
      params.require(:repository).permit(:repo_id, :name, :user, :description, :stars)
    end
end
