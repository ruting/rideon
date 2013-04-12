class RoutesController < ApplicationController

before_filter :authenticate_user! # Only login users can be able to view routes

def index
    @routes = Route.all # Use @ for views to be able to see it
end


def new
  @route = Route.new # Create new route
  @source = Source.new
  # @destination = Destination.new
   # respond_to do |format|
   #   format.html  new.html.erb
   #   format.json { render json: @route }
   # end

end

 def create
    @route = Route.new(params[:route])
    @source = Source.new(params[:source])
    @destination = Destination.new(params[:destination])
     respond_to do |format|
       if @route.save 
          @source.route_id = @route.id
          @destination.route_id = @route.id
          @source.save
          @destination.save
          format.html { redirect_to routes_url, notice: 'User was successfully created.' }
          #format.json { render json: @route, status: :created, location: @route }
       else
          format.html { render action: "new" }
          #format.json { render json: @route.errors, status: :unprocessable_entity }
       end
     end
  end

  def edit
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
     @route = Route.find_by_id(params[:id])
     @route.destroy 

    respond_to do |format|
       format.html { redirect_to routes_url }
       format.json { head :no_content }
     end
  end

end
