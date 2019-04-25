class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  belongs_to :city,  optional: true
  has_many :JoinTableDoctorSpecialties, dependent: :destroy
  has_many :specialties, through: :JoinTableDoctorSpecialties
end
