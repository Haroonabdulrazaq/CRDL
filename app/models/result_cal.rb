class ResultCal
    def initialize(result)
      @result = result
    end

    def moisturize
      @moisture_result = ((@result.Wsc - @result.Wca)/ @result.Ws) * 100
      @moisture_result.round(4)
    end

    def protein
      if @result.proteinrich?
        @protein_result = (((10 - @result.Tv)*1.0047)*6.25)/ @result.Ws
        @protein_result.round(4)
      else
        @protein_result = (((10 - @result.Tv)*1.0047)*5.72)/ @result.Ws
        @protein_result.round(4)
      end
    end

    def Turbidity
      @turbidity_result = (@result.Abs * @result.T)/2.71
      @turbidity_result.round(4)
    end

    def Color
      @color_result = @turbidity_result/1.48
      @color_result.round(4)
    end

    def BOD 
      @bod_result = @result.DO5 -  @result.DO1
    end

    def Creatinine
      @creatinine = (@result.DABSsample / @result.DABSstd) * 2.05
      @creatinine.round(4)
    end

    def Saponification
      @saponification = (56.1 * (@result.Bsap - @result.Ssap) * @result.Nsap)/ @result.Wsap
      @saponification.round(4)
    end
    
    def Acid_value
      @acid_value = (56.1 * @result.Va * @result.Na)/ @result.Wa
      @acid_value.round(4)
    end

    def Fatty_acid
      @fatty_acid = @acid_value / 2
      @fatty_acid.round(4)
    end

    def Iodine_value
      @iodine_value = ((@result.bi - @result.Si) * @result.Ni)/ @result.Wi
      @iodine_value.round(4)
    end

    def Polenske_value
      @polenske_value = @result.Vp * @result.Np
      @polenske_value.round(4)
    end
end
  