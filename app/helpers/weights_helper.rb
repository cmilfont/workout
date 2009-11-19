module WeightsHelper

  def format_weight(value)
    retorno = "0.000"
    index = value.to_s.index(".")
    if index
      decimal = value.to_s[(index + 1)..-1]
      decimal = decimal + "0"  if(decimal.length == 2)
      decimal = decimal + "00" if(decimal.length == 1)
      retorno = value.to_s[0..index] + decimal + " kg"
    else
      retorno = value.to_s + ".000 kg"
    end
  end

end

