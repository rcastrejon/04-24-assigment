require "test_helper"

class AlumnoTest < ActiveSupport::TestCase
  @@alumno = {nombre: 'New Nancy', matricula: 'NE99999'}

  test 'should validate presence of nombre' do
    alumno = Alumno.new(matricula: @@alumno[:matricula])
    assert_not alumno.valid?
    assert_includes alumno.errors.full_messages, "Nombre can't be blank"
  end

  test 'should validate presence of matricula' do
    alumno = Alumno.new(nombre: @@alumno[:nombre])
    assert_not alumno.valid?
    assert_includes alumno.errors.full_messages, "Matricula can't be blank"
  end

  test 'should validate uniqueness of matricula' do
    john = alumnos(:john)
    alumno = Alumno.new(nombre: @@alumno[:nombre], matricula: john.matricula)
    assert_not alumno.valid?
    assert_includes alumno.errors.full_messages, 'Matricula has already been taken'
  end

  test 'should validate numericality of id' do
    alumno = Alumno.new(id: -1, nombre: @@alumno[:nombre], matricula: @@alumno[:matricula])
    assert_not alumno.valid?
    assert_includes alumno.errors.full_messages, 'Id must be greater than 0'
  end

  test 'should validate uniqueness of id' do
    john = alumnos(:john)
    alumno = Alumno.new(id: john.id, nombre: @@alumno[:nombre], matricula: @@alumno[:matricula])
    assert_not alumno.valid?
    assert_includes alumno.errors.full_messages, 'Id has already been taken'
  end

  test 'should normalize nombre' do
    alumno = Alumno.create(nombre: "  #{@@alumno[:nombre]}  ", matricula: @@alumno[:matricula])
    assert_equal @@alumno[:nombre], alumno.nombre
  end

  test 'should normalize matricula' do
    alumno = Alumno.create(nombre: @@alumno[:nombre], matricula: "  #{@@alumno[:matricula]}  ")
    assert_equal @@alumno[:matricula], alumno.matricula
  end
end
