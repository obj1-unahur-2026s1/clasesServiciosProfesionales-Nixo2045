// Profesional

class Profesional {
    const property tipoDeProfesional
    const property universidad
    var property  dinero = 0
    var property horaDeTiempo

    method insumirHora() {horaDeTiempo -= 1}

    method honorarios() = tipoDeProfesional.honorarios(self)
    method provinciasQuePuedeTrabajar() = tipoDeProfesional.provinciasQuePuedeTrabajar(self)
    method cobrar(cantidad) { tipoDeProfesional.importe(self, cantidad) }
    method recibirDinero(cantidad) { dinero += cantidad }
    method pasarDinero(profesional, cantidad) {
        if (dinero >= cantidad) {
            dinero -= cantidad
            profesional.cobrar(cantidad)
        }
        else {
            self.error("No hay dinero suficiente para transferir")
        }
    }
}

// Universidad

class Universidad {
    const property provincia
    const property honorarios
    var property donaciones = 0

    method registrarDonacion(cantidad) {
        donaciones += cantidad
    }
}

// Tipos de Profesionales

object profesionalUniversitario {
    
    method provinciasQuePuedeTrabajar(profesional) = [profesional.universidad().provincia()]
    method honorarios(profesional) = profesional.universidad().honorarios()
    method importe(profesional, cantidad){
        profesional.universidad().registrarDonacion(cantidad * 0.5)
    }
}

object asociacionDeProfesionalesDelLitoral {
    var recaudacion = 0

    method recaudacion() = recaudacion
    method importe(cantidad) { recaudacion += cantidad }
}

object profesionalLitoral {
    
    method provinciasQuePuedeTrabajar(profesional) = [entreRios, santaFe, corrientes]
    method honorarios(profesional) = 3000
    method importe(profesional, cantidad){
        asociacionDeProfesionalesDelLitoral.importe(cantidad) 
    }
}

class ProfesionalLibre {
    
    const property provinciasQuePuedeTrabajar = []
    const property honorarios
    var property dinero = 0 

    method provinciasQuePuedeTrabajar(profesional) = provinciasQuePuedeTrabajar
    method honorarios(profesional) = honorarios
    method importe(profesional, cantidad){
        profesional.recibirDinero(cantidad)
    }
}

// Empresa de Servicio

class Empresa {
    const property profesionales = []
    const property clientes = []
    var property honorarioReferencia 
    
    method profesionalesQueEstudiaronEn(universidad) = profesionales.count({p => p.universidad() == universidad})
    method profesionalesCaros() = profesionales.filter({p => p.honorarios() > self.honorarioReferencia() })
    method universidadesFormadoras() = self.universidadesDeProfesionales().asSet() 
    method universidadesDeProfesionales() = profesionales.map({p => p.universidad()}) 
    method profesionalMasBarato() = profesionales.min({p => p.honorarios()})
    method esDeGenteAcotada() = profesionales.all({p => p.provinciasQuePuedeTrabajar().size() <= 3 })
    method cantidadDeUniversidadesPorProfesional() = profesionales.map({ p => p.universidad().provincia() })
    method provinciasPorProfesional() = profesionales.size({ p => p.provinciasQuePuedeTrabajar() }) 
    method puedeSatisfacerA(solicitante) = solicitante.puedeSerAtendido(profesionales) 
    method darServicio(solicitante) {
        if (solicitante.puedeSerAtendido(profesionales)) {
            self.profesionalQuePuedeAtenderA(solicitante).cobrar(self.profesionalQuePuedeAtenderA(solicitante).honorarios())
            self.agregarCliente(solicitante)
        }
    }
    method profesionalQuePuedeAtenderA(solicitante) = profesionales.find({ p => solicitante.puedeSerAtendidoPor(p) })
    method esClienteElSolicitante(solicitante) = clientes.contains(solicitante)

    method agregarCliente(cliente) = clientes.add(cliente)
    method sacarCliente(cliente) = clientes.remove(cliente)
    method agregarProfesional(unProfesional) { profesionales.add(unProfesional) }
    method sacarProfesional(unProfesional) { profesionales.remove(unProfesional) }
}

// Provincias

object entreRios{}
object santaFe{}
object corrientes {}
object buenosAires {}
object cordoba {}
object misiones{}

