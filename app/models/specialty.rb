class Specialty < ApplicationRecord
  has_many :JoinTableDoctorSpecialties, dependent: :destroy
  has_many :doctors, through: :JoinTableDoctorSpecialties
end
