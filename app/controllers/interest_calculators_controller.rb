class InterestCalculatorsController < ApplicationController
  # GET /interest_calculators
  # GET /interest_calculators.xml
  def index
    @interest_calculators = InterestCalculator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interest_calculators }
    end
  end

  # GET /interest_calculators/1
  # GET /interest_calculators/1.xml
  def show
    @interest_calculator = InterestCalculator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interest_calculator }
    end
  end

  # GET /interest_calculators/new
  # GET /interest_calculators/new.xml
  def new
    @interest_calculator = InterestCalculator.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interest_calculator }
    end
  end

  # GET /interest_calculators/1/edit
  def edit
    @interest_calculator = InterestCalculator.find(params[:id])
  end

  # POST /interest_calculators
  # POST /interest_calculators.xml
  def create
    @interest_calculator = InterestCalculator.new(params[:interest_calculator])

    respond_to do |format|
      if @interest_calculator.save
        format.html { redirect_to(@interest_calculator, :notice => 'Interest calculator was successfully created.') }
        format.xml  { render :xml => @interest_calculator, :status => :created, :location => @interest_calculator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interest_calculator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interest_calculators/1
  # PUT /interest_calculators/1.xml
  def update
    @interest_calculator = InterestCalculator.find(params[:id])

    respond_to do |format|
      if @interest_calculator.update_attributes(params[:interest_calculator])
        format.html { redirect_to(@interest_calculator, :notice => 'Interest calculator was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interest_calculator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interest_calculators/1
  # DELETE /interest_calculators/1.xml
  def destroy
    @interest_calculator = InterestCalculator.find(params[:id])
    @interest_calculator.destroy

    respond_to do |format|
      format.html { redirect_to(interest_calculators_url) }
      format.xml  { head :ok }
    end
  end
end
