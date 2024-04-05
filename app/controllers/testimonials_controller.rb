class TestimonialsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_testimonial, only: [:edit, :update, :destroy]

  def index
    @testimonials = user_signed_in? ? Testimonial.sorted : Testimonial.published.sorted
  end

  def new
    @testimonial = Testimonial.new
  end

  # since anyone can submit testimonials, default to draft mode
  def create
    @testimonial = Testimonial.new(testimonial_params.merge(published_at: nil))
    if @testimonial.save
      redirect_to testimonials_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @testimonial.update(testimonial_params)
      binding.irb
      redirect_to testimonials_path, notice: "Testimonial updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @testimonial.destroy
    redirect_to testimonials_path
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:name, :city, :content, :published_at)
  end

  def set_testimonial
    @testimonial = user_signed_in? ? Testimonial.find(params[:id]) : Testimonial.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

end
