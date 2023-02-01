# frozen_string_literal: true

class HealthController < ApplicationController
  def health_check
    render json: { status: "ok" }
  end
end
