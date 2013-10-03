class OffersController < ApplicationController
  
  load_and_authorize_resource
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])
    
    @venue_name= Venue.find(@offer.venue_id).venue_name
    @offer_opinions = @offer.opinions
    if @offer_opinions.first
      @offer_opinions = Opinion.all_offer_opinions(@offer.id)
      #@offer_opinions = @offer_opinions.joins('LEFT OUTER JOIN users ON users.id = opinions.user_id').select('title, description, points, username')
    end
    puts @offer_opinions.to_yaml
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    @offer = Offer.new
    if can? :manage, @offer
      @venue_names = current_user.venues.pluck(:venue_name)
      #@venue_names = current_user.venues.select('venues.id, venue_name')
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @offer }
      end
    else
      redirect_to offers_path
    end
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
    respond_to do |format|
      if user_owns_offer?(@offer) 
        @venue_names = current_user.venues.pluck(:venue_name)
        @venue_names.unshift(@offer.venue.venue_name)
        @venue_names.uniq!
        format.html 
      else
        format.html {redirect_to :status => 422}
      end
    end 
  end

  # POST /offers
  # POST /offers.json
  def create
    venue = Venue.find_by_venue_name(params[:venue_name])
    if current_user.venues.include?(venue)
      received = params[:offer]
      received[:venue_id] = venue.id
      @offer = Offer.new(received)

      respond_to do |format|
        if @offer.save
          format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
          format.json { render json: @offer, status: :created, location: @offer }
        else
          @venue_names = current_user.venues.pluck(:venue_name)
          format.html { render action: "new" }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_offer_path
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])
    if user_owns_offer?(@offer)
      respond_to do |format|
        if @offer.update_attributes(params[:offer])
          format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html {redirect_to :status => 422}
    end  
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    respond_to do |format|
      if user_owns_offer?(@offer)
        @offer.destroy
        format.html { redirect_to offers_url }
        format.json { head :ok }       
      else
        format.html {redirect_to :status => 422}
      end 
    end 
  end

  def create_opinion
    
    Opinion.create(description: params[:user_opinion], title: params[:title_opinion], points: params[:points], 
          offer_id: params[:offer], user_id: current_user.id)
    @offer = Offer.find(params[:offer])
    @offer.points = mean_calc 
    @offer.number += 1
    @offer.save
    @offer_opinions = @offer.opinions
    if @offer_opinions.first
      @offer_opinions = Opinion.all_offer_opinions(@offer.id)
     # @offer_opinions = @offer_opinions.joins('LEFT OUTER JOIN users ON users.id = opinions.user_id').select('title, description, points, username')
    end

    respond_to do |format|
      format.json {render json: {status_ok: true, offer_opinions: @offer_opinions}}
      format.js 
    end
  end

  def mean_calc
    (@offer.points.to_f * @offer.number + params[:points].to_f)/(@offer.number.to_f + 1).to_f 
  end

  def delete_values_default
    opinions = Opinion.all
    opinions.each do |o|
      o.destroy
    end
    @offer = Offer.find(params[:offer])
    @offer.points = 0
    @offer.number = 0
    @offer.save
  end

end
