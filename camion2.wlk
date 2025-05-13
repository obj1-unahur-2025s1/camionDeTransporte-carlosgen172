import cosas2.*

object camion {
    var pesoTotal = 1000
    const cargaTotal = []
    var totalDeBultos = 0
    method pesoTotal() = pesoTotal
    method cargaTotal() = cargaTotal
    method totalDeBultos() = totalDeBultos
    
    method cargar(objeto) {
        pesoTotal = pesoTotal + objeto.peso()
        cargaTotal.add(objeto)
        objeto.sufrirCambios()
        totalDeBultos = totalDeBultos + objeto.bulto()
    }
    
    method descargar(objeto) {
        pesoTotal = (pesoTotal - objeto.peso()).max(0)
        cargaTotal.remove(objeto)
        totalDeBultos = (totalDeBultos - objeto.bulto()).max(0)
    }
    
    method cargaTotalEsPar() = cargaTotal.all({c => c.peso().even()})
    
    method consultarUnaCargaConPeso(valor) = cargaTotal.any({c => c.peso() == valor})
    
    method nivelPeligroPrimeraCarga(valor) = cargaTotal.findOrElse({c => c.nivelPeligro() == valor}, {"no hay"})
    
    method cargasConPeligroArribaDe(nivelPeligro) =
        cargaTotal.filter({c => c.nivelPeligro() > nivelPeligro})
    
    method cargasQueSuperenNivelPeligroDe(unaCarga) = 
        self.cargasConPeligroArribaDe(unaCarga.nivelPeligro())
    
    method estaExedido() = pesoTotal > 2500
    
    method puedeCircularHacia(viaje) = not self.estaExedido() &&
        self.cargasQueSuperenNivelPeligroDe(viaje).isEmpty()
    
    method cosaQuePeseEntre_Y_(min, max) = cargaTotal.any({c => c.peso() > min && c.peso() < max})
}