
// valorCarta (A, 2 ... T, J, Q, K)
// valorNumerico (1, 2 ... 10, 11, 12, 13)
// paloCarta (S, C, H, D)
// Clase abstracta carta -> clase cartaNumerica(1,2,3..)
// y clase cartaSuperior(T, J, K, Q, A)

enum class Palo (val palo : Char)
{
    SPADES('S'),
    HEARTS('H'),
    CLOVERS('C'),
    DIAMONDS('D');

    override fun toString(): String = palo.toString()
}

enum class Valor (val valorNumerico : Int, val valorCarta : Char)
{
    DOS(2, '2'),
    TRES(3,'3'),
    CUATRO(4,'4'),
    CINCO(5,'5'),
    SEIS(6,'6'),
    SIETE(7,'7'),
    OCHO(8,'8'),
    NUEVE(9,'9'),
    DIEZ(10,'T'),
    JACK(11, 'J'),
    QUEEN(12, 'Q'),
    KING(13, 'K'),
    AS(14, 'A');

    override fun toString(): String = valorCarta.toString()
}

class Carta(val valorCarta : Valor, val paloCarta : Palo) {
    var valorNumerico : Int = 0
        get() = valorCarta.valorNumerico

    // Devuelve 0 si es igual, -1 si es menor y 1 si es positivo
    fun compareValorCarta(carta : Carta) : Int { return this.valorNumerico.compareTo(carta.valorNumerico) }

    fun cartaEsConsecutiva(carta : Carta) : Boolean {
        if (carta.valorNumerico == Valor.AS.valorNumerico && this.valorNumerico == Valor.DOS.valorNumerico)
        {
            return true
        }
        when(compareValorCarta(carta)) {
            0 -> return false
            1 -> return this.valorNumerico - carta.valorNumerico == 1
            else -> return carta.valorNumerico - this.valorNumerico == 1
        }
    }

    override fun toString(): String
    {
        return "$valorCarta$paloCarta"
    }
}

