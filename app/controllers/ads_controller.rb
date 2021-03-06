class AdsController < ApplicationController
  def index
    @ads = Ad.all

    render("ad_templates/index.html.erb")
  end

  def show
    @ad = Ad.find(params.fetch("id_to_display"))

    render("ad_templates/show.html.erb")
  end

  def new_form
    @ad = Ad.new

    render("ad_templates/new_form.html.erb")
  end

  def create_row
    @ad = Ad.new

    @ad.location = params.fetch("location")
    @ad.file=params.fetch("file")

    if @ad.valid?
      @ad.save

      redirect_back(:fallback_location => "/ads", :notice => "Ad created successfully.")
    else
      render("ad_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ad = Ad.find(params.fetch("prefill_with_id"))

    render("ad_templates/edit_form.html.erb")
  end

  def update_row
    @ad = Ad.find(params.fetch("id_to_modify"))

    @ad.location = params.fetch("location")

    if @ad.valid?
      @ad.save

      redirect_to("/ads/#{@ad.id}", :notice => "Ad updated successfully.")
    else
      render("ad_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @ad = Ad.find(params.fetch("id_to_remove"))

    @ad.destroy

    redirect_to("/ads", :notice => "Ad deleted successfully.")
  end
end
