class AnimalAdoptar < ActiveRecord::Base
	has_many :animal_adoptar_fotos, dependent: :destroy
	accepts_nested_attributes_for :animal_adoptar_fotos, reject_if: proc {|attributes| attributes ['imagen'].blank?},allow_destroy: true
	#Atributos anidados

	validates :tipo, :presence => {:message => "Debe seleccionar el tipo: PERRO o GATO"}
	validates :tipo, :presence => {:message => "Debe indicar la raza del perro"}
	validates :tipo, :presence => {:message => "Debe seleccionar el genero"}
	validates :tipo, :presence => {:message => "Debe escribir una descripción"}
	validates :tipo, :presence => {:message => "Debe colocar la edad aproximada"}



end
