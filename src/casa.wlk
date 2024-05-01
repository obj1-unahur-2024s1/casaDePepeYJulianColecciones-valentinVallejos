import cosas.* //obviamente, vamos a usar los objetos del archivo cosas ;-)
import cuentaBancaria.*
object casa {
	var cosas = []
	var cuentaDeLaCasa = cuentaCorriente
	
	method cuentaDeLaCasa(unaCuenta){
		cuentaDeLaCasa = unaCuenta
	}

	method comprar(cosa){
		cosas.add(cosa)
		cuentaDeLaCasa.extraer(cosa.precio())
	}
	
	method dineroDisponible() = cuentaDeLaCasa.saldo()
	
	method gastar(importe){
		cuentaDeLaCasa.extraer(importe)
	}
	 
	
	method cantidadDeCosasCompradas() = 	cosas.size()
	
	method tieneComida() =  cosas.any( {cosa => cosa.esComida()} )
	
	method vieneDeEquiparse() = (cosas.last().esElectrodomestico()) || (cosas.last().precio() > 50000)
	
	method esDerrochona() = cosas.sum( {cosa => cosa.precio()}  ) > 90000
	
	method compraMasCara() = cosas.max( { cosa => cosa.precio() } )
	
	method electrodomesticosComprados() = cosas.filter ( { cosa => cosa.esElectrodomestico() } )
	
	method malaEpoca() = cosas.all( {cosa => cosa.esComida()} )
	
	method queFaltaComprar(lista) = lista.asSet().difference(cosas.asSet())
	
	method faltaComida() = cosas.count( {cosa => cosa.esComida()} ) <= 2
}
