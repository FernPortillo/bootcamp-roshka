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
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.lifecycle.viewmodel.viewModelFactory
import com.example.compose.LoginTheme
import com.example.login.data.SharedPrefsRepository
import com.example.login.model.LoginViewModel
import com.example.login.model.RegisterViewModel
import com.example.login.ui.theme.pantallas.loginScreen
import com.example.login.ui.theme.pantallas.layoutRegistro
import com.example.login.ui.theme.pantallas.pantallaExito

sealed class Screen{
    object Login : Screen()
    object Register : Screen()
    object Exito : Screen()
}
class MainActivity : ComponentActivity() {

    // Lazy no llama la lambda hasta que el objeto es accedido
    private val sharedPreferences: SharedPrefsRepository by lazy()
    {
        SharedPrefsRepository(applicationContext)
    }

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
                    registerViewModel = registerViewModel
                )
            }
        }
    }
}

@Composable
fun navigatorApp(
    loginViewModel: LoginViewModel,
    registerViewModel: RegisterViewModel
)
{
    var currentScreen by remember { mutableStateOf<Screen>(Screen.Login) }

    when (val screen = currentScreen)
    {
        is Screen.Login ->
        {
            loginScreen(
                viewModel = loginViewModel,
                onNavegarRegistro = { currentScreen = Screen.Register },
                onLoginExitoso = { currentScreen = Screen.Exito },
            )
        }
        is Screen.Register -> {
            layoutRegistro(
                viewModel = registerViewModel,
                onNavegarLogin = { currentScreen = Screen.Login }
            )
        }
        is Screen.Exito -> pantallaExito(modifier = Modifier)
    }
}

