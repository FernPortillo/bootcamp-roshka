var manoPoker : MutableList<Carta> = mutableListOf()

fun main(args: Array<String>) {
    val baraja : Baraja = Baraja()
    val barajaTemp : Baraja = Baraja()
    baraja.generarBaraja()
    baraja.mezclar()

    // Ordenar mano de poker antes
    repeat(5)
    {
        barajaTemp.addCarta(baraja.darCarta())
        //println("ahora tiene ${contador + 1} cartas")
    }
    barajaTemp.ordenar()
    println("Tu mano es: ")
    barajaTemp.printBaraja()
    manoPoker = barajaTemp.baraja
    // Para test
    // crearCincoCartas()
    println("Es un  ${checkPosible()}")

}

fun checkPosible() : String
{
    val arrayEscaleraEspecial : List<Char> = listOf('T', 'J', 'Q', 'K', 'A')
    val mapColor : Map<Char, Int> = manoPoker.groupingBy { it.paloCarta }.eachCount()
    val mapValor : Map<Char, Int> = manoPoker.groupingBy { it.valorCarta }.eachCount()

    println(mapValor.keys)
    println(mapColor.keys)
    //println(arrayEscaleraEspecial)
    // Verificar caso especial primero, es el mas quilombo
    if (mapValor.keys.toSortedSet() == arrayEscaleraEspecial.toSortedSet())
    {
        if (mapColor.size == 1)
        {
            return "Royal Flush!!!"

        }
        else return "Escalera!!"
    }

    // Revisar si es escalera, si el contador es mayor a 4 siempre va a ser escalera.
    var contadorEscalera : Int = 0
    for ((index, carta) in manoPoker.withIndex())
    {
        if (index == manoPoker.size - 1)
        {
            continue
        }
        else if (manoPoker[index + 1].valorNumerico - carta.valorNumerico == 1)
        {
            contadorEscalera++
        }
        else continue
    }

    // Revisar si es escalera o escalera color
    if (contadorEscalera >= 4)
    {
        if (mapColor.size == 1)
        {
            // Es escalera color
            return "Escalera Color!!!"
        }
        else return "Escalera!!"
    }


    // No es escalera, solo puede ser casos de map
    // Color
    if (mapColor.size == 1)
    {
        return "Color!"
    }

    // Si es Full o Poker
    if (mapValor.size == 2)
    {
        if (mapValor.entries.any { it.value == 2 })
        {
            return "Full!"
        }
        else
        {
            return "Poker!"
        }
    }
    //  Doble par y trio
    if (mapValor.size == 3)
    {
        // (K - 3, 1 - 1,6 - 1) - (k-2, j-2, 1-1)
        if (mapValor.entries.any { it.value == 3 })
        {
            return "Trio"
        }
        else return "Doble par"
    }

    //Par
    if (mapValor.size == 4)
    {
        // (q-2, 5-1, 3-1, 7-1)
        return "Par"
    }

    // Si no es ningun caso, es el default, numero mas alto
    return "Numero mas alto, el numero es ${manoPoker[manoPoker.size - 1].valorNumerico}"
}

fun crearCincoCartas()
{

    val carta1 : Carta = CartaEspecial('A', 'S')

    val carta2 : Carta = CartaNumerica('2', 'D')

    val carta3 : Carta = CartaNumerica('3', 'S')

    val carta4 : Carta = CartaNumerica('4', 'S')

    val carta5 : Carta = CartaNumerica('5', 'S')
    manoPoker = mutableListOf(carta1, carta2, carta3, carta4, carta5)
}
// 1 2 3 4 5 6 7 8 9 10 11 12 13
// S, C, D, H
// tjqka * 4 colores = 4 royal flush
// a 2 3 4 5, 23456,34567,45678,56789,6789t,789tj,89tjq,9tjqk, tjqka =  10 * 4 - 4 por rf = 36 si es escalera color
// 4