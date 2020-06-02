import deepchem as dc
import numpy as np
import pandas as pd
from rdkit import Chem

# load data as pandas DataFrame
dataset_file="tox21.csv"
df = pd.read_csv(dataset_file)

# get all molecule smiles from the smiles column
mols = [Chem.MolFromSmiles(smile) for smile in df['smiles']]

for i, s in df['smiles'].items():
    print(i, s)

# featurize all molecules
feat = dc.feat.RDKitDescriptors()
matrix = feat.featurize(mols)
featname = dc.feat.RDKitDescriptors.allowedDescriptors

# create a DataFrame 
newdata=pd.DataFrame(data=matrix,columns=featname)

# append the mol_id 
#newdata.insert(0,'mol_id',df['mol_id'], True)

# output to file
newdata.to_csv('tox21-features.csv', index=False)

print(newdata.shape)
