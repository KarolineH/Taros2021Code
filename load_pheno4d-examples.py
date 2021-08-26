import os
import numpy as np
import pickle

data_directory = os.path.join('/media', 'user','Data','karo','datasets', 'Pheno4D')
outpth = os.path.join('/media', 'user','Data','karo','datasets', 'Pheno4D', 'karo_pickles')

plants = os.listdir(data_directory)
maize_plants = [plant for plant in plants if 'Maize' in plant]
tomato_plants = [plant for plant in plants if 'Tomato' in plant]
datasets = []
for set in [maize_plants,tomato_plants]:
    for i,plant in enumerate(set):
        if i > 2:
            break
        records = os.listdir(os.path.join(data_directory, plant))
        annotated_records = [record for record in records if '_a' in record]
        for j,rec in enumerate(annotated_records):
            if j > 1:
                break
            print('Opening file %s'%(rec))
            path = os.path.join(data_directory, plant, rec)
            file = open(path,"r")
            content = file.read()
            lines = content.split('\n') # split into a list single rows
            if lines[-1] == '': # trim the last row off if it is empty
                lines = lines[:-1]
            raw = lines
            coordinates = np.array([[float(entry)for entry in line.split(' ')[:3]] for line in raw])
            file = os.path.join(outpth, '{}plant{}.pickle'.format(rec,i))
            pickle.dump( coordinates, open( file, "wb" ))
