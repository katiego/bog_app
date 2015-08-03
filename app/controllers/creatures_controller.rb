class CreaturesController < ApplicationController
  	def index
  		@creatures = Creature.all
  		render :index
 	 end

  	def new
  		@creature = Creature.new(params[:creature])
		render :new
	end

	def create
        creature = params.require(:creature).permit(:species, :description, :location_found)
        Creature.create(creature)
        redirect_to "/creatures"
    end

    def show
    	creature_id = params[:id]
    	@creature = Creature.find(creature_id)
    	render :show
    end

    def edit
    	creature_id = params[:id]
    	@creature = Creature.find(creature_id)
    	render :edit

    end

    def update
    	creature_id = params[:id]
    	#find the creature
    	db_creature = Creature.find(creature_id)
		#form data
        creature_params = params.require(:creature).permit(:species, :description, :location_found)

    	# update the creature in db
    	db_creature.update_attributes(creature_params)

    	# redirect_to "/creatures/#{db_creature.id}"
    	redirect_to "/creatures"
    end

    def destroy
    	creature_id = params[:id]
    	#find the creature
    	db_creature = Creature.find(creature_id)

    	db_creature.destroy()
    	redirect_to "/creatures"
    end







end