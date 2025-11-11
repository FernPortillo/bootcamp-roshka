package com.example.login

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.activity.viewModels
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.lifecycle.viewmodel.viewModelFactory
import androidx.room.Database
import androidx.room.RoomDatabase
import com.example.compose.LoginTheme
import com.example.login.data.ContactoEntity
import com.example.login.data.ContactosDataBase
import com.example.login.model.ContactoViewModelFactory
import com.example.login.model.ContactosViewModel
import com.example.login.repository.SharedPrefsRepository
import com.example.login.model.LoginViewModel
import com.example.login.model.RegisterViewModel
import com.example.login.repository.ContactosRepository
import com.example.login.ui.theme.pantallas.AddContactoFields
import com.example.login.ui.theme.pantallas.ContactosLayout
import com.example.login.ui.theme.pantallas.LoginScreen
import com.example.login.ui.theme.pantallas.LayoutRegistro
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob
import kotlin.getValue

sealed class Screen{
    object Login : Screen()
    object Register : Screen()
    object Contactos : Screen()
    object AddContacto : Screen()
}
class MainActivity : ComponentActivity() {

    // Lazy no llama la lambda hasta que el objeto es accedido
    private val sharedPreferences: SharedPrefsRepository by lazy()
    {
        SharedPrefsRepository(applicationContext)
    }

    private val applicationScope = CoroutineScope(SupervisorJob())

    private val contactosDatabase : ContactosDataBase by lazy()
    {
        ContactosDataBase.getDatabase(applicationContext, applicationScope)
    }

    private val contactosRepository : ContactosRepository by lazy {
        ContactosRepository(contactosDatabase.contactoDAO())
    }

    private val contactosViewModel: ContactosViewModel by viewModels {
        viewModelFactory {
            addInitializer(ContactosViewModel::class) {
                ContactosViewModel(contactosRepository)
            }
        }
    }


    // Para inicializar un viewModel que necesita parametro
    private val loginViewModel : LoginViewModel by viewModels{
        viewModelFactory {
            addInitializer(LoginViewModel::class)
            {
                LoginViewModel(sharedPreferences)
            }
        }
    }

    private val registerViewModel : RegisterViewModel by viewModels{
        viewModelFactory {
            addInitializer(RegisterViewModel::class)
            {
                RegisterViewModel(sharedPreferences)
            }
        }
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        // No olvidar de iniciar las sharedPrefs
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            LoginTheme{
                navigatorApp(
                    loginViewModel = loginViewModel,
                    registerViewModel = registerViewModel,
                    contactosViewModel = contactosViewModel
                )
            }
        }
    }
}

@Composable
fun navigatorApp(
    loginViewModel: LoginViewModel,
    registerViewModel: RegisterViewModel,
    contactosViewModel: ContactosViewModel
)
{
    var currentScreen by remember { mutableStateOf<Screen>(Screen.Login) }

    when (val screen = currentScreen)
    {
        is Screen.Login ->
        {
            LoginScreen(
                viewModel = loginViewModel,
                onNavegarRegistro = { currentScreen = Screen.Register },
                onLoginExitoso = { currentScreen = Screen.Contactos },
            )
        }
        is Screen.Register -> {
            LayoutRegistro(
                viewModel = registerViewModel,
                onNavegarLogin = { currentScreen = Screen.Login }
            )
        }
        is Screen.Contactos ->
        {
            ContactosLayout(
                viewModel = contactosViewModel,
                onAddContacto = { currentScreen = Screen.AddContacto},
                modifier = Modifier)
        }
        is Screen.AddContacto -> {
            AddContactoFields(
                viewModel = contactosViewModel,
                onNavegarAtras = { currentScreen = Screen.Contactos }
            )
        }
    }
}

