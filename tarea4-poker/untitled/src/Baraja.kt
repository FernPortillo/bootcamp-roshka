class Baraja() {
    val baraja: MutableList<Carta> = mutableListOf()

    // Genera una baraja con las cartas
    fun generarBaraja() {
        var contador = 0
        for (palo in Palo.entries) {
            for (valor in Valor.entries) {
                contador++
                val carta: Carta = Carta(valor, palo)
                baraja.add(carta)
            }
        }
        // println("Generadas $contador cartas")
    }

    // Ordena la baraja por numero
    fun ordenar() {
        baraja.sortBy { it.valorNumerico }
    }

    // Mezcla la baraja
    fun mezclar() {
        baraja.shuffle()
    }

    // Imprime la baraja completa en el formato carta
    fun printString() {
        baraja.forEach { println(it.toString()) }
    }

    // Agrega una carta a la baraja
    fun addCarta(carta: Carta)
    {
        baraja.add(carta)
    }

    // Elimina una carta de la baraja
    fun quitarCarta(indexCarta: Int) {
        if (baraja.isNotEmpty()) baraja.removeAt(indexCarta) else println("No hay mas cartas.")
    }

    // Metodo que da una carta y la borra como si fuera un stack (casi ?) )
    fun darCarta(): Carta {
        // println("agrego la carta ${baraja[baraja.size - 1].returnFormatoCarta()}")
        quitarCarta(baraja.size - 1)
        return baraja[baraja.size - 1]
    }

    // Limpiar la baraja
    fun limpiarBaraja() {
        if (baraja.isNotEmpty()) {
            baraja.clear()
        }
        else return
    }

}




//fun checkValue (field : Char, list: List<Char>) : Char
//{
//    if (field.lowercaseChar() in list) return field.uppercaseChar()
//    else error("Ingrese un valor valido ($field) no es un valor valido")
//}
