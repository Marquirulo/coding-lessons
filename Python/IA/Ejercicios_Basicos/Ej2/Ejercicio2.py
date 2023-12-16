# -*- coding: utf-8 -*-
"""
Created on Thu Dec 14 19:14:04 2023

@author: Marcos
@title: Predicciones de Ingresos
@desc: Auditoria empresa de helados, prediccion ventas segun temperatura
@solution: RNA
"""

import tensorflow as tf
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# Impooertando datos
ventas_df = pd.read_csv("datos_de_ventas.csv")

# Visualizacion
sns.scatterplot(data = ventas_df, x = "Temperature", y = "Revenue")


# Crear set de entreno
x_train = ventas_df['Temperature']
y_train = ventas_df['Revenue']

# Crear modelo
model = tf.keras.Sequential()
model.add(tf.keras.layers.Dense(units=1, input_shape=[1]))

model.summary()

model.compile(optimizer=tf.keras.optimizers.Adam(0.1), loss='mean_squared_error')

# Entreno
epochs_hist = model.fit(x_train, y_train, epochs = 1000)

keys = epochs_hist.history.keys()

# Grafico de entreno del modelo
plt.plot(epochs_hist.history['loss'])
plt.title('Progreso de perdida durante entrenamiento del modelo')
plt.xlabel('Epoch')
plt.ylabel('Perdida de entrenamiento')
plt.legend(['Perdida de entrenamiento'])

weights = model.get_weights()
print(weights)

# Prediccion
Temp = 50
Revenue = model.predict([Temp])
print('La ganancia según la RNA sera de: ', Revenue)

#Grafico de Prediccion
plt.scatter(x_train, y_train, color ='gray')
plt.plot(x_train, model.predict(x_train), color='red')
plt.xlabel('Temperatura [ºC]')
plt.ylabel('Ganancia [$]')
plt.title('Ganancia Generada vs. Temperatura @Empresa de Helados')
