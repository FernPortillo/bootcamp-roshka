package com.example.juego_topos.composables

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import com.example.juego_topos.R


@Composable
fun VisibleTextField(
    valor : String,
    useForLabel : String,
    onValueChange:(String) -> Unit,
    )
{
    TextField(
        value = valor,
        onValueChange = onValueChange,
        label = { Text(useForLabel) },
        singleLine = true,
        modifier = Modifier
            .padding(top = 32.dp)
            .fillMaxWidth()
    )
}

@Composable
fun PasswordTextFieldConSelectorVisibilidad(
    valor: String,
    onValueChange: (String) -> Unit
)
{var visibilityOff by remember { mutableStateOf(true) }
    TextField(
        value = valor,
        onValueChange = onValueChange,
        label = {Text("Password")},
        singleLine = true,
        visualTransformation = if (visibilityOff) PasswordVisualTransformation() else VisualTransformation.None,
        trailingIcon = {
            IconButton(onClick = { visibilityOff = !visibilityOff }) // android studio tekaka ((falso positivo))
            {
                Icon(
                    painter = painterResource(if (visibilityOff) R.drawable.visibility else R.drawable.visibility_off),
                    contentDescription = null,)}
        },
        modifier = Modifier
            .padding(top = 32.dp)
            .fillMaxWidth(),

        )
}