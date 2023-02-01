# frozen_string_literal: true

module V1
  class StudentsAPI < Grape::API
    helpers API::V1::Helpers

    namespace :students do
      # desc "List all students"
      # params do
      #   use :authorization_token
      # end
      # get do
      #   user_authenticate!
      #   students = Students::List.call(decoded_token, params).result
      #   present students, with: Entities::Student
      # end

      desc "Create a new student"
      params do
        use :authorization_token
        requires :name, type: String, desc: "Name of the student"
        requires :email, type: String, desc: "Email of the student"
        optional :password, type: String, desc: "Password of the student"
      end
      post do
        user_authenticate!
        student = Students::Create.call(decoded_token, params).result
        present student, with: Entities::User
      end

      # desc "Update a student"
      # params do
      #   use :authorization_token
      #   requires :id, type: Integer, desc: "ID of the student"
      #   optional :name, type: String, desc: "Name of the student"
      #   optional :email, type: String, desc: "Email of the student"
      #   optional :password, type: String, desc: "Password of the student"
      # end
      # put do
      #   user_authenticate!
      #   student = Students::Update.call(decoded_token, params).result
      #   present student, with: Entities::Student
      # end
      #
      # desc "Delete a student"
      # params do
      #   use :authorization_token
      #   requires :id, type: Integer, desc: "ID of the student"
      # end
      # delete do
      #   user_authenticate!
      #   Students::Delete.call(decoded_token, params)
      #   status 204
      # end
    end
  end
end
