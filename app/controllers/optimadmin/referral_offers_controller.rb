module Optimadmin
  class ReferralOffersController < Optimadmin::ApplicationController
    load_and_authorize_resource
    before_action :set_referral_offer, only: [:show, :edit, :update, :destroy]

    def index
      @referral_offers = Optimadmin::BaseCollectionPresenter.new(collection: ReferralOffer.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ReferralOfferPresenter)
    end

    def show
    end

    def new
      @referral_offer = ReferralOffer.new
    end

    def edit
    end

    def create
      @referral_offer = ReferralOffer.new(referral_offer_params)
      if @referral_offer.save
        redirect_to referral_offers_url, notice: 'Referral offer was successfully created.'
      else
        render :new
      end
    end

    def update
      if @referral_offer.update(referral_offer_params)
        redirect_to referral_offers_url, notice: 'Referral offer was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @referral_offer.destroy
      redirect_to referral_offers_url, notice: 'Referral offer was successfully destroyed.'
    end

    private

    def set_referral_offer
      @referral_offer = ReferralOffer.find(params[:id])
    end

    def referral_offer_params
      params.require(:referral_offer).permit(:title, :details, :terms_and_conditions, :display)
    end
  end
end
