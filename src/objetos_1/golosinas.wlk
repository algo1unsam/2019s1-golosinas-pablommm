

object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
}

object alfajor {
	var peso = 300
		
	method precio() { return 12 }
	method peso() { return peso }
	method gusto() { return "chocolate" }
	method libreGluten() { return false }
	method mordisco() { peso = peso * 0.8 }
}

object caramelo {
	var peso = 5
	method precio() { return 1  }
	method peso() { return peso }
	method gusto() { return "frutilla" }
	method libreGluten() { return true }
	method mordisco() { peso -= 1}
}	

object chupetin {
	var peso = 7
	
	method precio() { return 2  }
	method peso() { return peso }
	method gusto() { return "naranja" }
	method libreGluten() { return true }
	method mordisco() { if (peso>2){
			peso= (peso * 0.9).truncate(1)
	}else{
		//nada
		}
	}	
}

object oblea {
	var peso = 250
	method precio() { return 5  }
	method peso() { return peso }
	method gusto() { return "vainilla" }
	method libreGluten() = false 
	method mordisco() { if (peso>70){
		peso = (peso * 0.5).truncate(1)
		}else{
			peso = (peso * 0.25).truncate(1)
		}
	}
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial 
	var pesoActual 
	method pesoInicial(cuanto){
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method precio() { return pesoInicial * 0.5 }
	method libreGluten() { return false }
	method gusto() { return "chocolate" }
	method mordisco() { pesoActual = pesoActual - 2 }
	method peso(){return pesoActual	}
	}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
		
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2  }
	method peso() { return golosinaInterior.peso() + pesoBanio  }
	
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() { return golosinaInterior.libreDeGluten() }	
	}

object tuttifrutti {
	// como manejar el cambio de sabor ??
	var gusto = frutilla
	var property libreGluten = false
	method peso(){ return 5 }
	method libreDeGluten() {return libreGluten}
	method precio() = if (libreGluten) 7 else 10
	method gusto() = gusto
	method mordisco() = (gusto = gusto.siguiente())
	
}

object frutilla{
	method siguiente() = chocolate
}
object chocolate{
	method siguiente() = naranja
}
object naranja{
	method siguiente() = frutilla
}