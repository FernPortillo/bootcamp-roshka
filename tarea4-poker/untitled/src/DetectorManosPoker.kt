import Carta

class DetectorManosPoker(val mano : Mano)
{
    val manoOrd : Mano = mano
    var contador = 0
    var jugada = Puntajes.NMA

    init {
        manoOrd.ordenarMano()
        manoOrd.printMano()
        jugada = CheckPuntajes()
        printJugada()
    }

    fun returnPuntos() : Puntajes { return jugada }
    fun printJugada() = println("Tu jugada fue un ${jugada.jugada.nombreJugada}")
    fun isPrimera(index : Int) : Boolean = index == 0
    fun isLast(index: Int) : Boolean = index == manoOrd.getMano().size - 1
    fun isRoyalFlush() : Boolean
    {
        return checkEscalera() == 5 && contadorColor(manoOrd) == 5
    }

    fun checkEscalera() : Int {
        contador = 0
        var flag = false
        for ((index, carta) in manoOrd.getMano().withIndex())
        {
            if (carta.valorCarta == Valor.DIEZ && isPrimera(index)) flag = true
            if (isLast(index)) {
                if (flag && carta.valorCarta == Valor.AS)
                {
                    contador++
                }
                continue
            }
            else if (carta.cartaEsConsecutiva(manoOrd.getMano()[index + 1])) contador++
        }
        return contador
    }

    fun isEscalera() : Boolean { return checkEscalera() >= 4 }

    fun isColor() : Boolean
    {
        return contadorColor(manoOrd) == 5
    }

    fun CheckMap() : Puntajes
    {
        val map = mapDeRepeticiones(manoOrd)
        if (map.size == 2)
        {
            if (map.entries.any { it.value == 2 })
            {
                return Puntajes.FULLHOUSE
            }
            else
            {
                return Puntajes.POKER
            }
        }
        if (map.size == 3)
        {
            // (K - 3, 1 - 1,6 - 1) - (k-2, j-2, 1-1)
            if (map.entries.any { it.value == 3 })
            {
                return Puntajes.TRIO
            }
            else return Puntajes.DOBLE_PAR
        }
        if (map.size == 4)
        {
            return Puntajes.PAR
        }

        else return Puntajes.NMA
    }

    fun CheckPuntajes() : Puntajes
    {
        if (isEscalera() && isColor() && !isRoyalFlush()) return Puntajes.ESCALERA_COLOR
        else {
            when {
                isRoyalFlush() -> return Puntajes.ROYAL_FLUSH
                isEscalera() -> return Puntajes.ESCALERA
                isColor() -> return Puntajes.COLOR
                else -> return CheckMap()
            }
        }
    }


    fun contadorNum(mano: Mano) : Int
    {
        contador = 0
        for ((index, carta) in mano.getMano().withIndex())
        {
            if (isLast(index)) continue
            else if (carta.compareValorCarta(mano.getMano()[index + 1]) == 0) contador++
        }
        return contador
    }

    fun contadorColor(mano : Mano) : Int
    {
        contador = 0
        val paloACheckear = mano.getMano()[0].paloCarta
        for ((index, carta) in mano.getMano().withIndex())
        {
            if (carta.paloCarta == paloACheckear) contador++
        }
        return contador
    }
}
fun mapDeRepeticiones(mano : Mano) : Map<Int, Int>
{
    return mano.getMano().groupingBy { it.valorNumerico }.eachCount()
}

