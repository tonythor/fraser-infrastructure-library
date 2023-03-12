# tony fraser's python infrastructure scaffolding project. 
Running on pyscaffold 4, this project  contains things like pyspark, pandas, argv, etc. In an object oriented way, this is should be a good  tool for bootstraping data loading for other projects. 


## project set up
### 1 download
git clone wherever you want to run this project from

### 2 build your venv

```
python3 -m venv .venv     # build your project virtual env
source .venv/bin/activate # activate your virual env
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r ./requirements.txt
```

### 3 install java if you don't have it already! 
There's a package in here called install_jdk. This might run for you, and it's an easy way to get 
a pyton compatible version of jva in your home directory. 
```
(.venv) hurricane:src afraser$ ipython
Python 3.10.8 (main, Oct 21 2022, 22:22:30) [Clang 14.0.0 (clang-1400.0.29.202)]
Type 'copyright', 'credits' or 'license' for more information
IPython 8.9.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: import jdk
   ...: jdk.install('11')

```
### 4 add spark jars
set up your spark home and put drop all the s3 jars in.
- run ./shell_scirpts//download_spark_jars.sh
- mv ./lib/*.jar into /Users/****/Documents/src/pyspark-env/.venv/lib/python3.1**0**/site-packages/pyspark/lib/. 


### 5 adjust venv activate env
add to .venv/bin/activate, mabe it about like this.

```
export VIRTUAL_ENV * this line exits, add below ** 
export JAVA_HOME="/Users/********/.jdk/jdk-11.0.18+10/Contents/Home"
export SPARK_HOME="/Users/********/Documents/src/infrastructure/.venv/lib/python3.11/site-packages/pyspark"
export PYTHONPATH="/Users/********/Documents/src/infrastructure/src:/Users/********/Documents/src/infrastructure/.venv/lib/python3.11/site-packages"
```


### 6 test spark with real data
Test local first, then try to load something from one of your s3 buckets. Use s3a. !! 


```
cd ./src
ipython

In [1]: from fraser.infrastructure.bootstrap import Bootstrap
   ...: b = Bootstrap()
   ...: spark = b.get_spark()
   ...: spark.read.option("Header", True).csv("../sample_data/titanic.csv").show(2)
   ...: spark.read.csv("s3a://tonyfraser-data/delayed_flights/*.csv").show(3)
```


### Push to your code factory repo
First, see the ./shell_scripts/codefactory.sh file. You need to set up your own code factory, then youc an use the following commands.
```
tox -e clean
tox -e build
tox -e publish
```

