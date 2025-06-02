from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

# Configuración de la base de datos
db_config = {
    'user': 'asir_user',
    'password': 'asir_pass',
    'host': 'mysql-service',
    'database': 'asir_project'
}

@app.route('/users', methods=['GET'])
def list_users():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Usuarios;')
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(users)

@app.route('/projects', methods=['POST'])
def create_project():
    data = request.json
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Proyectos (titulo, descripcion) VALUES (%s, %s)',
        (data['titulo'], data.get('descripcion', ''))
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'status': 'created'}), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)