
/**Determinar si ese paquete puede ser entregado por una persona en un determinado destino**/

object paquete{
	//estado del pago
	//Es el que manda. Él sabe si está pago o no.
	var estaPago = false

	method estaPago(estado){
		estaPago = estado
	}

	method estaPagado()= estaPago

	method puedeEntregar_En_(mensajero, destino){
		return estaPago and destino.dejarPasarA_(mensajero)
	}
	
}


//Todos tienen que saber responder dos cosas: ¿Cuánto pesás? y ¿Podés llamar?

	/* Jean Gray:Posee poderes telepáticos y telequinesicos, 
	es decir que puede comunicarse con cualquier persona 
	en cualquier momento (puede llamar siempre). Su peso es de 65 kg.*/
	object jeanGray{
	method peso() = 65
	method llamar()= true
}



/*Neo: Neo vuela, así que no pesa nada. Y anda con celular, 
el muy canchero. El tema es que a veces no puede llamar porque se queda sin crédito*/
	object neo{
		var credito = 100

		method peso() = 0

		method llamar() = credito > 0

		method credito(_credito){
			credito = _credito
		}
	} 



/*Sara Connor: Tiene un peso propio que varía con el tiempo (es configurable). 
Viaja en moto ó camión. A ese peso propio se le suma el peso de su vehículo. 
La moto pesa 100kg. En cambio, el camión pesa media tonelada. Si el camión tiene acoplados, 
hay que agregar media tonelada adicional por cada uno de ellos. Sara no puede llamar a nadie.*/	
object saraConnor {
    var pesoPropio = 0
    var vehiculo = notVehiculo // Referencia al OBJETO vehiculo

	method llamar() = false

    // Setter para cambiar de moto a camion o viceversa
    method cambiarVehiculo(_vehiculo) {
        vehiculo = _vehiculo
    }

    //suma su peso + lo que diga el objeto vehiculo
    method peso() {
        return pesoPropio + vehiculo.peso()
    }

	method pesoPropio(_pesoPropio){
		pesoPropio = _pesoPropio
	}
}

object notVehiculo{
	method peso()= 0
}
object moto {
    method peso() = 100
}

object camion {
    var acoplados = 0
    
    method cantidadAcoplados(_cant) { acoplados = _cant }
    
    // 500 + 500 por cada acoplado
    method peso() = 500 + (acoplados * 500)
}			


	

	//deja pasar a todo lo que pese hasta una tonelada (1000 kilos).
	object brooklyn{
		
		method dejarPasarA_(mensajero){
			return mensajero.peso() <= 1000
		}

	}

	//deja entrar a quien pueda hacer una llamada. 
	object laMatrix{
		method dejarPasarA_(mensajero){
			return mensajero.llamar()
		}
	}




