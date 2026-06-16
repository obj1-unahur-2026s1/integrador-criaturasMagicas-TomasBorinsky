import criaturas.*
class Colonia{
    const criaturas=[]

    method cantidadDeHabitantes(){
        return criaturas.size()
    }

    method intentarConquista(unLugar){
        if (self.poderDeLaColonia()>unLugar.poderDefensivo()){
            unLugar.serOcupado(self)
        }
        else{
            criaturas.forEach({c=>c.fallarConquista()})
        }
    }

    method poderDeLaColonia(){
        return criaturas.sum({c=>c.poderOfensivo()})
    }

    method cantidadDeFormidables(){
        return (criaturas.filter({c=>c.esFormidable()})).size()
    }
}

class Claro {
    var colonia

    method poderDefensivo(){
        return colonia.poderDeLaColonia()+100
    }

    method serOcupado(unaColonia){
        colonia=unaColonia
    }
}

class Castillo {
    var colonia

    
    method poderDefensivo(){
        return colonia.cantidadDeFormidables()*200
    }
    
    method serOcupado(unaColonia){
        colonia=unaColonia
    }
}