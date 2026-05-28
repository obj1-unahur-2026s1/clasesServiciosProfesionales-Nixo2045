//  >  <

class Profesional {
    const property tipoDeProfesional
    const property universidad

    method honorarios() = tipoDeProfesional.honorarios()
    method provinciasQuePuedeTrabajar() = tipoDeProfesional.provinciasQuePuedeTrabajar()
}

class Universidad {
    const property provincia
    const property honorarios
}

// Tipos de Profesionales

object profesionalUniversitario {
    var property universidadActual = 0

    method provinciaQuePuedeTrabajar() = universidadActual.provincia()
    method honorarios() = universidadActual.honorarios()
}

object profesionalLitoral {
    method provinciaQuePuedeTrabajar() = [entreRios, santaFe, corrientes]
    method honorarios() = 3000
}

class ProfesionalLibre {
    const property provinciaQuePuedeTrabajar
    const property honorarios
}

// Empresa de Servicio

class Empresa {
    const profesionales = []
    var property honorarioReferencia = 1000
    
    method profesionalesQueEstudiaronEn(universidad) = profesionales.count({p => p.universidad() == universidad})
    method profesionalesCaros() = profesionales.filter({p => p.honorarios() > self.honorarioReferencia() })
    method universidadesFormadoras() = self.universidadesDeProfesionales().asSet() 
    method universidadesDeProfesionales() = profesionales.map({p => p.universidad()}) 
    method profesionalMasBarato() = profesionales.min({p => p.honorarios()})
    method esDeGenteAcotada() = !profesionales.all({p => p.universidad().provincia().size() > 3 })

    method agregarProfesional(unProfesional) { profesionales.add(unProfesional) }
    method sacarProfesional(unProfesional) { profesionales.remove(unProfesional) }
}

// Provincias

object entreRios{}
object santaFe{}
object corrientes {}