package com.example.juego_topos.data.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.juego_topos.data.dao.PuntajeDAO
import com.example.juego_topos.data.dao.UsersDAO
import com.example.juego_topos.data.entities.PuntajeEntity
import com.example.juego_topos.data.entities.UsuarioEntity
import kotlinx.coroutines.CoroutineScope

@Database(entities = [PuntajeEntity::class, UsuarioEntity::class], version = 3, exportSchema = false)
public abstract class AppDataBase : RoomDatabase()
{
    abstract fun puntajeDao() : PuntajeDAO
    abstract fun usersDao() : UsersDAO

    companion object {
        // Singleton prevents multiple instances of database opening at the
        // same time.
        @Volatile
        private var INSTANCE: AppDataBase? = null

        fun getDatabase(context: Context, scope: CoroutineScope): AppDataBase {
            // if the INSTANCE is not null, then return it,
            // if it is, then create the database
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDataBase::class.java,
                    "puntajes_database"
                ).fallbackToDestructiveMigration(true)
                    .build()
                INSTANCE = instance
                // return instance
                instance
            }
        }
    }
}
