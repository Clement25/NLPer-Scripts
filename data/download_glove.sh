#!/bin/bash

function usage()
{
   cat << HEREDOC
   Usage: ./download_data.sh [--path_dest STR] [--dataset STR] [--preproc STR]
   arguments:
     -p, --path_dest STR    destination path where to download the dataset
     -d, --dataset STR      dataset to be optionally downloaded from the S3 storage directly to ec2 instance
     -r, --preproc STR      the preprocessed version of the main dataset
     -h, --help             show this help message and exit
HEREDOC
}

function download_glove {
    local download_path=$1
    local preproc_dataset=$2

    if [ $preproc_dataset == "50" ]; then
        echo Downloading glove embeddings with dimension 50
        aws s3 cp s3://dataset-store/glove-embeddings/glove.6B.50d.txt.zip $download_path/glove-embeddings/glove.6B.50d.txt.zip
        unzip $download_path/glove-embeddings/glove.6B.50d.txt.zip -d $download_path/glove-embeddings/
        rm -r $download_path/glove-embeddings/__MACOSX
    elif [ $preproc_dataset == "100" ]; then
        echo Downloading glove embeddings with dimension 100
        aws s3 cp s3://dataset-store/glove-embeddings/glove.6B.100d.txt.zip $download_path/glove-embeddings/glove.6B.100d.txt.zip
        unzip $download_path/glove-embeddings/glove.6B.100d.txt.zip -d $download_path/glove-embeddings/
        rm -r $download_path/glove-embeddings/__MACOSX
    elif [ $preproc_dataset == "200" ]; then
        echo Downloading glove embeddings with dimension 200
        aws s3 cp s3://dataset-store/glove-embeddings/glove.6B.200d.txt.zip $download_path/glove-embeddings/glove.6B.200d.txt.zip
        unzip $download_path/glove-embeddings/glove.6B.200d.txt.zip -d $download_path/glove-embeddings/
        rm -r $download_path/glove-embeddings/__MACOSX
    elif [ $preproc_dataset == "300" ]; then
        echo Downloading glove embeddings with dimension 300
        aws s3 cp s3://dataset-store/glove-embeddings/glove.6B.300d.txt.zip $download_path/glove-embeddings/glove.6B.300d.txt.zip
        unzip $download_path/glove-embeddings/glove.6B.300d.txt.zip -d $download_path/glove-embeddings/
        rm -r $download_path/glove-embeddings/__MACOSX
    else
        echo Specified glove embeddings dimension is not supported: 50, 100, 200, 300.
    fi
}

if [ "$download_path" == "" ] || [ "$dataset_name" == "" ]; then
    echo "Not provided required parameters"
    usage
    exit
else
    download_glove $download_path $preproc_dataset
fi

