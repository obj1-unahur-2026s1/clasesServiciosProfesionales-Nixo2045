// Profesional

class Profesional {
    const property tipoDeProfesional
    const property universidad

    method honorarios() = tipoDeProfesional.honorarios(self)
    method provinciasQuePuedeTrabajar() = tipoDeProfesional.provinciasQuePuedeTrabajar(self)
}

// Universidad

class Universidad {
    const property provincia
    const property honorarios
}

// Tipos de Profesionales

object profesionalUniversitario {
    
    method provinciasQuePuedeTrabajar(profesional) = [profesional.universidad().provincia()]
    method honorarios(profesional) = profesional.universidad().honorarios()
}

object profesionalLitoral {
    
    method provinciasQuePuedeTrabajar(profesional) = [entreRios, santaFe, corrientes]
    method honorarios(profesional) = 3000
}

class ProfesionalLibre {
    
    const property provinciasQuePuedeTrabajar = []
    const property honorarios

    method provinciasQuePuedeTrabajar(profesional) = provinciasQuePuedeTrabajar
    method honorarios(profesional) = honorarios
}

// Empresa de Servicio

class Empresa {
    const property profesionales = []
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

