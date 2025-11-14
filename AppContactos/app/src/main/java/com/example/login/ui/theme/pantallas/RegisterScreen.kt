package com.example.login.ui.theme.pantallas

import android.view.RoundedCorner
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Clear
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.login.composables.ErrorDialog
import com.example.login.composables.passField
import com.example.login.composables.RegisterDialog
import com.example.login.composables.visibleField
import com.example.login.data.SharedPrefsRepository
import com.example.login.model.RegisterViewModel
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import com.example.compose.LoginTheme
import com.example.login.R
import com.example.login.model.RegistroUiState

@Composable
fun layoutRegistro(
    viewModel: RegisterViewModel,
    onNavegarLogin: () -> Unit,
    modifier: Modifier = Modifier
    )
{

    when(viewModel.uiState)
    {
        is RegistroUiState.Exito -> {
            RegisterDialog(
                onExitDialog = {
                    viewModel.resetState()
                    onNavegarLogin()
                }
            )
        }
        is RegistroUiState.Error -> {
            ErrorDialog(
                R.string.error,
                R.string.correo_pass_vacio,
                onExitDialog = { viewModel.resetState() }
            )
        }
        else -> {}
    }
    Surface(
        color = MaterialTheme.colorScheme.background
    ){
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .safeDrawingPadding()
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        )
        {
            RegisterFields(viewModel, onNavegarLogin, modifier)
        }
    }
}


@Composable
private fun RegisterFields(
    viewModel: RegisterViewModel,
    onNavegarLogin: () -> Unit,
    modifier: Modifier
) {
    Column(
        modifier
            .padding(horizontal = 16.dp)
            .fillMaxWidth(0.9f),
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        ) {
            IconButton(
                onClick = onNavegarLogin,
                modifier = Modifier
                    .background(color = MaterialTheme.colorScheme.secondaryContainer,
                        shape = RoundedCornerShape(16.dp))
                    .align(Alignment.CenterStart)


            ) {
                Icon(
                    imageVector = Icons.Default.Clear,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onSecondaryContainer
                )
            }

            Text(
                text = stringResource(R.string.registrarse),
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.align(Alignment.Center),
            )
        }

        visibleField(
            viewModel.userName,
            stringResource(R.string.user),
            onValueChange = { viewModel.actualizarUser(it)},
            modifier
        )

        visibleField(
            viewModel.email,
            stringResource(R.string.correo),
            onValueChange = { viewModel.actualizarEmail(it)},
            modifier
        )

        passField(
            viewModel.pass,
            onValueChange = { viewModel.actualizarPass(it)  },
            modifier
        )

        Button(
            onClick = {
                viewModel.onRegisterClick() },
            modifier
                .padding(top = 50.dp)
        ) {
            Text(stringResource(R.string.registrarse))
        }
    }
}


@Composable
@Preview(
    showSystemUi = true,
    showBackground = true,
    device = Devices.PIXEL_7_PRO)
fun PreviewRegister()
{
    LoginTheme{
        val context = LocalContext.current
        val repository = SharedPrefsRepository(context)
        val viewModel = RegisterViewModel(repository)

        layoutRegistro(
            viewModel,
            onNavegarLogin = { }
        )
    }
}




