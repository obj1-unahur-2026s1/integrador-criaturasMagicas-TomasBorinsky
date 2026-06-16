import roles.*
class Criatura{
    const astucia
    var rol
    var poder

    method astucia()=astucia
    method rol()=rol
    method esAstuta()

    method esExtraordinaria(){
        return rol.esExtraordinario(self)
    }

    method extraAdicional(){
        return rol.extra()
    }

    method poderOfensivo(){
        return poder*10 + self.extraAdicional()
    }

    method esFormidable(){
        return self.esAstuta() || self.esExtraordinaria()
    }
    method cambiarRol() {
        if(rol.puedeCambiarDeRol()){
            rol = rol.cambioDeRol()
        }
        
    }

    method fallarConquista(){
        poder = poder - poder * 0.15
    }
}


class Hadas inherits Criatura{
    var kilometros=2

    method kilometrosQuePuedeVolar(){
        return kilometros
    }

    method aumentarKilometros(cantidad){
        kilometros=(kilometros+cantidad).min(25)
    }

    override method esAstuta(){
        return self.astucia()>50
    }

    override method esFormidable(){
        return super() && kilometros>10
    } 
}

class Duendes inherits Criatura{
    override method poderOfensivo(){
        return super()*1.10
    }
} 

