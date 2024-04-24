class AlumnosController < ApplicationController
  before_action :set_alumno, only: %i[show update destroy]

  def index
    render json: Alumno.all
  end

  def show
    render json: @alumno
  end

  def create
    @alumno = Alumno.new(alumno_params)
    if @alumno.save
      render json: @alumno, status: :created
    else
      render json: @alumno.errors, status: :unprocessable_entity
    end
  end

  def update
    if @alumno.update(alumno_params)
      render json: @alumno, status: :ok
    else
      render json: @alumno.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @alumno.destroy
      head :no_content
    else
      render json: @alumno.errors, status: :unprocessable_entity
    end
  end

  private

  def alumno_params
    params.require(:alumno).permit(:id, :nombre, :matricula)
  end

  def set_alumno
    @alumno = Alumno.find(params[:id])
  end
end
