import cosas.*
object camion {
    var pesoTotal = 1000
    const cargaTotal = []
    method pesoTotal() = pesoTotal
    method cargaTotal() = cargaTotal

    method cargar(objeto) {
        pesoTotal = pesoTotal + objeto.peso()
        cargaTotal.add(objeto)
    }
    method descargar(objeto) {
        pesoTotal = pesoTotal - objeto.peso()
        cargaTotal.remove(objeto)
    }

    method cargaTotalEsPar() = cargaTotal.all({c => c.peso().even()})

    method consultarUnaCargaConPeso(valor) = cargaTotal.any({c => c.peso() == valor})

    method nivelPeligroPrimeraCarga(valor) = cargaTotal.findOrElse({c => c.nivelPeligro() == valor}, {"no hay"})

    method cargasConPeligroArribaDe(nivelPeligro) =
        cargaTotal.filter({c => c.nivelPeligro() > nivelPeligro})

    method cargasQueSuperenNivelPeligroDe(unaCarga) = 
        self.cargasConPeligroArribaDe(unaCarga.nivelPeligro())

    method estaExedido() = pesoTotal > 2500

    method puedeCircularEnRutaDeNivel(nivelPeligro) = not self.estaExedido() &&
        self.cargasConPeligroArribaDe(nivelPeligro).isEmpty()

    method cosaQuePeseEntre_Y_(min, max) = cargaTotal.any({c => max >= c.peso() >= min})
    
    method cosaMasPesada() = cargaTotal.max({c => c.peso()})
}