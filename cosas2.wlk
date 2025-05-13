import camion2.*

//Cosas
object knight {
    const peso = 500
    method peso() = peso
    method nivelPeligro() = 10
    method bulto() = 1
    method sufrirCambios() {}
}
object bumblebee {
    var transformacion = auto
    method transformacion() = transformacion
    method peso() = 800
    method nivelPeligro() = transformacion.nivelPeligro()
    method transformacion(objeto) {
        transformacion = objeto
    }
    method bulto() = 2
    method sufrirCambios() {
        self.transformacion(robot)
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
    var cantidadLadrillos = 0
    var bulto = 0
    method cantidadLadrillos() = cantidadLadrillos
    method peso() = cantidadLadrillos * 2
    method nivelPeligro() = 2

    method aumentarCantidad(valor) {
        cantidadLadrillos = cantidadLadrillos + valor
    }
    method disminuirCantidad(valor) {
        cantidadLadrillos = (cantidadLadrillos - valor).max(0)
    }
    
    method bulto() {
        if(cantidadLadrillos <= 100) bulto = 1 else self.masDeUnBulto()

        return bulto
    }
    method masDeUnBulto() {
        if(cantidadLadrillos < 300 && cantidadLadrillos > 101) bulto = 2 else (cantidadLadrillos >= 301) bulto = 3

        return bulto
    }

     method sufrirCambios() {
        self.aumentarCantidad(12)
    }
}

object arena {
    var peso = 0
    method peso() = peso
    method aumentarPeso(valor) {
        peso = peso + valor
    }
    method disminuirPeso(valor) {
        peso = (peso - valor).max(0)
    }
    method nivelPeligro() = 1
    method bulto() = 1
    method sufrirCambios() {
        self.disminuirPeso(10)    
    }
}
object bateria {
    var peso = 200
    var nivelPeligro = 0
    var misiles = false
    var bulto = 1
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
    
    method bulto() {
        if(self.misiles()) bulto = 2 else bulto = 1
        return bulto
    }
    
    method sufrirCambios() {
        self.tieneMisiles()
    }
}
object contenedor {
    const cosasDentro = []
    method cosasDentro() = cosasDentro
    method peso() = 100 + cosasDentro.sum({c => c.peso()})
    method nivelPeligro() = cosasDentro.max({c => c.nivelPeligro()}).nivelPeligro()
    method agregar(unaCosa) {
        cosasDentro.add(unaCosa)
    }
    method bulto() = 1 + cosasDentro.sum({c => c.bulto()})
    method sufrirCambios() {
        cosasDentro.forEach({c => c.sufrirCambios()})
    }
}
object residuos {
    var peso = 10
    method peso() = peso
    method aumentarPeso(valor) {
        peso = peso + valor
    }
    method disminuirPeso(valor) {
        peso = (peso - valor).max(0)
    }
    method nivelPeligro() = 200
    method bulto() = 1
    method sufrirCambios() {
        self.aumentarPeso(15)    
    }
}
object embalaje {
    var property objeto = residuos
    method peso() = objeto.peso()
    method nivelPeligro() = objeto.nivelPeligro() / 2
    method bulto() = 2
    method sufrirCambios() {}
}