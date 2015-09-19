class FaceSelectionsController < ApplicationController
  def index
    @face_selections = FaceSelection.where(gender: params[:id])
  end
end
