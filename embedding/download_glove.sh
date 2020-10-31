#!/bin/sh

function usage
{
   cat << HEREDOC
   Usage: ./download_data.sh [--path_dest STR] [--preproc STR]
   arguments:
     -p, --path_dest STR    destination path where to download the dataset
     -r, --preproc STR      the preprocessed version of the main dataset
     -h, --help             show this help message and exit
HEREDOC
}

function download_glove
{
    local download_path=$1
    local preproc_dataset=$2

    if [[ $preproc_dataset == "50" ]]; then
        echo Downloading glove embeddings with dimension 50
        wget http://nlp.stanford.edu/data/glove.840B.50d.zip -O $download_path/glove.6B.50d.txt.zip
        unzip $download_path/glove.6B.50d.txt.zip -d $download_path
    elif [[ $preproc_dataset == "100" ]]; then
        echo Downloading glove embeddings with dimension 100
        wget http://nlp.stanford.edu/data/glove.840B.100d.zip -O $download_path/glove.6B.100d.txt.zip
        unzip $download_path/glove.6B.100d.txt.zip -d $download_path
    elif [[ $preproc_dataset == "200" ]]; then
        echo Downloading glove embeddings with dimension 200
        wget http://nlp.stanford.edu/data/glove.840B.200d.zip -O $download_path/glove.6B.200d.txt.zip
        unzip $download_path/glove.6B.200d.txt.zip -d $download_path
    elif [[ $preproc_dataset == "300" ]]; then
        echo Downloading glove embeddings with dimension 300
        wget http://nlp.stanford.edu/data/glove.840B.300d.zip -O $download_path/glove.6B.300d.txt.zip
        unzip $download_path/glove.6B.300d.txt.zip -d $download_path
    else
        echo Specified glove embeddings dimension is not supported: 50, 100, 200, 300.
        echo $preproc_dataset
        echo $download_path
    fi
}

download_path=$1
preproc_dataset=$2

if [ "$download_path" == "" ] || [ "$preproc_dataset" == "" ]; then
    echo "Not provided required parameters"
    usage
    exit
else
    download_glove $download_path $preproc_dataset
fi

