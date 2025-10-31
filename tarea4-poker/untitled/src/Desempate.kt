class Desempate(mano1 : Mano, mano2 : Mano, puntaje : Puntajes)
{
    var m1 = mano1
    var m2 = mano2
    var map1 = mapDeRepeticiones(mano1)
    var map2 = mapDeRepeticiones(mano2)
    var puntaje : Puntajes = puntaje

    fun checkDesempate() {
        println("Desempate")
        when (puntaje)
        {
            Puntajes.DOBLE_PAR -> {
                val pares1 = map1.filter { it.value == 2 }.keys.sortedDescending()
                val pares2 = map2.filter { it.value == 2 }.keys.sortedDescending()

                if (pares1[0] > pares2[0]) QuienGano("player 1")
                else if (pares1[0] < pares2[0]) QuienGano("player 2")
                else Empate()
            }
            Puntajes.TRIO -> {
                val trio1 = filterByValue(map1, 3)
                val trio2 = filterByValue(map1, 3)

                if (trio1 > trio2) QuienGano("player 1")
                else if (trio1 < trio2) QuienGano("player 2")
                else Empate()
            }
            Puntajes.PAR -> {
                val par1 = filterByValue(map1, 2)
                val par2 = filterByValue(map2, 2)

                if (par1 > par2) QuienGano("player 1")
                else if (par1 < par2) QuienGano("player 2")
                else Empate()
            }
            Puntajes.NMA -> {
                if (filterByHighestNumber(m1,m2)) QuienGano("player 1")
                else if (filterByHighestNumber(m2,m1)) QuienGano("player 2")
                else Empate()
            }
            Puntajes.POKER ->
            {
                val poker1 = filterByValue(map1, 4)
                val poker2 = filterByValue(map2, 4)

                if (poker1 > poker2) QuienGano("player 1")
                else if (poker1 < poker2) QuienGano("player 2")
                else Empate()
            }
            Puntajes.ESCALERA_COLOR ->
            {
                if (filterByHighestNumber(m1,m2)) QuienGano("player 1")
                else if (filterByHighestNumber(m2,m1)) QuienGano("player 2")
                else Empate()
            }
            Puntajes.ESCALERA ->
            {
                if (filterByHighestNumber(m1,m2)) QuienGano("player 1")
                else if (filterByHighestNumber(m2,m1)) QuienGano("player 2")
                else Empate()
            }
            Puntajes.COLOR ->
            {
                if (filterByHighestNumber(m1,m2)) QuienGano("player 1")
                else if (filterByHighestNumber(m2,m1)) QuienGano("player 2")
                else Empate()
            }
            Puntajes.FULLHOUSE ->
            {
                val fh1 = filterByValue(map1, 3)
                val fh2 = filterByValue(map2, 3)

                if (fh1 > fh2) QuienGano("player 1")
                else if (fh1 < fh2) QuienGano("player 2")
                else Empate()
            }
            else -> Empate()
        }
    }

    fun filterByValue(map :Map<Int, Int>, valor : Int) : Int { return map.filter { it.value == valor }.keys.first() }
    fun filterByHighestNumber(m1 : Mano, m2 : Mano) = m1.getUltimaCarta().valorNumerico > m2.getUltimaCarta().valorNumerico

}
