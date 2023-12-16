# -*- coding: utf-8 -*-
"""
Created on Thu Dec 14 19:14:04 2023

@author: Marcos
@title: Predicciones de Ingresos
@desc: Prediccion Precios Bienes Raíces
@solution: RNA
"""

import tensorflow as tf
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# DataFrame
house_df = pd.read_csv("precios_hogares.csv")

# Visualizar
sns.scatterplot(data = house_df, x = 'sqft_living', y = 'price')

# Correlacion
f, ax = plt.subplots(figsize = (20, 20))
sns.heatmap(house_df.corr(), annot = True)

# Limpieza de Datos
selected_features = ['bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'sqft_above', 'sqft_basement']

x = house_df[selected_features]
y = house_df['price']

from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
x_scaled = scaler.fit_transform(x)

#Normalizar Salida
y = y.values.reshape(-1, 1)
y_scaled = scaler.fit_transform(y)

#Entrenamiento
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x_scaled, y_scaled, test_size = 0.25)

#Definir modelo
model = tf.keras.models.Sequential()
model.add(tf.keras.layers.Dense(units=100, activation='relu', input_shape=(7, )))
model.add(tf.keras.layers.Dense(units=100, activation='relu'))
model.add(tf.keras.layers.Dense(units=100, activation='relu'))
model.add(tf.keras.layers.Dense(units=1, activation='linear'))

model.summary()

#Compilado
model.compile(optimizer='Adam', loss='mean_squared_error')
epochs_hist = model.fit(x_train, y_train, epochs = 100, batch_size = 50, validation_split = 0.2)

#Evaluando Modelo
epochs_hist.history.keys()

#Grafico
plt.plot(epochs_hist.history['loss'])
plt.plot(epochs_hist.history['val_loss'])
plt.title('Progreso de perdida durante entrenamiento')
plt.xlabel('Epoch')
plt.ylabel('Perdida de entrenamiento y Validacion')
plt.legend(['Perdida de entrenamiento', 'Perdida de Validacion'])

#Prediccion
#Definir hogar por predecir con su input
#'bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors', 'sqft_above', 'sqft_basement'
x_test_1 = np.array([[4, 3, 1960, 5000, 1, 2000, 3000]])

scaler_1 = MinMaxScaler()
x_test_scaled_1 = scaler_1.fit_transform(x_test_1)

y_predict_1 = model.predict(x_test_scaled_1)

#Revertir escalado
y_predict_1 = scaler.inverse_transform(y_predict_1)

print(y_predict_1)


