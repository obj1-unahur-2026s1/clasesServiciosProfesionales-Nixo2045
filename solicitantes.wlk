class Persona {
    const property provincia

    method puedeSerAtendido(listaProfesionales) = listaProfesionales.any({ p => p.provinciasQuePuedeTrabajar().contains(self.provincia()) })
}

class Institucion {
    const property universidades = []

    method puedeSerAtendido(listaProfesionales) = listaProfesionales.any({ p => self.universidades().contains(p.universidad()) })
}

class Club {
    const property provincias 

    method puedeSerAtendido(listaProfesionales) = listaProfesionales.any({ prof => self.provincias().any({ prov => prof.provinciasQuePuedeTrabajar().contains(prov) })  })
}
