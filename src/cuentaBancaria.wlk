object cuentaCorriente {
	var saldo = 30000
	
	method saldo() = saldo
	
	method depositar(importe){
		saldo = saldo + importe
	}
	
	method extraer(importe){
		saldo = 0.max(saldo - importe)
	}
	
}

object cuentaConGastos{
	var saldo = 2000000
	
	method saldo() = saldo
	
	method depositar(importe){
		saldo = saldo + 0.max(importe - 200)
	}
	
	method extraer(importe){
		saldo = 0.max( saldo - if(importe <= 10000) (importe + 200) else importe* 1.02 )
	}
}

object cuentaCombinada{
	var cuentaPrimaria = cuentaCorriente
	var cuentaSecundaria = cuentaConGastos

	
	method saldo() = cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
	
	method depositar(importe){
		cuentaPrimaria.depositar(importe)
	}
	
	method extraer(importe){
		if ( cuentaPrimaria.saldo() >= importe ){
			cuentaPrimaria.extraer(importe)
		}
		else {
			cuentaSecundaria.extraer(importe)
		}
	}
}