// Profesional

class Profesional {
    const property tipoDeProfesional

    method universidad() = tipoDeProfesional.universidad() 
    method honorarios() = tipoDeProfesional.honorarios()
    method provinciasQuePuedeTrabajar() = tipoDeProfesional.provinciasQuePuedeTrabajar()
}

// Universidad

class Universidad {
    const property provincia
    const property honorarios
}

// Tipos de Profesionales

class ProfesionalUniversitario {
    const property universidad
    method provinciasQuePuedeTrabajar() = [universidad.provincia()]
    method honorarios() = universidad.honorarios()
}

class ProfesionalLitoral {
    const property universidad
    method provinciasQuePuedeTrabajar() = [entreRios, santaFe, corrientes]
    method honorarios() = 3000
}

class ProfesionalLibre {
    const property universidad 
    const property provinciasQuePuedeTrabajar = []
    const property honorarios
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
    method cantidadDeUniversidadesPorProfesional() = profesionales.map({ p =>   p.provincia() })
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

