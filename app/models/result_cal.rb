class ResultCal
    def initialize(result)
      @result = result
    end

    def moisturize
      @moisture_result = ((@result.Wsc - @result.Wca)/ @result.Ws) * 100
      @moisture_result.round(2)
    end

    def protein
      if @result.proteinrich?
        @protein_result = (((10 - @result.Tv)*1.0047)*6.25)/ @result.Ws
        @protein_result.round(2)
      else
        @protein_result = (((10 - @result.Tv)*1.0047)*5.72)/ @result.Ws
        @protein_result.round(2)
      end
    end

    def Turbidity
      @turbidity_result = (@result.Abs * @result.T)/2.71
      @turbidity_result.round(2)
    end

    def Color
      @color_result = @turbidity_result/1.48
      @color_result.round(2)
    end

    def BOD 
      @bod_result = @result.DO5 -  @result.DO1
    end

    def Creatinine
      @creatinine = (@result.DABSsample / @result.DABSstd) * 2.05
      @creatinine.round(2)
    end
end
  