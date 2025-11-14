package com.example.login.data

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.sqlite.db.SupportSQLiteDatabase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch

// Annotates class to be a Room Database with a table (entity) of the Word class
@Database(entities = [ContactoEntity::class], version = 1, exportSchema = false)
public abstract class ContactosDataBase : RoomDatabase() {

    abstract fun contactoDAO(): ContactoDAO


    private class ContactosDataBaseCallback(
        private val scope: CoroutineScope
    ) : RoomDatabase.Callback() {

        override fun onCreate(db: SupportSQLiteDatabase) {
            super.onCreate(db)
            INSTANCE?.let { database ->
                scope.launch {
                    var dao = database.contactoDAO()
                    dao.insert(
                        ContactoEntity(
                            nombre = "user2",
                            apellido = "user2",
                            edad = 25,
                            email = "fkjnsdkfhd@ksdskdf.com",
                            fotoUri = null
                        )
                    )
                    // Propagar

                }
            }
        }
    }


    companion object {
        // Singleton prevents multiple instances of database opening at the
        // same time.
        @Volatile
        private var INSTANCE: ContactosDataBase? = null

        fun getDatabase(
            context: Context,
            scope: CoroutineScope): ContactosDataBase {
            // if the INSTANCE is not null, then return it,
            // if it is, then create the database
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    ContactosDataBase::class.java,
                    "contactos_database"
                ).addCallback(ContactosDataBaseCallback(scope))
                    .build()
                INSTANCE = instance
                // return instance
                instance
            }
        }
    }
}
