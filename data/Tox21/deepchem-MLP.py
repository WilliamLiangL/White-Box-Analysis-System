import deepchem as dc
import numpy as np

tox21_tasks, tox21_datasets, transformers = dc.molnet.load_tox21()

train_dataset, valid_dataset, test_dataset = tox21_datasets

print(train_dataset.X.shape, train_dataset.y.shape)
print(valid_dataset.X.shape, valid_dataset.y.shape)
print(test_dataset.X.shape, test_dataset.y.shape)

model = dc.models.MultitaskClassifier(n_tasks=12, 
        n_features=1024,
        layer_sizes=[1000])

model.fit(train_dataset, nb_epoch=10)

metric = dc.metrics.Metric(dc.metrics.roc_auc_score, np.mean)

train_scores = model.evaluate(train_dataset, [metric], transformers)
test_scores = model.evaluate(test_dataset, [metric], transformers)

print(train_scores)
print(test_scores)

#{'mean-roc_auc_score': 0.9786872705119988}
#{'mean-roc_auc_score': 0.7669967038867475}

