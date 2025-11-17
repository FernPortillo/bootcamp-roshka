package com.example.juego_topos.data

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import kotlinx.coroutines.CoroutineScope

@Database(entities = [PuntajeEntity::class], version = 1, exportSchema = false)
public abstract class PuntajesDataBase : RoomDatabase()
{
    abstract fun puntajeDao() : PuntajeDAO


    companion object {
        // Singleton prevents multiple instances of database opening at the
        // same time.
        @Volatile
        private var INSTANCE: PuntajesDataBase? = null

        fun getDatabase(
            context: Context,
            scope: CoroutineScope): PuntajesDataBase {
            // if the INSTANCE is not null, then return it,
            // if it is, then create the database
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    PuntajesDataBase::class.java,
                    "puntajes_database"
                ).build()
                INSTANCE = instance
                // return instance
                instance
            }
        }
    }
}
