

# cur = db.cursor()
# cur.execute("SELECT * FROM enseignants;")
# resultat = cur.fetchall()
# for i in resultat:
#     print(i)
from  mysql.connector import connect, Error
db= connect(
    host = "localhost",
    user = "thomas",
    password = "Thomasc2",
    database = "ecole"
)

def fetch_data(connection):
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM etudiants;")
        etudiants = cursor.fetchall()
        cursor.execute("SELECT * FROM enseignants;")
        enseignants = cursor.fetchall()
        return etudiants, enseignants

connection = db

etudiants, enseignants = fetch_data(db)

for i in fetch_data(db):
    i=list(i)
    print(i)

association = [
    (etudiant, enseignant)
    for etudiant in etudiants
    for enseignant in enseignants
    if etudiant[7] == enseignant[8]
]

print(association)

eleves_par_enseignant = {}

for etudiant, enseignant in association:
    enseignant_nom = enseignant[1]
    if enseignant_nom in eleves_par_enseignant:
        eleves_par_enseignant[enseignant_nom] += 1
    else:
        eleves_par_enseignant[enseignant_nom] = 1

for enseignant, nombre_eleves in eleves_par_enseignant.items():
    print(f"Enseignant: {enseignant} a {nombre_eleves} élèves.")

db.close()