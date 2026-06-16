import criaturas.*
object guardian{
    method extra(){
        return 100
    }

    method esExtraordinario(unaCriatura){
        return unaCriatura.poderMagico()>50
    }

    method puedeCambiarDeRol(){
        return true   
    }
    
    method cambioDeRol() {
        return new Domador(mascotas=[new Mascota(edad=1,tieneCuernos=false)])
    }
}

object hechicero{
    method extra(){
        return 0
    }

    method esExtraordinario(unaCriatura){
        return true
    }

    method puedeCambiarDeRol(){
        return true   
    }

    method cambioDeRol(){
        return guardian
    }
}

class Domador{
    const mascotas=[]

    method agregarMascota(unaMascota){
        mascotas.add(unaMascota)
    }

    method mascotasConCuernos(){
        return mascotas.filter({m=>m.tieneCuernos()})
    }

    method extra(){
        return (self.mascotasConCuernos()).size()*150
    }

    method esExtraordinario(unaCriatura){
        return unaCriatura.poderMagico()>=15 && mascotas.all({m=>m.esVeterana()})
    }

    method puedeCambiarDeRol(){
        return mascotas.any({m=>m.tieneCuernos()})   
    }

    method cambioDeRol(){
        return hechicero
    }
}

class Mascota {
    var edad
    const tieneCuernos

    method tieneCuernos()=tieneCuernos

    method edad()=edad
    method cumplirAnios(){edad+=1}
}

