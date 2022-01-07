class CobrancaController < ApplicationController
  def index
    @cobrancas = Parcela.find_by_sql("select * from parcelas where pago=false and data_vencimento <= '#{Date.today}'")
  end

  def update
    @cobranca = Parcela.find(params[:id])
    if @cobranca.update(params.require(:parcela).permit(:pago))
      redirect_to cobrancas_path
    end
  end
end
