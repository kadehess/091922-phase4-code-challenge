class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
     rescue_from ActiveRecord::RecordInvalid, with: :create_error

     def index
         heroes = Hero.all
         render json: heroes, include: ['id','name','super_name']
     end

     def show
       hero = find_hero
       render json: hero
     end

     def create
         hero = Hero.create!(hero_param)
         render json: hero,  status: :ok
     end

     def destroy
         hero = find_hero
         hero.destroy
         head :no_content
     end

     private 

     def find_hero
         Hero.find(params[:id])
     end

     def render_not_found_response
         render json: { error: "Hero not found" }, status: :not_found
     end

     def create_error
         render json: { error:  ["validation errors"]}, status: :unprocessable_entity
     end

     def hero_param
         params.permit(:name, :super_name)
     end
end
