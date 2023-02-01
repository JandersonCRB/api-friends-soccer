# frozen_string_literal: true

module V1
  class PersonalTrainersAPI < Grape::API
    helpers API::V1::Helpers

    namespace :personal_trainers do
      desc "Create a new personal trainer"
      params do
        use :authorization_token
        requires :name, type: String, desc: "Name of the personal trainer"
        requires :email, type: String, desc: "Email of the personal trainer"
        optional :password, type: String, desc: "Password of the personal trainer"
      end
      post do
        user_authenticate!
        personal_trainer = PersonalTrainer::Create.call(decoded_token, params).result
        present personal_trainer, with: Entities::User
      end
    end
  end
end
