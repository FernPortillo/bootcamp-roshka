import javax.xml.catalog.Catalog

class Mano {
    // Encargar de las manos
    // agregar cartas y leer las cartas que tiene
    private var mano : MutableList<Carta> = mutableListOf()
    constructor()
    {
        this.mano = mutableListOf<Carta>()
    }

    init {
        println("Generando tu mano...")
    }

    fun getUltimaCarta() : Carta {
        return this.mano[this.mano.size - 1]
    }
    fun agregarCarta(carta: Carta) {
        mano.add(carta)
    }

    fun getMano() : MutableList<Carta> { return this.mano }

    fun ordenarMano()
    {
        mano.sortBy { c -> c.valorNumerico }
    }

    fun printMano()
    {
        mano.forEach { println(it.toString()) }
    }

}