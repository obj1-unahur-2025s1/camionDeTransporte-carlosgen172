import camion.*
//Cosas
object knight {
    const peso = 500
    method peso() = peso
    method nivelPeligro() = 10
}
object bumblebee {
    var transformacion = auto
    method peso() = 800
    method nivelPeligro() = transformacion.nivelPeligro()
    method transformacion(objeto) {
        transformacion = objeto
    }
}
//Objetos bumblebee
object auto {
    method nivelPeligro() = 15
}
object robot {
    method nivelPeligro() = 30
}

//Cosas
object paqueteLadrillos {
    var property cantidadLadrillos = 0
    method peso() = cantidadLadrillos * 2
    method nivelPeligro() = 2
}
object arena {
    var property peso = 0
    method nivelPeligro() = 1
}
object bateria {
    var peso = 200
    var nivelPeligro = 0
    var misiles = false
    method peso() {
        if(misiles) peso = 300 else peso = 200
        return peso
    }
    method nivelPeligro() {
        if(misiles) nivelPeligro = 100 else nivelPeligro = 0
        return nivelPeligro
    }
    
    method misiles() = misiles

    method tieneMisiles() {
        misiles = true
    }
    method noTieneMisiles() {
        misiles = false
    }
}
object contenedor {
    const cosasDentro = []
    method peso() = 100 + cosasDentro.sum({c => c.peso()})
    method nivelPeligro() = cosasDentro.max({c => c.nivelPeligro()}).nivelPeligro()
    method agregar(unaCosa) {
        cosasDentro.add(unaCosa)
    }
}
object residuos {
    var property peso = 0
    method nivelPeligro() = 200
}
object embalaje {
    var property objeto = residuos
    method peso() = objeto.peso()
    method nivelPeligro() = objeto.nivelPeligro() / 2
}