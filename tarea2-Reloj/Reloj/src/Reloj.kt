package Reloj

import kotlin.math.min

class Reloj
{
    private var horas: Int = 12
        // Redundante, no hace falta colocar
        get() = field
        set(value) { field = value}
    private var minutos: Int = 0
        get() = field
        set(value) {field = value}
    private var segundos: Int = 0
        get() = field
        set(value) {field = value}

    constructor() {

    }

    // Ingresar 3 valores y su init
    constructor(horas: Int, minutos: Int, segundos: Int) {
        this.horas = horas
    }
    init {
        require(horas in 0..23 &&
            minutos in 0..59 &&
            segundos in 0..59)
        {
            println("Ingrese valores validos (Horas: 0-23, Minutos: 0-59, Segundos: 0-59)")
        }
    }

    // Constructor de segs de medianoche
    constructor(s : Int) : this(0,0,s)
    {
        setReloj(s)
    }
    init {
        require(segundos >= 0)
    }

    // Lambdas de variables de suma y resta
    private val sumarTiempo : (Int, Int) -> Int = {tiempoReloj, tiempoToAdd ->
        tiempoReloj + tiempoToAdd}
    private val restarTiempo : (Int, Int) -> Int = {tiempoReloj, tiempoRestar ->
        tiempoReloj - tiempoRestar}

    // Convierte segs a horas
    fun setReloj(segsMedianoche : Int){
        //1 min 60 segs - 1 hora 3600 segs
        convertirHora(0,0,segsMedianoche)
    }

    fun tick() {
        segundos += 1
        convertirHora(horas, minutos, segundos)
    }

    fun tickDecrease(){
        segundos -= 1
        convertirHora(horas, minutos, segundos)
    }

    // Agregar reloj a otro reloj
    fun addReloj(reloj: Reloj){
        val horaAdded = sumarTiempo(reloj.horas, this.horas)
        val minsAdded = sumarTiempo(reloj.minutos, this.minutos)
        val segsAdded = sumarTiempo(reloj.segundos, this.segundos)
        convertirHora(horaAdded,minsAdded, segsAdded)
    }

    fun restaReloj(reloj: Reloj){
        val horaSubstracted = restarTiempo(this.horas, reloj.horas)
        val minsSubstracted = restarTiempo(this.minutos, reloj.minutos)
        val segsSubstracted = restarTiempo(this.segundos, reloj.segundos)
        convertirHora(horaSubstracted,minsSubstracted, segsSubstracted)
    }

    override fun toString() : String{
        // %02d con format significa integer de dos digitos, si falta,
        // se completa con 0
        return "[%02d:%02d:%02d]".format(horas, minutos, segundos)
    }

    // Revisa si la hora se pasa o es negativa para convertirla a la hora que tiene que ser
    fun convertirHora(horas: Int, minutos: Int, segs: Int)
    {
        var horas : Int = horas
        var minutos : Int = minutos
        var segs : Int = segs

        // Verificar si es negativo
        if (segs < 0)
        {
            segs += 60
            minutos--
        }
        if (minutos < 0)
        {
            minutos += 60
            horas--
        }
        if (horas < 0)
        {

            horas += 24
        }

        // Si se pasa la hora entra al loop, si no no hace falta
        while(segs > 59)
        {
            segs -= 60
            minutos++
        }
        while(minutos > 59)
        {
            minutos -= 60
            horas++
        }
        while(horas > 23)
        {
            horas -= 24
        }
        this.horas = horas
        this.minutos = minutos
        this.segundos = segs
    }


}
