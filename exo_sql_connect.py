from  mysql.connector import connect, Error
db= connect(
    host = "localhost",
    user = "thomas",
    password = "Thomasc2",
    database = "ecole"
)

def print_values(rows):
    for row in rows:
        print(row)

def select_values(table):
    cursor = db.cursor()
    cursor.execute(f" SELECT * FROM {table}")
    rows = cursor.fetchall()
    cursor.close()
    return rows


"""
print_values(select_values('enseignants'))
(1, 'Jonas', 'Salk', None, 'Biologie', None, 'jsalk@school.org', '777-555-4321', '5')
(3, 'Élise', 'Laurent', 'B202', 'Physique', datetime.date(2023, 5, 15), 'elise.laurent@example.com', '0723456789', 'CL2')
(4, 'Victor', 'Carpentier', 'B203', 'Chimie', datetime.date(2023, 5, 15), 'victor.carpentier@example.com', '0734567890', 'CL1')
"""

def associations():
    etudiants = select_values('etudiants')
    enseignants = select_values('enseignants')

    enseignant_by_class = {}
    for enseignant in enseignants:
        enseignant_by_class[enseignant[8]] = (enseignant[1], enseignant[2])

    associations = {}
    for etudiant in etudiants:
        if etudiant[7]  in enseignant_by_class:
            enseignant_prenom, enseignant_nom = enseignant_by_class[etudiant[7] ]
            enseignant_key = (enseignant_prenom, enseignant_nom)
            if enseignant_key not in associations:
                associations[enseignant_key] = []
            associations[enseignant_key].append((etudiant[1], etudiant[2], etudiant[7] ))
    return associations
associations=associations()
print(associations)
"""
associations=associations()
print(associations)
{('Jonas', 'Salk'): [('Mark', 'Watney', '5')], 
('Victor', 'Carpentier'): [('Alice', 'Dupont', 'CL1'), ('Claire', 'Durand', 'CL1'), ('Emma', 'Bernard', 'CL1'), ('Gabrielle', 'Simon', 'CL1'), ('Isabelle', 'Boucher', 'CL1'), ('Karine', 'Fournier', 'CL1'), ('Marie', 'Lecoq', 'CL1'), ('Océane', 'Garnier', 'CL1'), ('Quentin', 'Pichon', 'CL1'), ('Sophie', 'Fischer', 'CL1')], 
('Élise', 'Laurent'): [('Benoit', 'Martin', 'CL2'), ('David', 'Leroy', 'CL2'), ('François', 'Moreau', 'CL2'), ('Hugo', 'Lemoine', 'CL2'), ('Jules', 'Giraud', 'CL2'), ('Louis', 'Vasseur', 'CL2'), ('Nicolas', 'Delaunay', 'CL2'), ('Pierre', 'Noir', 'CL2'), ('Romain', 'Collet', 'CL2')]}
"""

def nb_nombre_etudiants_prof(associations):
    nb_nombre_etudiants_prof = {}
    for enseignant_key, etudiants in associations.items():
        if enseignant_key in nb_nombre_etudiants_prof:
            nb_nombre_etudiants_prof[enseignant_key] += len(etudiants)
        else:
            nb_nombre_etudiants_prof[enseignant_key] = len(etudiants)
    return nb_nombre_etudiants_prof

print(nb_nombre_etudiants_prof(associations))

"""
associations=associations()
print(nb_nombre_etudiants_prof(associations))
{('Jonas', 'Salk'): 1, 
('Victor', 'Carpentier'): 10, 
('Élise', 'Laurent'): 9}
"""

db.close()