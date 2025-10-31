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
                val trio1 = map1.filter { it.value == 3 }.keys.first()
                val trio2 = map2.filter { it.value == 3 }.keys.first()

                if (trio1 > trio2) QuienGano("player 1")
                else if (trio1 < trio2) QuienGano("player 2")
                else Empate()
            }
            Puntajes.PAR -> {
                val par1 = map1.filter { it.value == 2 }.keys.first()
                val par2 = map2.filter { it.value == 2 }.keys.first()

                if (par1 > par2) QuienGano("player 1")
                else if (par1 < par2) QuienGano("player 2")
                else Empate()
            }
            Puntajes.NMA -> {
                if (m1.getUltimaCarta().valorNumerico > m2.getUltimaCarta().valorNumerico) QuienGano("player 1")
                else if (m2.getUltimaCarta().valorNumerico > m1.getUltimaCarta().valorNumerico) QuienGano("player 2")
                else Empate()
            }
            Puntajes.POKER ->
            {
                val poker1 = map1.filter { it.value == 4 }.keys.first()
                val poker2 = map2.filter { it.value == 4 }.keys.first()

                if (poker1 > poker2) QuienGano("player 1")
                else if (poker1 < poker2) QuienGano("player 2")
                else Empate()
            }
            Puntajes.ESCALERA_COLOR ->
            {
                if (m1.getUltimaCarta().valorNumerico > m2.getUltimaCarta().valorNumerico) QuienGano("player 1")
                else if (m2.getUltimaCarta().valorNumerico > m1.getUltimaCarta().valorNumerico) QuienGano("player 2")
                else Empate()
            }
            Puntajes.ESCALERA ->
            {
                if (m1.getUltimaCarta().valorNumerico > m2.getUltimaCarta().valorNumerico) QuienGano("player 1")
                else if (m2.getUltimaCarta().valorNumerico > m1.getUltimaCarta().valorNumerico) QuienGano("player 2")
                else Empate()
            }
            Puntajes.COLOR ->
            {
                if (m1.getUltimaCarta().valorNumerico > m2.getUltimaCarta().valorNumerico) QuienGano("player 1")
                else if (m2.getUltimaCarta().valorNumerico > m1.getUltimaCarta().valorNumerico) QuienGano("player 2")
                else Empate()
            }
            Puntajes.FULLHOUSE ->
            {
                val fh1 = map1.filter { it.value == 3 }.keys.first()
                val fh2 = map2.filter { it.value == 3 }.keys.first()

                if (fh1 > fh2) QuienGano("player 1")
                else if (fh1 < fh2) QuienGano("player 2")
                else Empate()
            }
            else -> Empate()
        }
    }
}
