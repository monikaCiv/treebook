class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :email, :password, :password_confirmation, :remember_me,
  # :first_name, :last_name, :profile_name

  
  # VALIDATES - za potrebe testa
  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                            with: /a-zA-Z0-9_-/,
                            message: 'Must be formatted correctly.'
                           }  

  #definiraj da jedan korisnik može imati puno statusa, relacija podataka
  has_many :statuses

  
  #stvori atribut full_name koji se sastoji od sljedećeg
  def full_name
  	first_name + " " + last_name #vraća ime i prezime zajedno
  end

end
