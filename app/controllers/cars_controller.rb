class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to cars_path, notice: 'Car created successfully!'
    else
      render "new"
    end
  end

  private

    def car_params
      params.require(:car).permit(:manufacturer_id, :color, :year,
        :mileage, :description)
    end
end
