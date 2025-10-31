data class JugadaValida(val nombreJugada: String, val jerarquia : Int)
enum class Puntajes(val jugada: JugadaValida)
{
    NMA(JugadaValida("Numero Mas Alto", 0)),
    PAR(JugadaValida("Par", 1)),
    DOBLE_PAR(JugadaValida("Doble Par", 2)),
    TRIO(JugadaValida("Trio", 3)),
    ESCALERA(JugadaValida("Escalera", 5)),
    COLOR(JugadaValida("Color", 7)),
    FULLHOUSE(JugadaValida("Full House", 9)),
    POKER(JugadaValida("Poker", 10)),
    ESCALERA_COLOR(JugadaValida("Escalera Color", 12)),
    ROYAL_FLUSH(JugadaValida("Royal Flush", 15));
}