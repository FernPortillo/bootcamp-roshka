// valorCarta (A, 2 ... T, J, Q, K)
// valorNumerico (1, 2 ... 10, 11, 12, 13)
// paloCarta (S, C, H, D)
// Clase abstracta carta -> clase cartaNumerica(1,2,3..)
// y clase cartaSuperior(T, J, K, Q, A)


private val cartasNumericas = listOf('2', '3', '4', '5', '6', '7', '8', '9')
private val cartasEspeciales = listOf('A', 'T', 'K', 'Q', 'J')
private val palos = listOf('S', 'D', 'H', 'C')

abstract class Carta(var valorCarta : Char = 'A', var paloCarta : Char = 'S') {
    abstract var valorNumerico : Int
    fun printCarta()
    {
        println("valor numerico $valorNumerico, valor carta: $valorCarta, palo: $paloCarta")
    }

    fun returnFormatoCarta(): String
    {
        return "${valorCarta}${paloCarta}"
    }
}

class CartaNumerica(valorCarta: Char, paloCarta: Char) : Carta(valorCarta, paloCarta) {
    override var valorNumerico : Int = 0
        get() = when (valorCarta) {
            '2' -> 2
            '3' -> 3
            '4' -> 4
            '5' -> 5
            '6' -> 6
            '7' -> 7
            '8' -> 8
            '9' -> 9
            else -> error("No tendria que llegar aca ?)")
        }
}

class CartaEspecial(valorCarta: Char, paloCarta: Char) : Carta(valorCarta, paloCarta){
    override var valorNumerico : Int = 0
        get() = when (valorCarta) {
            'A' -> 1
            'T' -> 10
            'J' -> 11
            'Q' -> 12
            'K' -> 13
            else -> error("Aca tampoco deberia llegar")
        }
}

class Baraja()
{
    val baraja : MutableList<Carta> = mutableListOf()

    // Genera una baraja con las cartas indicadas en el val al inicio
    // Seria cheto si pudiera usarlo con el getter y en vez que este hardcoded
    // genere los valores, pero ni idea
    fun generarBaraja()
    {
        for (palo in palos)
        {
            for (valor in cartasNumericas)
            {
                val carta : CartaNumerica = CartaNumerica(valor, palo)
                baraja.add(carta)
            }
        }

        for (palo in palos)
        {
            for (valor in cartasEspeciales)
            {
                val carta : CartaEspecial = CartaEspecial(valor, palo)
                baraja.add(carta)
            }
        }
    }

    // Ordena la baraja por numero
    fun ordenar()
    {
        baraja.sortBy { it.valorNumerico }
    }

    // Mezcla la baraja
    fun mezclar()
    {
        baraja.shuffle()
    }

    // Imprime la baraja completa en el formato carta
    fun printBaraja()
    {
        baraja.forEach { carta -> println(carta.returnFormatoCarta()) }
    }

    // Agrega una carta a la baraja
    fun addCarta(carta : Carta)
    {
        baraja.add(carta)
    }

    // Elimina una carta de la baraja
    fun quitarCarta(indexCarta: Int)
    {
        if (baraja.isNotEmpty()) baraja.removeAt(indexCarta) else println("No hay mas cartas.")
    }

    // Metodo que da una carta y la borra como si fuera un stack (casi ?) )
    fun darCarta() : Carta
    {
        // println("agrego la carta ${baraja[baraja.size - 1].returnFormatoCarta()}")
        quitarCarta(baraja.size-1)
        return baraja[baraja.size - 1]
    }

}

//fun checkValue (field : Char, list: List<Char>) : Char
//{
//    if (field.lowercaseChar() in list) return field.uppercaseChar()
//    else error("Ingrese un valor valido ($field) no es un valor valido")
//}

//fun limpiarBaraja()
//    {
//        if (baraja.isNotEmpty())
//        {
//            for ((index, carta) in baraja.withIndex())
//            {
//                quitarCarta(index)
//            }
//        }
//    }