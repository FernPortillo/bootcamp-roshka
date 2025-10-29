import kotlin.collections.sorted
import kotlin.random.Random
import kotlin.system.exitProcess

val roll : (Int) -> Int = {sides -> if (sides == 0) 0
                                    else Random.nextInt(sides) + 1 }
val ladosDado : Int = 6
//val cantidadDados : Int = 5
var puntosP1 = 0
var puntosP2 = 0

fun main(args: Array<String>) {
    println("Jugador 1 tira 5 dados, Jugador 2 tira otros 5, gana el que saque " +
            " mejor jugada")

    var flag = -1
    while (flag != 0)
    {
        flag = empezarJuego().toInt()
        if (flag == 0) break
        if (puntosP1 == 0) puntosP1 = gameplay() else puntosP2 = gameplay()
        if (puntosP2 > 0 && puntosP1 > 0) break
    }
    println("PuntosP1 = $puntosP1")
    println("PuntosP2 = $puntosP2")
    if (puntosP2 == puntosP1)
    {
        println("Empate..")
        empezarJuego()
    }
    else{
        println("Gano ${if (puntosP2 > puntosP1) "player 2!" else "player 1!"}")
        exitProcess(0)
    }
    exitProcess(0)
}

fun getValorDado(lados : Int = ladosDado) : Int = roll(lados)

fun checkPosiblesJugadas(dados : List<Int>) : Int
{
    // Dado1 -> Dado2. Si son iguales hay 1 numero rep.
    // Generala -> 55555, Poker -> 55554, Full -> 55533 o 55353 (orden no importa),
    // Escalera -> 12345, 23456, 34561. 45612 no funciona, 1 puede solo valer 7
    // Escalera puede estar desordenado -> 2 4 3 5 1 es una escalera
    // Nada

    // groupingBy agrupa los valores repetidos, each count los mapea con su cantidad
    val escaleraBaja = arrayOf(1,2,3,4,5)
    val escaleraAlta = arrayOf(2,3,4,5,6)

    if (dados == escaleraBaja || dados == escaleraAlta)
    {
        println("Escalera...")
        return 2
    }
    else if (dados.contains(1) && dados.takeLast(4) == escaleraAlta.takeLast(4))
    {
        println("Escalera...")
        return 2
    }

    val map: Map<Int, Int> = dados.groupingBy { it }.eachCount()
    if (map.size == 1)
    {
        // Generala
        println("Es generala!")
        return 5
    }
    else if (map.size == 2)
    {
        // Poker o Full
        if (map.entries.any { it.value == 2 })
        {
            // Full. Tiene uno que se repite 2 veces
            println("Es Full!")
            return 3
        }
        else
        {
            // Poker
            println("Es Poker!")
            return 4
        }
    }
    println("No es nada...")
    return 1
}


fun empezarJuego() : Int
{
    println(" Generala > Poker > Full > Escalera > Nada")
    println(" Enter para continuar, 0 para salir ")
    var input = readlnOrNull().toString()
    if (input == "") return -1
    return input.toInt()
}

fun gameplay() : Int
{
    puntosP1 = 0
    puntosP2 = 0
    var dado1 : Int = getValorDado()
    var dado2 : Int = getValorDado()
    var dado3 : Int = getValorDado()
    var dado4 : Int = getValorDado()
    var dado5 : Int = getValorDado()
    println("Tiraste $dado1 $dado2 $dado3 $dado4 $dado5")
    val dados = listOf(dado1, dado2, dado3, dado4, dado5).sorted()
    return checkPosiblesJugadas(dados)
 }