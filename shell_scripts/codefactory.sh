#all this publishing config depends on using code factory as your pip server.

aws codeartifact login --tool pip --repository pypi.tonyfraser --domain ******* --domain-owner ****** --region us-east-1
aws codeartifact login --tool twine --repository pypi.tonyfraser --domain ******  --domain-owner ***** --region us-east-1
