class AnimalAdoptarFoto < ActiveRecord::Base
  belongs_to :animal_adoptar

  validates :imagen, :presence => {message: "colocar la imagen"}

  def to_s
  imagen
  end
end
