BD_USUARIO='administrador'
BD_PASS='1234'
BD_NOMBRE='musick'
BD_SCRIPT_1='resources/BaseDeDatos/tablas.sql'

mysql -u $BD_USUARIO -p$BD_PASS $BD_NOMBRE < $BD_SCRIPT_1
