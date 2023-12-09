#Proyecto1 - Conversor ºC ºF
'''
Usaremos "Regresión" esto es una tecnica en la cual tu dispones de un gráfico XY X=VariableIndependiente Y=VariableDependiente
'''

import tensorflow as tf
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

#Importando datos
temperatura_df = pd.read_csv("../Datos/Ejercicios_Basicos/Proyecto1.csv")

#Visualizar
sns.scatterplot(temperatura_df)