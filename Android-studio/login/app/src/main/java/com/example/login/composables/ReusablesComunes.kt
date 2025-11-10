package com.example.login.composables

import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.annotation.StringRes
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.TextField
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import com.example.login.R
import com.example.login.composables.Customs.getCustomLoginTextField


@Composable
fun visibleField(
    value : String,
    usedFor : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier)
{
    TextField(
        value = value,
        onValueChange = onValueChange,
        label = {Text(usedFor)},
        singleLine = true,
        colors = getCustomLoginTextField(),
        modifier = Modifier
            .padding(top = 50.dp)
            .fillMaxWidth(),
        )
}
@Composable
fun passField(
    value : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier)
{
    var visibilityOff by remember { mutableStateOf(true) }
    TextField(
        value = value,
        onValueChange = onValueChange,
        label = {Text(stringResource(R.string.password))},
        singleLine = true,
        colors = getCustomLoginTextField(),
        visualTransformation = if (visibilityOff) PasswordVisualTransformation() else VisualTransformation.None,
        trailingIcon = {
            IconButton(onClick = { visibilityOff = !visibilityOff })
            {
                Icon(
                    painter = painterResource(if (visibilityOff) R.drawable.visibility else R.drawable.visibility_off),
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onSurface,)
            }
        },
        modifier = Modifier.padding(top = 50.dp)
            .fillMaxWidth(),

        )
}

@Composable
fun RegisterDialog(
    onExitDialog: () -> Unit,
    modifier: Modifier = Modifier
) {
    AlertDialog(
        onDismissRequest = {

        },
        title = { Text(stringResource(R.string.registrado)) },
        text = { Text(stringResource(R.string.registro_correcto)) },
        modifier = modifier,

        confirmButton = {
            TextButton(onClick = onExitDialog) {
                Text(stringResource(R.string.entendido))
            }
        }
    )
}

@Composable
fun ErrorDialog(
    title : Int,
    desc : Int,
    onExitDialog: () -> Unit,
    modifier: Modifier = Modifier
) {
    AlertDialog(
        onDismissRequest = {
        },
        title = { (Text(stringResource(title))) },
        text = { (Text(stringResource(desc))) },
        modifier = modifier,

        confirmButton = {
            TextButton(onClick = onExitDialog) {
                Text(stringResource(R.string.entendido))
            }
        }
    )
}

