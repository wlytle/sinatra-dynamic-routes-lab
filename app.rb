require_relative "config/environment"
require "pry"

class App < Sinatra::Base
  get "/reversename/:name" do
    @reverse_name = params[:name].split("").reverse.join
    "#{@reverse_name}"
  end

  get "/square/:number" do
    @number = params[:number].to_i
    "#{@number ** 2}"
  end

  get "/say/:number/:phrase" do
    @phrase = params[:phrase]
    @number = params[:number].to_i
    erb :say
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @phrase = params.map { |key, value| value }
    "#{@phrase.join(" ")}."
  end

  get "/:operation/:number1/:number2" do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i

    case @operation
    when "add"
      "#{@num1 + @num2}"
    when "subtract"
      "#{@num1 - @num2}"
    when "multiply"
      "#{@num1 * @num2}"
    when "divide"
      "#{@num1 / @num2}"
    else
      "That's not arithmatic"
    end
  end
end
