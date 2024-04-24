require "test_helper"

class AlumnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alumno = Alumno.create(nombre: 'John Doe', matricula: 'ABC123')
  end

  test 'should get index' do
    get alumnos_url
    assert_response :success
  end

  test 'should create alumno' do
    assert_difference('Alumno.count') do
      post alumnos_url, params: { alumno: { nombre: 'Jane Smith', matricula: 'DEF456' } }
    end
    assert_response :created
  end

  test 'should not create invalid alumno' do
    assert_no_difference('Alumno.count') do
      post alumnos_url, params: { alumno: { nombre: '', matricula: 'DEF456' } }
    end
    assert_response :unprocessable_entity
  end

  test 'should show alumno' do
    get alumno_url(@alumno)
    assert_response :success
  end

  test 'should update alumno' do
    patch alumno_url(@alumno), params: { alumno: { nombre: 'Updated Name' } }
    assert_response :success
  end

  test 'should not update invalid alumno' do
    patch alumno_url(@alumno), params: { alumno: { nombre: '' } }
    assert_response :unprocessable_entity
  end

  test 'should destroy alumno' do
    assert_difference('Alumno.count', -1) do
      delete alumno_url(@alumno)
    end
    assert_response :no_content
  end
end
