import json
import os
from datetime import datetime
import random

def load_sample(path):
    with open(path, 'r', encoding='utf-8') as file:
        lines = [line.strip() for line in file if line.strip()]
    return lines

def generate_json(data):
    totals = {}
    for line in data:
        parts = line.split(' ')
        if len(parts) == 3:
            name = parts[0].strip()
            amount_str = parts[2].replace('€', '').strip()

            try:
                amount = float(amount_str)  # Convertit le montant en float
                totals[name] = totals.get(name, 0) + amount
            except ValueError:
                continue  # Ignore les lignes avec des montants invalides

    print("Totaux calculés :", totals)  # Imprime les totaux pour débogage
    return [{'name': name, 'total_sent': total} for name, total in totals.items()]

def save_result(path: str, result: list):
    random_number = random.randint(1, 1000)
    current_datetime = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"result_sample{random_number}_{current_datetime}.json"
    full_path = os.path.join(path, filename)

    with open(full_path, 'w') as json_file:
        json.dump(result, json_file, indent=4)

# Exemple d'utilisation
data_path = r'text.txt'
sample_data = load_sample(data_path)
print("Données chargées :", sample_data)  # Imprime les données chargées pour débogage
json_result = generate_json(sample_data)
save_path = r'.\results'

# Vérifie et crée le dossier results si nécessaire
if not os.path.exists(save_path):
    os.makedirs(save_path)

save_result(save_path, json_result)
