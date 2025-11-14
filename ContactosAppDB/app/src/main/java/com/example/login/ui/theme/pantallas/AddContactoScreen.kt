package com.example.login.ui.theme.pantallas

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.example.login.R
import com.example.login.composables.Customs.getCustomLoginTextField
import com.example.login.composables.visibleField
import com.example.login.model.ContactosViewModel

@Composable
fun AddContactoFields(viewModel : ContactosViewModel,
                      onNavegarAtras : () -> Unit,
                      modifier : Modifier = Modifier)
{
    val contactoNuevo by viewModel.contactoNuevo.collectAsState()
    val esValido = viewModel.contactoEsValido()

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
                onClick = {
                    viewModel.limpiarFormulario()
                    onNavegarAtras() },
                modifier = Modifier
                    .background(
                        color = MaterialTheme.colorScheme.secondaryContainer,
                        shape = RoundedCornerShape(16.dp)
                    )
                    .align(Alignment.CenterStart)


            ) {
                Icon(
                    imageVector = Icons.AutoMirrored.Filled.ArrowBack,
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
            contactoNuevo.nombre,
            stringResource(R.string.nombre),
            onValueChange = { viewModel.updateNombre(it)},
            modifier
        )
        visibleField(
            contactoNuevo.apellido,
            stringResource(R.string.apellido),
            onValueChange = { viewModel.updateApellido(it)},
            modifier
        )

        visibleField(
            contactoNuevo.email,
            stringResource(R.string.email),
            onValueChange = { viewModel.updateEmail(it)},
            modifier
        )

        textFieldEdad(
            contactoNuevo.edad,
            stringResource(R.string.edad),
            onValueChange = { viewModel.updateEdad(it)},
            modifier
        )

        Button(
            onClick = {
                viewModel.guardarContacto()
                viewModel.limpiarFormulario()
                onNavegarAtras()
            },
            enabled = esValido,
            modifier = Modifier
                .padding(top = 50.dp)
        ) {
            Text("Guardar")
        }
    }
}


@Composable
fun textFieldEdad(
    value : Int?,
    usedFor : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier)
{
    TextField(
        // Usar el ? para permitir que llame a value incluso si es null
        // el elvis permite modificar
        value = value?.toString() ?: "",
        onValueChange = onValueChange,
        label = {Text(usedFor)},
        singleLine = true,
        colors = getCustomLoginTextField(),
        modifier = modifier
            .padding(top = 50.dp)
            .fillMaxWidth(),
    )
}
