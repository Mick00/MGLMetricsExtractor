# MGLMetricsExtractor

This is meant to be use with a folder of MetaModels extracted using 
[FamixTypeScripImporter](https://github.com/Arezoo-Nasr/FamixTypeScriptImporter) or 
[this extractor which loops through commits](https://github.com/brunoll/mgl843_equipe3)

## How to use:
1. Install this repo using Iceberg.
2. Put your folder with the meta-models inside you pharo VM.
3. Open a playground and use the following code to generate the .csv file. Replace `folder-with-commits` with the path to your folder with the meta-models and `extracted-metrics.csv` with your desired name for the output file.
```
extractor := MGLMetricsExtractor new path: 'folder-with-commits'.
extractor extractTo: 'extracted-metrics.csv'
```
