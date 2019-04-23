import golosinas.*

object mariano {
	var golosinas = []
	method golosinas(){ return golosinas }	
	method comprar(golosina) { 
		golosinas.add(golosina)
	}
	method desechar(golosina){
		golosinas.remove(golosina)
	}
	method probarGolosinas() {
		golosinas.forEach({golosina => golosina.mordisco()}) 
		// para el metodo hayGolosinaSinTACC() : no usar el forEach
	}
	method hayGolosinasSinTACC(){
		return golosinas.any ({golosina => golosina.libreGluten()})
	}
	method preciosCuidados(){
		return golosinas.all({golosina => (golosina.precio())<=10})
	}
	method golosinaDeSabor(saborr){
		return golosinas.find{ golosina => golosina.gusto()}
			}
	method golosinasDeSabor(saborr){
		return golosinas.filter{ golosina => golosina.gusto(saborr) }
	}
	method sabores(){
		return golosinas.map{ golosina => (golosina.gusto())
		}.asSet
	}
	method golosinaMasCara(){
		return  golosinas.max{ golosina => golosina.precio() }
		}
	method pesoGolosinas(){
		return golosinas.sum { golosina => golosina.peso() }
	}
	method golosinasFaltantes(golosinasDeseadas){
		return golosinasDeseadas.difference(golosinas)
	}
	method gustosFaltantes(gustosDeseados){
		return gustosDeseados.difference(golosinas.map{
			golosina=>golosina.gusto()})
	}		
}
