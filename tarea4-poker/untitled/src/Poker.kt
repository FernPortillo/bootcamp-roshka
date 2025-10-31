import kotlin.math.cos
val b = Baraja()
fun main()
{
    var jugadaP1 : Puntajes
    var jugadaP2 : Puntajes
    b.generarBaraja()
    b.mezclar()

    println("Poker, empieza el jugador 1")
    var m1 = generarMano()
    jugadaP1 = DetectorManosPoker(m1).returnPuntos()
    var m2 = generarMano()
    jugadaP2 = DetectorManosPoker(m2).returnPuntos()

    if (jugadaP1.jugada.jerarquia > jugadaP2.jugada.jerarquia){ QuienGano("player 1")}
    else if (jugadaP2.jugada.jerarquia > jugadaP1.jugada.jerarquia){ QuienGano("player 2")}
    else Desempate(m1, m2, jugadaP1 ).checkDesempate()

}

fun generarMano() : Mano {
    var m = Mano()
    repeat(5)
    {
        m.agregarCarta(b.darCarta())
    }
    return m
}


fun QuienGano(player : String) { println("Gano $player") }
fun Empate() { println("Empate, ambas manos son iguales, tira de nuevo") }