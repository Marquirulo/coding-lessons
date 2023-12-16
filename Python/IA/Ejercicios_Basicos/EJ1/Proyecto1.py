#Proyecto1 - Conversor ºC ºF
'''
Usaremos "Regresión" esto es una tecnica en la cual tu dispones de un gráfico XY X=VariableIndependiente Y=VariableDependiente
'''

import tensorflow as tf
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

#Importando Datos
temperatura_df = pd.read_csv("Proyecto1.csv")


#Visualización
sns.scatterplot(data = temperatura_df, x= 'Celsius', y = 'Fahrenheit')

#Cargando Set de Datos
x_train = temperatura_df['Celsius']
y_train = temperatura_df['Fahrenheit']

#Creando el Modelo
model = tf.keras.Sequential() #Crea un modelo capa a capa
model.add(tf.keras.layers.Dense(units=1, input_shape=[1])) #Creo la primera capa

#model.summary() #Visualizar el Modelo

#Compilado
model.compile(optimizer=tf.keras.optimizers.Adam(0.5), loss='mean_squared_error')

#Entrenando el modelo
epochs_hist = model.fit(x_train, y_train, epochs = 300) #Los epochs son como "ciclos" de lectura de todos los valores de la variable

#Evaluación del modelo

epochs_hist.history.keys()

#Grafico
plt.plot(epochs_hist.history['loss'])
plt.title('Progreso de perdida durante entrenamiento del modelo')
plt.xlabel('Epoch')
plt.ylabel('Perdida de entrenamiento')
plt.legend('Perdida de entrenamiento')

model.get_weights()

#Predicciones
Temp_C = 40
Temp_F = model.predict([Temp_C])
print('La temperatura en F es: ')
print(Temp_F)

#Temp_F = 9/5 * Temp_C + 32
#print(Temp_F)