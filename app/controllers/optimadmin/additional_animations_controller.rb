module Optimadmin
  class AdditionalAnimationsController < Optimadmin::ApplicationController
    before_action :set_additional_animation, only: [:show, :edit, :update, :destroy]

    def index
      @additional_animations = Optimadmin::BaseCollectionPresenter.new(collection: AdditionalAnimation.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::AdditionalAnimationPresenter)
    end

    def show
    end

    def new
      @additional_animation = AdditionalAnimation.new
    end

    def edit
    end

    def create
      @additional_animation = AdditionalAnimation.new(additional_animation_params)
      if @additional_animation.save
        redirect_to additional_animations_url, notice: 'Additional animation was successfully created.'
      else
        render :new
      end
    end

    def update
      if @additional_animation.update(additional_animation_params)
        redirect_to additional_animations_url, notice: 'Additional animation was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @additional_animation.destroy
      redirect_to additional_animations_url, notice: 'Additional animation was successfully destroyed.'
    end

  private


    def set_additional_animation
      @additional_animation = AdditionalAnimation.find(params[:id])
    end

    def additional_animation_params
      params.require(:additional_animation).permit(:animation_type, :animation_delay, :active)
    end
  end
end
